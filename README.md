# SiNTerview 🚀

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

## 💬 Project Discussion & Future Possibilities

### 💡 Project Discussion
**SiNTerview** is a production-grade Flutter application built with Clean Architecture, MVVM, and Riverpod. It pairs anti-repeat SHA-256 question deduplication and reactive Isar local database streams with multimodal Gemini AI to deliver interactive quizzes and live camera/voice interview evaluations.

### 🚀 Future Possibilities
- **On-Device LLMs (LiteRT-LM):** Offline, zero-latency local AI interviewers.
- **Visual & Body Language AI:** Multimodal evaluation of posture, eye contact, and expression.
- **Targeted Company Tracks:** Customized mock interview modules for specific tech roles and companies.
- **Peer-to-Peer Mock Interviews:** Collaborative live sessions with automated AI feedback.
