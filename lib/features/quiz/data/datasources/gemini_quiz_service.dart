import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/question_entity.dart';

class GeminiQuizService {
  final http.Client _client;

  GeminiQuizService({http.Client? client}) : _client = client ?? http.Client();

  /// Call Gemini 1.5/2.0 API with structured JSON output schema
  Future<List<QuestionEntity>> fetchMCQs({
    required String apiKey,
    required List<String> sections,
    required String difficulty,
    required int count,
    List<String> avoidQuestionSummaries = const [],
  }) async {
    if (apiKey.trim().isEmpty) {
      debugPrint('Gemini API key is empty. Using curated offline question bank.');
      return _getCuratedFallbackQuestions(sections, difficulty, count);
    }

    final sectionsStr = sections.contains(AppConstants.sectionMixed)
        ? AppConstants.allSections.join(', ')
        : sections.join(', ');

    final avoidPrompt = avoidQuestionSummaries.isNotEmpty
        ? '\nDO NOT generate questions similar to or repeating any of these recently seen questions:\n${avoidQuestionSummaries.take(20).map((q) => '- $q').join('\n')}'
        : '';

    final promptText = '''
You are a Staff Mobile Engineering Interviewer at a Tier-1 tech company.
Generate exactly $count high-quality, realistic multiple choice interview questions (MCQs) for mobile engineering candidates.

Requirements:
- Target Difficulty: $difficulty level candidate.
- Sections: $sectionsStr.
- Topics should be realistic for mobile engineering interviews (e.g., Dart event loop, Flutter RenderObjects & RepaintBoundary, Kotlin Coroutines dispatchers/flow/channels, Jetpack Compose recomposition & SubcomposeLayout, Mobile System Design cache/offline sync/pagination/battery optimization, DSA for mobile).
$avoidPrompt

Output MUST be a JSON array of objects strictly matching this schema:
[
  {
    "section": "Flutter & Dart" | "Native Android (Kotlin, Coroutines & Compose)" | "System Design & Architecture" | "DSA & Problem Solving",
    "topic": "e.g. Coroutine Dispatchers, Flutter Element Tree, LRU Cache, State Recomposition",
    "interviewStyle": "Technical Conceptual" | "Code Snippet Analysis" | "Architecture Tradeoff",
    "question": "Question text...",
    "options": ["Option A", "Option B", "Option C", "Option D"],
    "correctOptionIndex": 0, // integer 0 to 3
    "explanation": "Detailed professional explanation of why this answer is correct and why the alternatives are sub-optimal."
  }
]
''';

    final modelsToTry = [
      'gemini-1.5-flash',
      'gemini-2.0-flash',
      'gemini-1.5-pro',
    ];

    Exception? lastException;
    for (final model in modelsToTry) {
      try {
        final url = Uri.parse(
          '${AppConstants.geminiEndpoint}/$model:generateContent?key=${apiKey.trim()}',
        );

        final requestBody = jsonEncode({
          'contents': [
            {
              'role': 'user',
              'parts': [
                {'text': promptText}
              ]
            }
          ],
          'generationConfig': {
            'temperature': 0.7,
            'topP': 0.95,
            'response_mime_type': 'application/json',
            'response_schema': {
              'type': 'ARRAY',
              'items': {
                'type': 'OBJECT',
                'properties': {
                  'section': {'type': 'STRING'},
                  'topic': {'type': 'STRING'},
                  'interviewStyle': {'type': 'STRING'},
                  'question': {'type': 'STRING'},
                  'options': {
                    'type': 'ARRAY',
                    'items': {'type': 'STRING'},
                    'minItems': 4,
                    'maxItems': 4,
                  },
                  'correctOptionIndex': {'type': 'INTEGER'},
                  'explanation': {'type': 'STRING'},
                },
                'required': [
                  'section',
                  'topic',
                  'interviewStyle',
                  'question',
                  'options',
                  'correctOptionIndex',
                  'explanation',
                ]
              }
            }
          }
        });

        final response = await _client.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: requestBody,
        );

        if (response.statusCode == 200) {
          final decoded = jsonDecode(response.body) as Map<String, dynamic>;
          final candidates = decoded['candidates'] as List<dynamic>?;
          if (candidates != null && candidates.isNotEmpty) {
            final content = candidates[0]['content'] as Map<String, dynamic>?;
            final parts = content?['parts'] as List<dynamic>?;
            if (parts != null && parts.isNotEmpty) {
              final rawJsonText = parts[0]['text'] as String?;
              if (rawJsonText != null && rawJsonText.trim().isNotEmpty) {
                final list = jsonDecode(rawJsonText) as List<dynamic>;
                final results = list.map((item) {
                  return QuestionEntity.fromJson(item as Map<String, dynamic>);
                }).toList();

                if (results.isNotEmpty) {
                  return results;
                }
              }
            }
          }
        } else {
          debugPrint('Gemini model $model returned HTTP ${response.statusCode}: ${response.body}');
          lastException = Exception('Gemini API error ${response.statusCode}: ${response.body}');
        }
      } catch (e) {
        debugPrint('Gemini model $model failed with error: $e');
        lastException = Exception(e.toString());
      }
    }

