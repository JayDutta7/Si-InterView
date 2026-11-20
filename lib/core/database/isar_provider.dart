import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';

import '../constants/app_constants.dart';

/// Provider exposing the singleton Isar instance.
/// Overridden in main() with the initialized instance.
final isarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('isarProvider must be initialized in ProviderScope');
});

/// Riverpod provider holding the current Gemini API Key.
/// Resolves from .env via `--dart-define-from-file` using `GEMINI_KEY`, `gemini_key`,
/// or `GEMINI_API_KEY`, and falls back to empty string (which enables curated offline mode).
/// Can also be updated dynamically from the UI settings.
final geminiApiKeyProvider = StateProvider<String>((ref) {
  const envVal = String.fromEnvironment(
    AppConstants.envGeminiKey,
    defaultValue: String.fromEnvironment(
      AppConstants.envGeminiApiKey,
      defaultValue: String.fromEnvironment(
        AppConstants.envGeminiKeyLower,
        defaultValue: '',
      ),
    ),
  );
  return envVal;
});
