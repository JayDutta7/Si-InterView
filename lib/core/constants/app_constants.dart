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
  static const String defaultGeminiModel = 'gemini-1.5-flash';
  static const String fallbackGeminiModel = 'gemini-1.5-pro';
  static const String geminiEndpoint =
      'https://generativelanguage.googleapis.com/v1beta/models';

  // Environment define key
  static const String envGeminiApiKey = 'GEMINI_API_KEY';
}
