import 'package:isar_community/isar.dart';

import '../models/adaptive_profile_record.dart';

class AdaptiveIsarDataSource {
  final Isar isar;

  AdaptiveIsarDataSource(this.isar);

  /// Watch a specific scope's adaptive profile reactively
  Stream<AdaptiveProfileRecord?> watchProfile(String scopeKey) {
    return isar.adaptiveProfileRecords
        .filter()
        .scopeKeyEqualTo(scopeKey)
        .watch(fireImmediately: true)
        .map((records) => records.isNotEmpty ? records.first : null);
  }

  /// Watch all adaptive profiles
  Stream<List<AdaptiveProfileRecord>> watchAllProfiles() {
    return isar.adaptiveProfileRecords.where().watch(fireImmediately: true);
  }

  /// Get a profile by scopeKey statically
  Future<AdaptiveProfileRecord?> getProfile(String scopeKey) async {
    return await isar.adaptiveProfileRecords
        .filter()
        .scopeKeyEqualTo(scopeKey)
        .findFirst();
  }

  /// Save or update an AdaptiveProfileRecord inside writeTxn
  Future<AdaptiveProfileRecord> saveProfile(AdaptiveProfileRecord record) async {
    await isar.writeTxn(() async {
      final existing = await isar.adaptiveProfileRecords
          .filter()
          .scopeKeyEqualTo(record.scopeKey)
          .findFirst();
      if (existing != null) {
        record.id = existing.id;
      }
      await isar.adaptiveProfileRecords.put(record);
    });
    return record;
  }
}
