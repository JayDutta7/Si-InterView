import 'package:isar_community/isar.dart';

import '../models/live_interview_session.dart';

class LiveInterviewDataSource {
  final Isar isar;

  LiveInterviewDataSource(this.isar);

  /// Save or update a LiveInterviewSession inside Isar writeTxn
  Future<LiveInterviewSession> saveSession(LiveInterviewSession session) async {
    await isar.writeTxn(() async {
      await isar.liveInterviewSessions.put(session);
    });
    return session;
  }

  /// Watch all past LiveInterviewSessions reactively from Isar
  Stream<List<LiveInterviewSession>> watchAllLiveSessions() {
    return isar.liveInterviewSessions
        .where()
        .sortByStartedAtDesc()
        .watch(fireImmediately: true);
  }

  /// Get session by session ID
  Future<LiveInterviewSession?> getSessionById(String sessionId) async {
    return await isar.liveInterviewSessions
        .filter()
        .sessionIdEqualTo(sessionId)
        .findFirst();
  }
}
