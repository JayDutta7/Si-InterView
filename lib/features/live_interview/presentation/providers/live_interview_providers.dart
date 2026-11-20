import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mobileprep_ai/core/database/isar_provider.dart';
import 'package:mobileprep_ai/features/live_interview/data/datasources/live_interview_datasource.dart';
import 'package:mobileprep_ai/features/live_interview/data/models/live_interview_session.dart';
import 'package:mobileprep_ai/features/live_interview/data/services/live_interview_service.dart';
import 'package:mobileprep_ai/features/live_interview/data/services/live_interview_service_impl.dart';
import 'package:mobileprep_ai/features/live_interview/presentation/controllers/live_interview_controller.dart';

final liveInterviewDataSourceProvider = Provider<LiveInterviewDataSource>((ref) {
  final isar = ref.watch(isarProvider);
  return LiveInterviewDataSource(isar);
});

final liveInterviewServiceProvider = Provider<LiveInterviewService>((ref) {
  String getApiKey() => ref.read(geminiApiKeyProvider);
  return LiveInterviewServiceImpl(getApiKey: getApiKey);
});

/// Reactive Isar StreamProvider watching live interview history
final liveInterviewHistoryStreamProvider =
    StreamProvider<List<LiveInterviewSession>>((ref) {
  final dataSource = ref.watch(liveInterviewDataSourceProvider);
  return dataSource.watchAllLiveSessions();
});

/// Live Interview Controller Provider
final liveInterviewControllerProvider =
    StateNotifierProvider<LiveInterviewController, LiveInterviewState>((ref) {
  final service = ref.watch(liveInterviewServiceProvider);
  final dataSource = ref.watch(liveInterviewDataSourceProvider);
  return LiveInterviewController(service: service, dataSource: dataSource);
});
