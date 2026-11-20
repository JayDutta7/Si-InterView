# MobilePrep AI 🚀

A production-grade Flutter application built with **Clean Architecture**, **MVVM**, and **Riverpod** where **Isar** (`isar_community` v3) serves as **BOTH** the local database and the reactive stream source driving application state.

---

## 🏛 Architecture & Tech Stack

- **Flutter 3.32+ / Dart 3.8+** with Null Safety & Material 3 UI design.
- **Isar Database (Community Edition v3)**: `isar_community: 3.2.0`, `isar_community_flutter_libs: 3.2.0`, `isar_community_generator: 3.2.0`.
- **State Management**: `flutter_riverpod: ^2.6.1` with query watchers (`watch(fireImmediately: true)`), `StreamProvider`, and MVVM StateNotifiers.
- **Multimodal AI**: Google Gemini 1.5/2.0 API with structured JSON schema (`application/json`) and live conversational interview simulation.
- **Voice & Live Audio**: `speech_to_text: ^7.4.0` for verbal answer recognition and `flutter_tts: ^4.2.5` for voice synthesis with barge-in interruption support.
- **Camera Module**: `camera: ^0.11.2+1` with front/back camera switching, permission handling, and mute/video toggles.
- **Anti-Repeat Cryptography**: `crypto: ^3.0.8` (deterministic SHA-256 question hashing with linguistic normalization).

---

## 📂 Project Structure (Clean Architecture + MVVM)

```
lib/
├── core/
│   ├── constants/
│   │   └── app_constants.dart          # Sections, difficulties, Gemini endpoints
│   ├── database/
│   │   ├── isar_service.dart          # Isar singleton initialization at startup
│   │   └── isar_provider.dart         # isarProvider & geminiApiKeyProvider
│   ├── theme/
│   │   └── app_theme.dart             # Material 3 dark/light themes & palette
│   ├── utils/
│   │   └── hash_util.dart             # Normalization & deterministic SHA-256
│   └── widgets/
│       └── api_key_dialog.dart        # In-app Gemini API key settings dialog
│
├── features/
│   ├── quiz/                          # Feature 1 & 2: MCQ Engine & Anti-Repeat
│   │   ├── data/
│   │   │   ├── models/                # Isar collections (.g.dart generated)
│   │   │   │   ├── question_record.dart
│   │   │   │   ├── quiz_session.dart
│   │   │   │   └── question_attempt.dart
│   │   │   ├── datasources/
│   │   │   │   ├── quiz_isar_datasource.dart
│   │   │   │   └── gemini_quiz_service.dart
│   │   │   └── repositories/
│   │   │       └── quiz_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── question_entity.dart
│   │   │   └── repositories/
│   │   │       └── quiz_repository.dart
│   │   └── presentation/
│   │       ├── controllers/
│   │       │   └── quiz_controller.dart
│   │       ├── providers/
│   │       │   └── quiz_providers.dart
│   │       ├── screens/
│   │       │   ├── quiz_setup_screen.dart
│   │       │   ├── quiz_play_screen.dart
│   │       │   └── quiz_session_review_screen.dart
│   │       └── widgets/
│   │           ├── option_card.dart
│   │           └── feedback_card.dart
│   │
│   ├── analytics/                     # Feature 3: Score Analysis & History
│   │   ├── data/
│   │   │   └── analytics_isar_datasource.dart
│   │   └── presentation/
│   │       ├── providers/
│   │       │   └── analytics_providers.dart
│   │       └── screens/
│   │           └── score_analysis_screen.dart
│   │
│   ├── live_interview/                # Feature 4: 1-to-1 Camera & Voice Interview
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── live_interview_session.dart
│   │   │   ├── datasources/
│   │   │   │   └── live_interview_datasource.dart
│   │   │   └── services/
│   │   │       ├── live_interview_service.dart
│   │   │       └── live_interview_service_impl.dart
│   │   ├── domain/
│   │   │   └── models/
│   │   │       └── interview_exchange.dart
│   │   └── presentation/
│   │       ├── controllers/
│   │       │   └── live_interview_controller.dart
│   │       ├── providers/
│   │       │   └── live_interview_providers.dart
│   │       ├── screens/
│   │       │   ├── live_interview_screen.dart
│   │       │   └── live_interview_summary_screen.dart
│   │       └── widgets/
│   │           ├── camera_preview_card.dart
│   │           └── state_badge.dart
│   │
│   └── home/
│       └── presentation/screens/
│           └── main_navigation_screen.dart
│
└── main.dart                          # App entry point initializing Isar & Riverpod
```

---

## ⚡ Core Requirements Implemented

### 1. Multi-Section MCQ Interview Engine + Immediate Result
- **Sections Covered**:
  - *Flutter & Dart*
  - *Native Android (Kotlin, Coroutines & Compose)*
  - *System Design & Architecture*
  - *DSA & Problem Solving*
  - *Mixed All Sections*
