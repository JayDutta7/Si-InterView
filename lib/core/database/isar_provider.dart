import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';

import '../constants/app_constants.dart';

/// Provider exposing the singleton Isar instance.
/// Overridden in main() with the initialized instance.
final isarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('isarProvider must be initialized in ProviderScope');
});

/// Riverpod provider holding the current Gemini API Key.
/// Defaults to `--dart-define=GEMINI_API_KEY` or empty string.
/// Can be updated dynamically from the UI settings.
final geminiApiKeyProvider = StateProvider<String>((ref) {
  return const String.fromEnvironment(AppConstants.envGeminiApiKey, defaultValue: '');
});
