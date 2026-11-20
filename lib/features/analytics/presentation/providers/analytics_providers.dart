import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mobileprep_ai/core/database/isar_provider.dart';
import 'package:mobileprep_ai/features/quiz/data/models/quiz_session.dart';
import 'package:mobileprep_ai/features/analytics/data/analytics_isar_datasource.dart';

final analyticsIsarDataSourceProvider = Provider<AnalyticsIsarDataSource>((ref) {
  final isar = ref.watch(isarProvider);
  return AnalyticsIsarDataSource(isar);
});

/// Reactive Isar StreamProvider watching live OverallAnalytics
final overallAnalyticsStreamProvider = StreamProvider<OverallAnalytics>((ref) {
  final dataSource = ref.watch(analyticsIsarDataSourceProvider);
  return dataSource.watchOverallAnalytics();
});

/// Reactive Isar StreamProvider watching all sessions history
final allSessionsHistoryStreamProvider = StreamProvider<List<QuizSession>>((ref) {
  final dataSource = ref.watch(analyticsIsarDataSourceProvider);
  return dataSource.watchAllSessions();
});