    debugPrint('All Gemini API calls failed ($lastException). Falling back to curated offline question bank.');
    return _getCuratedFallbackQuestions(sections, difficulty, count);
  }

  /// Curated offline question bank covering all 4 sections across Mid, Senior, and Tech Lead difficulties
  List<QuestionEntity> _getCuratedFallbackQuestions(
    List<String> sections,
    String difficulty,
    int count,
  ) {
    final pool = <QuestionEntity>[
      // Flutter & Dart - Mid / Senior
      const QuestionEntity(
        questionHash: '',
        section: AppConstants.sectionFlutterDart,
        topic: 'Widget, Element, & RenderObject Trees',
        interviewStyle: 'Technical Conceptual',
        questionText:
            'In Flutter, what is the exact role of an Element in relation to Widgets and RenderObjects?',
        options: [
          'It is an immutable blueprint created anew on every build.',
          'It manages the lifecycle, holds the identity, and acts as the bridge coordinating Widgets and RenderObjects.',
          'It handles painting pixels directly to the Skia/Impeller canvas buffer.',
          'It handles gesture dispatching directly from the OS window.',
        ],
        correctOptionIndex: 1,
        explanation:
            'Widgets are immutable configuration blueprints. RenderObjects handle sizing, layout, and painting. Elements are the mutable objects that instantiate RenderObjects, manage their state, and survive widget rebuilds via key and runtimeType matching.',
      ),
      const QuestionEntity(
        questionHash: '',
        section: AppConstants.sectionFlutterDart,
        topic: 'Dart Asynchrony & Event Loop',
        interviewStyle: 'Code Snippet Analysis',
        questionText:
            'In Dart, how are Microtasks scheduled compared to Events in the event queue?',
        options: [
          'Microtasks run on a separate background thread in parallel with the main isolate.',
          'Microtasks take priority over Events; the event loop drains all Microtasks before processing the next Event.',
          'Microtasks and Events are interleaved in a FIFO round-robin fashion.',
          'Microtasks only execute once the isolate finishes the entire Flutter frame render.',
        ],
        correctOptionIndex: 1,
        explanation:
            'Dart isolates run a single-threaded event loop with two queues: the Microtask Queue and the Event Queue. Microtasks always have strict priority; all pending microtasks are drained before the next event from the Event Queue is executed.',
      ),
      const QuestionEntity(
        questionHash: '',
        section: AppConstants.sectionFlutterDart,
        topic: 'RepaintBoundary & Rendering Optimization',
        interviewStyle: 'Architecture Tradeoff',
        questionText:
            'When should an engineer insert a RepaintBoundary widget into a Flutter widget tree?',
        options: [
          'Around every Stateless widget to prevent memory leaks.',
          'Around an isolated sub-tree that repaints frequently to isolate its render layer from repainting the rest of the ancestor tree.',
          'To force garbage collection of unused texture caches.',
          'To convert raster threads into UI threads during animations.',
        ],
        correctOptionIndex: 1,
        explanation:
            'A RepaintBoundary creates a separate display list layer. When the child repaints, only that layer is redrawn rather than propagating the repaint boundary up to the root, preventing expensive parent subtree repaints at the cost of a small memory overhead for the layer.',
      ),
      const QuestionEntity(
        questionHash: '',
        section: AppConstants.sectionFlutterDart,
        topic: 'Riverpod & State Preservation',
        interviewStyle: 'Technical Conceptual',
        questionText:
            'What happens in Riverpod when a provider is marked with autoDispose and no widget or provider is currently watching or listening to it?',
        options: [
          'The provider throws a ProviderNotFoundException immediately.',
          'The provider retains its state in memory indefinitely until the app process terminates.',
          'The provider disposes of its state and clears allocated resources on the next microtask.',
          'The provider forces all child widgets to perform a hard rebuild.',
        ],
        correctOptionIndex: 2,
        explanation:
            'Riverpod autoDispose providers listen to subscriber counts. When the subscriber count drops to zero, the provider destroys its state and invokes any onDispose callbacks, freeing memory unless keepAlive() is explicitly called on Ref.',
      ),

      // Native Android - Mid / Senior
      const QuestionEntity(
        questionHash: '',
        section: AppConstants.sectionNativeAndroid,
        topic: 'Kotlin Coroutines Dispatchers',
        interviewStyle: 'Technical Conceptual',
        questionText:
            'In Kotlin Coroutines, what is the critical difference between Dispatchers.Default and Dispatchers.IO?',
        options: [
          'Dispatchers.Default is limited to a single thread while Dispatchers.IO uses Android HandlerThread.',
          'Dispatchers.Default is optimized for CPU-bound computations with parallelism capped at CPU core count, while Dispatchers.IO is backed by an elastic thread pool capped at 64 (or core count) for blocking I/O.',
          'Dispatchers.IO runs on the main Looper whereas Dispatchers.Default runs on RenderThread.',
          'Dispatchers.Default automatically cancels jobs on configuration change while Dispatchers.IO does not.',
        ],
        correctOptionIndex: 1,
        explanation:
            'Dispatchers.Default is designed for intensive CPU work (parsing JSON, sorting) and scales its thread pool to the number of CPU cores. Dispatchers.IO is designed for blocking I/O (disk, network) and shares threads with Default while expanding up to 64 threads or more without starving CPU tasks.',
      ),
      const QuestionEntity(
        questionHash: '',
        section: AppConstants.sectionNativeAndroid,
        topic: 'Jetpack Compose Recomposition & Stability',
        interviewStyle: 'Code Snippet Analysis',
        questionText:
            'In Jetpack Compose, why might a Composable function fail to skip recomposition when its parameters appear unchanged?',
        options: [
          'Because the parameters are immutable data classes with primitive properties.',
          'Because Compose encounters unstable parameter types (e.g., standard java.util.List or unannotated classes from external modules) where equality cannot be guaranteed by the Compose compiler.',
          'Because rememberSaveable is required on all composables.',
          'Because the Composable returns a Unit instead of a Node.',
        ],
        correctOptionIndex: 1,
        explanation:
            'The Compose compiler classifies types as Stable or Unstable. Standard collections (like List<T>) are considered unstable because they are mutable interfaces. Unstable parameters cause the compiler to generate recomposition code that always re-runs instead of skipping.',
      ),
      const QuestionEntity(
        questionHash: '',
        section: AppConstants.sectionNativeAndroid,
        topic: 'Android ViewModel & SavedStateHandle',
        interviewStyle: 'Architecture Tradeoff',
        questionText:
            'Why is SavedStateHandle necessary in an Android ViewModel even though ViewModels survive configuration changes?',
        options: [
          'Because ViewModels are destroyed when user rotates the device.',
          'Because ViewModels do NOT survive system-initiated process death (e.g., low memory kills while app is backgrounded), whereas SavedStateHandle persists data across process recreation.',
          'SavedStateHandle is only used for passing arguments into Compose Navigation.',
          'SavedStateHandle encrypts SharedPreferences automatically.',
        ],
        correctOptionIndex: 1,
        explanation:
            'While a ViewModel instance is retained during normal configuration changes (like screen rotations), it is destroyed when the Android OS kills the app process under memory pressure. SavedStateHandle serializes vital state into the system bundle saved by the OS.',
      ),

      // System Design & Architecture
      const QuestionEntity(
        questionHash: '',
        section: AppConstants.sectionSystemDesign,
        topic: 'Offline-First Synchronization',
        interviewStyle: 'Architecture Tradeoff',
        questionText:
            'In a high-scale mobile app with offline-first editing, how should write conflicts be resolved between local offline writes and remote server updates?',
        options: [
          'Discard local writes whenever the server timestamp is newer without notifying the user.',
          'Block all UI interactions whenever network connectivity is lost.',
          'Use deterministic Conflict-Free Replicated Data Types (CRDTs) or Operational Transforms with vector clocks / logical timestamps and idempotent mutation queues.',
          'Overwrite the server database unconditionally using HTTP PUT from the mobile device.',
        ],
        correctOptionIndex: 2,
        explanation:
            'Robust offline mobile architectures employ an append-only mutation queue with deterministic conflict resolution (CRDTs, vector clocks, or state-based merging). This guarantees eventual consistency across devices without losing uncommitted user data.',
      ),
      const QuestionEntity(
        questionHash: '',
        section: AppConstants.sectionSystemDesign,
        topic: 'Mobile Image Caching & Memory Management',
        interviewStyle: 'Technical Conceptual',
        questionText:
            'Why do production mobile image loaders (like Glide or CachedNetworkImage) implement a dual-tier cache (RAM L1 + Disk L2)?',
        options: [
          'RAM cache stores uncompressed Bitmaps for instantaneous rendering without decode overhead, while Disk cache stores compressed byte streams to minimize memory footprint.',
          'Disk cache is only accessed when the phone is in battery saver mode.',
          'RAM cache is shared across all apps installed on the device.',
          'Dual caching is needed solely to bypass OS storage permission prompts.',
        ],
        correctOptionIndex: 0,
        explanation:
            'Decompressing image formats (JPEG/PNG/WebP) into raw ARGB bitmaps is CPU and battery intensive. L1 RAM cache holds decoded bitmaps ready to be displayed immediately; L2 Disk cache holds compressed files to avoid repeated expensive network downloads.',
      ),
      const QuestionEntity(
        questionHash: '',
        section: AppConstants.sectionSystemDesign,
        topic: 'Pagination & Infinite List Architecture',
        interviewStyle: 'Architecture Tradeoff',
        questionText:
            'Why is Keyset/Cursor-based pagination preferred over Offset-based pagination for high-volume mobile newsfeeds?',
        options: [
          'Offset pagination is always faster because SQL OFFSET is O(1).',
          'Cursor pagination prevents duplicate or skipped items when new records are inserted at the top of the feed while scrolling, and offers consistent O(1) indexed lookups.',
          'Cursor pagination does not require an Internet connection.',
          'Offset pagination cannot be parsed by Dart or Kotlin.',
        ],
        correctOptionIndex: 1,
        explanation:
            'In offset pagination (OFFSET N LIMIT M), if new posts are published while the user scrolls, the window shifts, resulting in duplicate items. Furthermore, database queries with large offsets degrade to O(N) table scans. Cursor pagination indexes strictly on the last item’s ID/timestamp.',
      ),

      // DSA & Problem Solving
      const QuestionEntity(
        questionHash: '',
        section: AppConstants.sectionDSA,
        topic: 'LRU Cache Design',
        interviewStyle: 'Code Snippet Analysis',
        questionText:
            'What data structures are combined to achieve both O(1) get and O(1) put operations in a standard LRU (Least Recently Used) cache?',
        options: [
          'A Binary Search Tree and a Min-Heap.',
          'A Hash Map (for O(1) key-to-node lookup) and a Doubly Linked List (for O(1) node removal and insertion to the head).',
          'An Array and a Stack.',
          'A Trie and an AVL tree.',
        ],
        correctOptionIndex: 1,
        explanation:
            'A Hash Map maps keys directly to pointers/nodes in a Doubly Linked List in O(1) time. The Doubly Linked List maintains the access order, allowing any accessed or evicted node to be unlinked and moved to the head or tail in O(1) time without shifting elements.',
      ),
      const QuestionEntity(
        questionHash: '',
        section: AppConstants.sectionDSA,
        topic: 'Trie (Prefix Tree) for Mobile Search Autocomplete',
        interviewStyle: 'Technical Conceptual',
        questionText:
            'What is the time complexity of searching for all words matching a prefix of length L in a Trie containing N total words of maximum length M?',
        options: [
          'O(N * M) time complexity.',
          'O(L) to find the prefix node, plus O(K) where K is the number of nodes in the prefix subtree.',
          'O(log N) binary search time.',
          'O(2^L) exponential search time.',
        ],
        correctOptionIndex: 1,
        explanation:
            'Traversing down the Trie according to the prefix characters takes O(L) time. From that prefix node, collecting matching suggestions traverses only the sub-branch containing completions, making it extremely fast for real-time mobile keyboard search suggestions.',
      ),
      const QuestionEntity(
        questionHash: '',
        section: AppConstants.sectionDSA,
        topic: 'Two Pointers & Sliding Window',
        interviewStyle: 'Technical Conceptual',
        questionText:
            'What is the optimal time and space complexity for finding the maximum sum subarray of fixed size K in an array of size N?',
        options: [
          'O(N * K) time and O(K) space.',
          'O(N) time and O(1) auxiliary space using a Sliding Window.',
          'O(N log N) time and O(N) space using Merge Sort.',
          'O(N^2) time and O(1) space.',
        ],
        correctOptionIndex: 1,
        explanation:
            'By maintaining a sliding window of size K, we compute the initial sum of the first K elements. For each subsequent step, we add the incoming element and subtract the outgoing element in O(1), traversing the array once in O(N) time with O(1) extra space.',
      ),
    ];

    // Filter by requested sections if specific section chosen
    List<QuestionEntity> filtered;
    if (sections.contains(AppConstants.sectionMixed)) {
      filtered = List.from(pool);
    } else {
      filtered = pool.where((q) => sections.contains(q.section)).toList();
      if (filtered.isEmpty) {
        filtered = List.from(pool);
      }
    }

    filtered.shuffle();
    if (filtered.length >= count) {
      return filtered.sublist(0, count);
    }

    // If count exceeds filtered items, repeat or pad with pool items
    final result = <QuestionEntity>[...filtered];
    for (final item in pool) {
      if (result.length >= count) break;
      if (!result.contains(item)) {
        result.add(item);
      }
    }
    return result.take(count).toList();
  }
}
