class AppConstants {
  AppConstants._();

  static const String appName = 'MobilePrep AI';

  // Sections
  static const String sectionFlutterDart = 'Flutter & Dart';
  static const String sectionNativeAndroid =
      'Native Android (Kotlin, Coroutines & Compose)';
  static const String sectionSystemDesign = 'System Design & Architecture';
  static const String sectionDSA = 'DSA & Problem Solving';
  static const String sectionMixed = 'Mixed All Sections';

  static const List<String> allSections = [
    sectionFlutterDart,
    sectionNativeAndroid,
    sectionSystemDesign,
    sectionDSA,
  ];

  static const List<String> selectableSections = [
    sectionMixed,
    sectionFlutterDart,
    sectionNativeAndroid,
    sectionSystemDesign,
    sectionDSA,
  ];

  // Difficulties
  static const String difficultyMid = 'Mid';
  static const String difficultySenior = 'Senior';
  static const String difficultyTechLead = 'Tech Lead';

  static const List<String> difficulties = [
    difficultyMid,
    difficultySenior,
    difficultyTechLead,
  ];

  // Question Counts
  static const List<int> questionCounts = [5, 10, 15];

  // Gemini Defaults
  static const String defaultGeminiModel = String.fromEnvironment(
    'GEMINI_DEFAULT_MODEL',
    defaultValue: String.fromEnvironment(
      'GEMINI_MODEL',
      defaultValue: 'gemini-3.8-flash',
    ),
  );
  static const String fallbackGeminiModel = String.fromEnvironment(
    'GEMINI_FALLBACK_MODEL',
    defaultValue: 'gemini-2.5-flash',
  );
  static const String geminiEndpoint =
      'https://generativelanguage.googleapis.com/v1beta/models';

  // Environment define keys (.env support)
  static const String envGeminiKey = 'GEMINI_KEY';
  static const String envGeminiApiKey = 'GEMINI_API_KEY';
  static const String envGeminiKeyLower = 'gemini_key';
  static const String envEnvironment = 'ENVIRONMENT';
  static const String envAppTitle = 'APP_TITLE';
}