- **Seniority Levels**: Mid, Senior, Tech Lead.
- **Question Counts**: 5, 10, 15.
- **Gemini Structured Output**: Requests structured JSON with strict schema (`section`, `topic`, `interviewStyle`, `question`, 4 `options`, `correctOptionIndex`, `explanation`).
- **Immediate Feedback Loop**:
  - When the user selects an option, the attempt is immediately recorded in Isar inside `await isar.writeTxn(...)`.
  - The UI immediately renders right/wrong feedback, highlights the selected and correct options, displays response time in seconds, and provides a detailed technical explanation before advancing.

### 2. Strict Anti-Repeat Question Mechanism in Isar
- **Normalization**: Question text is normalized (lowercased, all punctuation removed, multiple whitespaces collapsed, trimmed).
- **Deterministic SHA-256**: Generates a unique 64-character hash via `HashUtil.computeQuestionHash(text)`.
- **Isar Indexed Storage**: Stored in `@collection class QuestionRecord` with `@Index(unique: true, replace: true) late String questionHash`.
- **Prompt Avoidance Context**: Recent seen questions from Isar are sent in the Gemini prompt so the AI avoids repeating similar topics.
- **Automatic Replacement Loop**: If any generated question matches an existing hash in Isar, it is filtered out, its appearance count is updated in Isar, and a replacement question is fetched automatically until the requested count is uniquely fulfilled.

### 3. Isar-Backed Score Analysis & Session History
- **Database Collections**:
  - `QuizSession` (sessionId, title, sections, difficulty, startedAt, completedAt, totalQuestions, correctCount, scorePercent, isCompleted)
  - `QuestionAttempt` (sessionId, questionHash, questionText, section, topic, selectedIndex, correctIndex, isCorrect, explanation, answeredAt, responseTimeMs)
- **Live Reactive Watchers**:
  - State is driven by Isar query watchers (`watch(fireImmediately: true)`) exposed via Riverpod `StreamProvider`.
  - Every answer instantly updates the live metrics without manual state dispatching.
- **Score Analysis Dashboard**:
  - Overall accuracy %, total questions answered, and completed session sets.
  - Section-wise accuracy breakdown with color-coded progress bars.
  - **Weakest Topics Ranking** with a **1-tap "Practice" button** that launches a targeted interview session focused directly on that weak area.
  - **Past Sessions List**: Tap any session to inspect the complete review with questions, user choices, correct answers, and explanations.

### 4. 1-to-1 Live Camera + Voice Interview Module (Gemini Live)
- **Front Camera Preview**: Integrates the `camera` package with permission handling, live video stream preview, camera flip, video toggle, and mute controls.
- **Spoken 1-to-1 Interview Flow**:
  - Gemini acts as a Staff Mobile Engineering Interviewer.
  - TTS speaks questions with **barge-in interruption** support ("Interrupt Bot").
  - STT listens to the candidate's verbal answer (with fallback text input).
  - Evaluates whether the answer is **RIGHT**, **PARTIALLY CORRECT**, or **WRONG** with constructive verbal feedback and dynamic follow-up questions.
- **Live State Badges**: `Connecting`, `Listening to Candidate`, `Interviewer Speaking`, `Evaluating Answer...`, `Idle`.
- **History & Synthesis**: Saves `LiveInterviewSession` summaries and transcripts to Isar inside `writeTxn`.

---

## 🛠 Configuration & Permissions

### Gemini API Key Setup
You can provide your Gemini API key in two ways:

1. **Via `--dart-define` at compile time (Recommended for production)**:
   ```bash
   flutter run --dart-define=GEMINI_API_KEY="your-gemini-api-key"
   ```

2. **In-App Dynamic Settings**:
   Tap the **Key icon** in the top AppBar on any screen to view, enter, or update your Gemini API key dynamically.
   *(Note: If no API key is provided, the app uses its built-in curated question bank across all sections and difficulties, allowing full offline testing!)*

### Android Configuration (`android/app/src/main/AndroidManifest.xml`)
The following permissions are configured:
```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.RECORD_AUDIO"/>
<uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
<uses-permission android:name="android.permission.BLUETOOTH"/>
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT"/>
```
And `minSdk = 21` is set in `android/app/build.gradle.kts`.

### iOS Configuration (`ios/Runner/Info.plist`)
The following permission keys are added:
```xml
<key>NSCameraUsageDescription</key>
<string>MobilePrep AI uses camera for live technical interview simulation.</string>
<key>NSMicrophoneUsageDescription</key>
<string>MobilePrep AI uses microphone to listen and evaluate your spoken answers.</string>
<key>NSSpeechRecognitionUsageDescription</key>
<string>MobilePrep AI uses speech recognition to transcribe candidate answers during interviews.</string>
```

---

## 🧪 Testing & Verification

Run the test suite and static analysis:
```bash
# Code generation for Isar models (if modifying schemas)
dart run build_runner build --delete-conflicting-outputs

# Static analysis
flutter analyze

# Unit & Widget tests
flutter test
```
All unit tests verify:
- Deterministic SHA-256 question hashing and whitespace/punctuation normalization.
- Anti-repeat deduplication mechanism.
- QuestionEntity JSON parsing and Gemini schema validation.
- Live interview exchange serialization & scoring.
- Offline curated question bank fallback logic.
