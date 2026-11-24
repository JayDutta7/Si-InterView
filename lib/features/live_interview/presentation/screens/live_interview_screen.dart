import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/api_key_dialog.dart';
import '../../domain/models/interview_exchange.dart';
import '../controllers/live_interview_controller.dart';
import '../providers/live_interview_providers.dart';
import '../widgets/camera_preview_card.dart';
import '../widgets/state_badge.dart';
import 'package:mobileprep_ai/features/performance/presentation/widgets/realtime_telemetry_strip.dart';
import 'package:mobileprep_ai/features/performance/presentation/screens/performance_dashboard_screen.dart';
import 'live_interview_summary_screen.dart';

class LiveInterviewScreen extends ConsumerStatefulWidget {
  const LiveInterviewScreen({super.key});

  @override
  ConsumerState<LiveInterviewScreen> createState() => _LiveInterviewScreenState();
}

class _LiveInterviewScreenState extends ConsumerState<LiveInterviewScreen> {
  final TextEditingController _textController = TextEditingController();
  String _selectedTopic = AppConstants.sectionFlutterDart;
  String _selectedDifficulty = AppConstants.difficultySenior;
  bool _hasStarted = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _onAnswerSubmitted([String? text]) {
    final toSubmit = text ?? _textController.text;
    if (toSubmit.trim().isEmpty) return;

    ref.read(liveInterviewControllerProvider.notifier).submitAnswer(toSubmit);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(liveInterviewControllerProvider);
    final controller = ref.read(liveInterviewControllerProvider.notifier);

    // If session ended, navigate to summary
    if (state.botState == LiveBotState.sessionEnded && state.isSessionSaved) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => LiveInterviewSummaryScreen(
              sessionId: state.sessionId,
            ),
          ),
        );
      });
    }

    if (!_hasStarted) {
      return _buildStartScreen(context);
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final shouldEnd = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('End Live Interview?'),
            content: const Text(
              'Your session exchanges will be saved to your Isar history.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Continue'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(ctx, true),
                style: ElevatedButton.styleFrom(backgroundColor: AppTheme.errorColor),
                child: const Text('End & Save'),
              ),
            ],
          ),
        );

        if (shouldEnd == true) {
          await controller.endSession();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('1-to-1 Live: ${state.topic}'),
          actions: [
            IconButton(
              tooltip: 'Gemini API Key',
              icon: const Icon(Icons.key_rounded),
              onPressed: () => ApiKeyDialog.show(context),
            ),
            IconButton(
              tooltip: 'End Interview',
              icon: const Icon(Icons.call_end_rounded, color: AppTheme.errorColor),
              onPressed: () async {
                await controller.endSession();
              },
            ),
          ],
        ),
        body: Column(
          children: [
            // Camera Preview Card (Front Camera + Controls)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CameraPreviewCard(
                isCameraOn: state.isCameraOn,
                isFrontCamera: state.isFrontCamera,
                isMuted: state.isMuted,
                onToggleCamera: controller.toggleCamera,
                onSwitchCamera: controller.switchCamera,
                onToggleMute: controller.toggleMute,
                onEndSession: () async => await controller.endSession(),
              ),
            ),

            // Live State Badge (Connecting, Listening, Bot Speaking, Evaluating)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                children: [
                  StateBadge(state: state.botState),
                  const Spacer(),
                  if (state.botState == LiveBotState.botSpeaking)
                    TextButton.icon(
                      onPressed: () => controller.interruptBot(),
                      icon: const Icon(Icons.back_hand_rounded, size: 16),
                      label: const Text('Interrupt Bot (Barge-in)', style: TextStyle(fontSize: 12)),
                    ),
                ],
              ),
            ),

            if (state.exchanges.isNotEmpty)
              RealtimeTelemetryStrip(
                totalAnswered: state.exchanges.length,
                correctCount: state.exchanges.where((e) => e.verdict == AnswerVerdict.right).length,
                currentAccuracy: (state.overallScore * 10.0),
                avgPaceSeconds: 18.5,
                statusText: 'Live Audio Telemetry',
                onExpand: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PerformanceDashboardScreen(),
                    ),
                  );
                },
              ),

            const Divider(height: 1),

            // Interview Dialogue & Questions Stream
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Current Active Question from Interviewer
                  if (state.currentQuestion.isNotEmpty)
                    _buildActiveQuestionCard(context, state),

                  const SizedBox(height: 16),

                  // History of Past Exchanges in this session
                  if (state.exchanges.isNotEmpty) ...[
                    const Text(
                      'Session Transcript & Feedback',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 10),
                    ...state.exchanges.map((ex) => _buildExchangeTile(context, ex)),
                  ],
                ],
              ),
            ),

            // Candidate Answer Bar (Spoken recognition display + submit button)
            _buildBottomAnswerBar(context, state, controller),
          ],
        ),
      ),
    );
  }

  Widget _buildStartScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('1-to-1 Live AI Interview'),
        actions: [
          IconButton(
            tooltip: 'Gemini API Key',
            icon: const Icon(Icons.key_rounded),
            onPressed: () => ApiKeyDialog.show(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.primaryLight.withValues(alpha: 0.15),
                ),
                child: const Icon(
                  Icons.videocam_rounded,
                  size: 42,
                  color: AppTheme.primaryLight,
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Center(
              child: Text(
                'Live Spoken Technical Screen',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
            ),
            const SizedBox(height: 6),
            Center(
              child: Text(
                'Simulate a realistic 1-to-1 technical interview. The Gemini AI bot asks technical questions, listens to your verbal response, evaluates your depth, and asks intelligent follow-ups.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.5,
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'Select Primary Focus Area:',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            ...AppConstants.allSections.map((sec) {
              final isSelected = _selectedTopic == sec;
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppTheme.primaryColor.withValues(alpha: 0.15)
                      : Theme.of(context).cardTheme.color,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? AppTheme.primaryLight
                        : Theme.of(context).colorScheme.outlineVariant,
                    width: isSelected ? 1.5 : 1,
                  ),
                ),
                child: RadioListTile<String>(
                  title: Text(sec, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  value: sec,
                  groupValue: _selectedTopic,
                  onChanged: (val) {
                    if (val != null) setState(() => _selectedTopic = val);
                  },
                ),
              );
            }),

            const SizedBox(height: 20),

            const Text(
              'Seniority Level:',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            Row(
              children: AppConstants.difficulties.map((diff) {
                final isSelected = _selectedDifficulty == diff;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: ChoiceChip(
                      label: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(diff),
                      ),
                      selected: isSelected,
                      onSelected: (val) {
                        if (val) setState(() => _selectedDifficulty = diff);
                      },
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 36),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() => _hasStarted = true);
                  ref.read(liveInterviewControllerProvider.notifier).startSession(
                        topic: _selectedTopic,
                        difficulty: _selectedDifficulty,
                      );
                },
                icon: const Icon(Icons.video_call_rounded, size: 22),
                label: const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Launch Live Camera & Voice Interview',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveQuestionCard(BuildContext context, LiveInterviewState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.primaryLight.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryLight.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 14,
                backgroundColor: AppTheme.primaryLight,
                child: Icon(Icons.smart_toy_rounded, size: 16, color: Colors.white),
              ),
              const SizedBox(width: 8),
              const Text(
                'Gemini Technical Interviewer',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              if (state.botState == LiveBotState.botSpeaking)
                const Icon(Icons.graphic_eq_rounded, color: AppTheme.primaryLight, size: 20),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            state.currentQuestion,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExchangeTile(BuildContext context, InterviewExchange ex) {
    Color verdictColor;
    String verdictLabel;

    switch (ex.verdict) {
      case AnswerVerdict.right:
        verdictColor = AppTheme.successColor;
        verdictLabel = 'RIGHT';
        break;
      case AnswerVerdict.partiallyCorrect:
        verdictColor = AppTheme.warningColor;
        verdictLabel = 'PARTIALLY CORRECT';
        break;
      case AnswerVerdict.wrong:
        verdictColor = AppTheme.errorColor;
        verdictLabel = 'WRONG';
        break;
      case AnswerVerdict.pending:
        verdictColor = Colors.grey;
        verdictLabel = 'EVALUATING';
        break;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Exchange #${ex.turnIndex}',
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: verdictColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: verdictColor.withValues(alpha: 0.4)),
                  ),
                  child: Text(
                    '$verdictLabel • ${ex.score.toStringAsFixed(1)}/10',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: verdictColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Q: ${ex.question}',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Candidate: "${ex.candidateAnswer}"',
              style: const TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Feedback: ${ex.feedback}',
                style: const TextStyle(fontSize: 12, height: 1.35),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAnswerBar(
    BuildContext context,
    LiveInterviewState state,
    LiveInterviewController controller,
  ) {
    final liveSpoken = state.candidateSpokenText;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        border: Border(
          top: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (liveSpoken.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.successColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppTheme.successColor.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.mic, size: 16, color: AppTheme.successColor),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        liveSpoken,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send_rounded, size: 18, color: AppTheme.successColor),
                      onPressed: () => _onAnswerSubmitted(liveSpoken),
                      tooltip: 'Submit Spoken Answer',
                    ),
                  ],
                ),
              ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: state.botState == LiveBotState.listening
                          ? 'Speak your answer (or type here)...'
                          : 'Type candidate answer...',
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onSubmitted: (val) => _onAnswerSubmitted(),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton.small(
                  onPressed: () => _onAnswerSubmitted(),
                  elevation: 0,
                  backgroundColor: AppTheme.primaryColor,
                  child: const Icon(Icons.arrow_upward_rounded, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
