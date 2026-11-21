// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_snapshot.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPerformanceSnapshotCollection on Isar {
  IsarCollection<PerformanceSnapshot> get performanceSnapshots =>
      this.collection();
}

const PerformanceSnapshotSchema = CollectionSchema(
  name: r'PerformanceSnapshot',
  id: -2428521547971242385,
  properties: {
    r'avgResponseTimeSeconds': PropertySchema(
      id: 0,
      name: r'avgResponseTimeSeconds',
      type: IsarType.double,
    ),
    r'calculatedAt': PropertySchema(
      id: 1,
      name: r'calculatedAt',
      type: IsarType.dateTime,
    ),
    r'communication': PropertySchema(
      id: 2,
      name: r'communication',
      type: IsarType.double,
    ),
    r'completedSessions': PropertySchema(
      id: 3,
      name: r'completedSessions',
      type: IsarType.long,
    ),
    r'confidence': PropertySchema(
      id: 4,
      name: r'confidence',
      type: IsarType.double,
    ),
    r'consistency': PropertySchema(
      id: 5,
      name: r'consistency',
      type: IsarType.double,
    ),
    r'knowledgeDepth': PropertySchema(
      id: 6,
      name: r'knowledgeDepth',
      type: IsarType.double,
    ),
    r'learningAbility': PropertySchema(
      id: 7,
      name: r'learningAbility',
      type: IsarType.double,
    ),
    r'medianResponseTimeSeconds': PropertySchema(
      id: 8,
      name: r'medianResponseTimeSeconds',
      type: IsarType.double,
    ),
    r'overallScore': PropertySchema(
      id: 9,
      name: r'overallScore',
      type: IsarType.double,
    ),
    r'readinessTier': PropertySchema(
      id: 10,
      name: r'readinessTier',
      type: IsarType.string,
    ),
    r'responseTimeSpeedScore': PropertySchema(
      id: 11,
      name: r'responseTimeSpeedScore',
      type: IsarType.double,
    ),
    r'scoreDelta': PropertySchema(
      id: 12,
      name: r'scoreDelta',
      type: IsarType.double,
    ),
    r'sessionSource': PropertySchema(
      id: 13,
      name: r'sessionSource',
      type: IsarType.string,
    ),
    r'snapshotId': PropertySchema(
      id: 14,
      name: r'snapshotId',
      type: IsarType.string,
    ),
    r'technicalAccuracy': PropertySchema(
      id: 15,
      name: r'technicalAccuracy',
      type: IsarType.double,
    ),
    r'totalQuestionsAnswered': PropertySchema(
      id: 16,
      name: r'totalQuestionsAnswered',
      type: IsarType.long,
    ),
  },

  estimateSize: _performanceSnapshotEstimateSize,
  serialize: _performanceSnapshotSerialize,
  deserialize: _performanceSnapshotDeserialize,
  deserializeProp: _performanceSnapshotDeserializeProp,
  idName: r'id',
  indexes: {
    r'snapshotId': IndexSchema(
      id: -7574188874426247601,
      name: r'snapshotId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'snapshotId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _performanceSnapshotGetId,
  getLinks: _performanceSnapshotGetLinks,
  attach: _performanceSnapshotAttach,
  version: '3.2.0',
);

int _performanceSnapshotEstimateSize(
  PerformanceSnapshot object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.readinessTier.length * 3;
  bytesCount += 3 + object.sessionSource.length * 3;
  bytesCount += 3 + object.snapshotId.length * 3;
  return bytesCount;
}

void _performanceSnapshotSerialize(
  PerformanceSnapshot object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.avgResponseTimeSeconds);
  writer.writeDateTime(offsets[1], object.calculatedAt);
  writer.writeDouble(offsets[2], object.communication);
  writer.writeLong(offsets[3], object.completedSessions);
  writer.writeDouble(offsets[4], object.confidence);
  writer.writeDouble(offsets[5], object.consistency);
  writer.writeDouble(offsets[6], object.knowledgeDepth);
  writer.writeDouble(offsets[7], object.learningAbility);
  writer.writeDouble(offsets[8], object.medianResponseTimeSeconds);
  writer.writeDouble(offsets[9], object.overallScore);
  writer.writeString(offsets[10], object.readinessTier);
  writer.writeDouble(offsets[11], object.responseTimeSpeedScore);
  writer.writeDouble(offsets[12], object.scoreDelta);
  writer.writeString(offsets[13], object.sessionSource);
  writer.writeString(offsets[14], object.snapshotId);
  writer.writeDouble(offsets[15], object.technicalAccuracy);
  writer.writeLong(offsets[16], object.totalQuestionsAnswered);
}

PerformanceSnapshot _performanceSnapshotDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PerformanceSnapshot();
  object.avgResponseTimeSeconds = reader.readDouble(offsets[0]);
  object.calculatedAt = reader.readDateTime(offsets[1]);
  object.communication = reader.readDouble(offsets[2]);
  object.completedSessions = reader.readLong(offsets[3]);
  object.confidence = reader.readDouble(offsets[4]);
  object.consistency = reader.readDouble(offsets[5]);
  object.id = id;
  object.knowledgeDepth = reader.readDouble(offsets[6]);
  object.learningAbility = reader.readDouble(offsets[7]);
  object.medianResponseTimeSeconds = reader.readDouble(offsets[8]);
  object.overallScore = reader.readDouble(offsets[9]);
  object.readinessTier = reader.readString(offsets[10]);
  object.responseTimeSpeedScore = reader.readDouble(offsets[11]);
  object.scoreDelta = reader.readDouble(offsets[12]);
  object.sessionSource = reader.readString(offsets[13]);
  object.snapshotId = reader.readString(offsets[14]);
  object.technicalAccuracy = reader.readDouble(offsets[15]);
  object.totalQuestionsAnswered = reader.readLong(offsets[16]);
  return object;
}

P _performanceSnapshotDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _performanceSnapshotGetId(PerformanceSnapshot object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _performanceSnapshotGetLinks(
  PerformanceSnapshot object,
) {
  return [];
}

void _performanceSnapshotAttach(
  IsarCollection<dynamic> col,
  Id id,
  PerformanceSnapshot object,
) {
  object.id = id;
}

extension PerformanceSnapshotByIndex on IsarCollection<PerformanceSnapshot> {
  Future<PerformanceSnapshot?> getBySnapshotId(String snapshotId) {
    return getByIndex(r'snapshotId', [snapshotId]);
  }

  PerformanceSnapshot? getBySnapshotIdSync(String snapshotId) {
    return getByIndexSync(r'snapshotId', [snapshotId]);
  }

  Future<bool> deleteBySnapshotId(String snapshotId) {
    return deleteByIndex(r'snapshotId', [snapshotId]);
  }

  bool deleteBySnapshotIdSync(String snapshotId) {
    return deleteByIndexSync(r'snapshotId', [snapshotId]);
  }

  Future<List<PerformanceSnapshot?>> getAllBySnapshotId(
    List<String> snapshotIdValues,
  ) {
    final values = snapshotIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'snapshotId', values);
  }

  List<PerformanceSnapshot?> getAllBySnapshotIdSync(
    List<String> snapshotIdValues,
  ) {
    final values = snapshotIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'snapshotId', values);
  }

  Future<int> deleteAllBySnapshotId(List<String> snapshotIdValues) {
    final values = snapshotIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'snapshotId', values);
  }

  int deleteAllBySnapshotIdSync(List<String> snapshotIdValues) {
    final values = snapshotIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'snapshotId', values);
  }

  Future<Id> putBySnapshotId(PerformanceSnapshot object) {
    return putByIndex(r'snapshotId', object);
  }

  Id putBySnapshotIdSync(PerformanceSnapshot object, {bool saveLinks = true}) {
    return putByIndexSync(r'snapshotId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySnapshotId(List<PerformanceSnapshot> objects) {
    return putAllByIndex(r'snapshotId', objects);
  }

  List<Id> putAllBySnapshotIdSync(
    List<PerformanceSnapshot> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'snapshotId', objects, saveLinks: saveLinks);
  }
}

extension PerformanceSnapshotQueryWhereSort
    on QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QWhere> {
  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PerformanceSnapshotQueryWhere
    on QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QWhereClause> {
  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterWhereClause>
  snapshotIdEqualTo(String snapshotId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'snapshotId', value: [snapshotId]),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterWhereClause>
  snapshotIdNotEqualTo(String snapshotId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'snapshotId',
                lower: [],
                upper: [snapshotId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'snapshotId',
                lower: [snapshotId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'snapshotId',
                lower: [snapshotId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'snapshotId',
                lower: [],
                upper: [snapshotId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension PerformanceSnapshotQueryFilter
    on
        QueryBuilder<
          PerformanceSnapshot,
          PerformanceSnapshot,
          QFilterCondition
        > {
  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  avgResponseTimeSecondsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'avgResponseTimeSeconds',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  avgResponseTimeSecondsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'avgResponseTimeSeconds',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  avgResponseTimeSecondsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'avgResponseTimeSeconds',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  avgResponseTimeSecondsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'avgResponseTimeSeconds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  calculatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'calculatedAt', value: value),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  calculatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'calculatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  calculatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'calculatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  calculatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'calculatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  communicationEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'communication',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  communicationGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'communication',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  communicationLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'communication',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  communicationBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'communication',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  completedSessionsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'completedSessions', value: value),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  completedSessionsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'completedSessions',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  completedSessionsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'completedSessions',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  completedSessionsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'completedSessions',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  confidenceEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'confidence',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  confidenceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'confidence',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  confidenceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'confidence',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  confidenceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'confidence',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  consistencyEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'consistency',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  consistencyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'consistency',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  consistencyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'consistency',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  consistencyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'consistency',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  knowledgeDepthEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'knowledgeDepth',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  knowledgeDepthGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'knowledgeDepth',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  knowledgeDepthLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'knowledgeDepth',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  knowledgeDepthBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'knowledgeDepth',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  learningAbilityEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'learningAbility',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  learningAbilityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'learningAbility',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  learningAbilityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'learningAbility',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  learningAbilityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'learningAbility',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  medianResponseTimeSecondsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'medianResponseTimeSeconds',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  medianResponseTimeSecondsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'medianResponseTimeSeconds',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  medianResponseTimeSecondsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'medianResponseTimeSeconds',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  medianResponseTimeSecondsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'medianResponseTimeSeconds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  overallScoreEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'overallScore',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  overallScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'overallScore',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  overallScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'overallScore',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  overallScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'overallScore',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  readinessTierEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'readinessTier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  readinessTierGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'readinessTier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  readinessTierLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'readinessTier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  readinessTierBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'readinessTier',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  readinessTierStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'readinessTier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  readinessTierEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'readinessTier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  readinessTierContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'readinessTier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  readinessTierMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'readinessTier',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  readinessTierIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'readinessTier', value: ''),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  readinessTierIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'readinessTier', value: ''),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  responseTimeSpeedScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'responseTimeSpeedScore',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  responseTimeSpeedScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'responseTimeSpeedScore',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  responseTimeSpeedScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'responseTimeSpeedScore',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  responseTimeSpeedScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'responseTimeSpeedScore',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  scoreDeltaEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'scoreDelta',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  scoreDeltaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'scoreDelta',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  scoreDeltaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'scoreDelta',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  scoreDeltaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'scoreDelta',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  sessionSourceEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sessionSource',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  sessionSourceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sessionSource',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  sessionSourceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sessionSource',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  sessionSourceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sessionSource',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  sessionSourceStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sessionSource',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  sessionSourceEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sessionSource',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  sessionSourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sessionSource',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  sessionSourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sessionSource',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  sessionSourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sessionSource', value: ''),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  sessionSourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sessionSource', value: ''),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  snapshotIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'snapshotId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  snapshotIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'snapshotId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  snapshotIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'snapshotId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  snapshotIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'snapshotId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  snapshotIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'snapshotId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  snapshotIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'snapshotId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  snapshotIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'snapshotId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  snapshotIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'snapshotId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  snapshotIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'snapshotId', value: ''),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  snapshotIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'snapshotId', value: ''),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  technicalAccuracyEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'technicalAccuracy',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  technicalAccuracyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'technicalAccuracy',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  technicalAccuracyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'technicalAccuracy',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  technicalAccuracyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'technicalAccuracy',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  totalQuestionsAnsweredEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'totalQuestionsAnswered',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  totalQuestionsAnsweredGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalQuestionsAnswered',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  totalQuestionsAnsweredLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalQuestionsAnswered',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterFilterCondition>
  totalQuestionsAnsweredBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalQuestionsAnswered',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension PerformanceSnapshotQueryObject
    on
        QueryBuilder<
          PerformanceSnapshot,
          PerformanceSnapshot,
          QFilterCondition
        > {}

extension PerformanceSnapshotQueryLinks
    on
        QueryBuilder<
          PerformanceSnapshot,
          PerformanceSnapshot,
          QFilterCondition
        > {}

extension PerformanceSnapshotQuerySortBy
    on QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QSortBy> {
  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByAvgResponseTimeSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgResponseTimeSeconds', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByAvgResponseTimeSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgResponseTimeSeconds', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByCalculatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByCalculatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByCommunication() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'communication', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByCommunicationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'communication', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByCompletedSessions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedSessions', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByCompletedSessionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedSessions', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByConsistency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consistency', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByConsistencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consistency', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByKnowledgeDepth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'knowledgeDepth', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByKnowledgeDepthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'knowledgeDepth', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByLearningAbility() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'learningAbility', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByLearningAbilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'learningAbility', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByMedianResponseTimeSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medianResponseTimeSeconds', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByMedianResponseTimeSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medianResponseTimeSeconds', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByOverallScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByOverallScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByReadinessTier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readinessTier', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByReadinessTierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readinessTier', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByResponseTimeSpeedScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseTimeSpeedScore', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByResponseTimeSpeedScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseTimeSpeedScore', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByScoreDelta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreDelta', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByScoreDeltaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreDelta', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortBySessionSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionSource', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortBySessionSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionSource', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortBySnapshotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snapshotId', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortBySnapshotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snapshotId', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByTechnicalAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technicalAccuracy', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByTechnicalAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technicalAccuracy', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByTotalQuestionsAnswered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuestionsAnswered', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  sortByTotalQuestionsAnsweredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuestionsAnswered', Sort.desc);
    });
  }
}

extension PerformanceSnapshotQuerySortThenBy
    on QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QSortThenBy> {
  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByAvgResponseTimeSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgResponseTimeSeconds', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByAvgResponseTimeSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgResponseTimeSeconds', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByCalculatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByCalculatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculatedAt', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByCommunication() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'communication', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByCommunicationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'communication', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByCompletedSessions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedSessions', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByCompletedSessionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedSessions', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByConsistency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consistency', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByConsistencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consistency', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByKnowledgeDepth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'knowledgeDepth', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByKnowledgeDepthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'knowledgeDepth', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByLearningAbility() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'learningAbility', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByLearningAbilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'learningAbility', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByMedianResponseTimeSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medianResponseTimeSeconds', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByMedianResponseTimeSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medianResponseTimeSeconds', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByOverallScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByOverallScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByReadinessTier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readinessTier', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByReadinessTierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readinessTier', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByResponseTimeSpeedScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseTimeSpeedScore', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByResponseTimeSpeedScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseTimeSpeedScore', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByScoreDelta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreDelta', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByScoreDeltaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreDelta', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenBySessionSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionSource', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenBySessionSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionSource', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenBySnapshotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snapshotId', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenBySnapshotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snapshotId', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByTechnicalAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technicalAccuracy', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByTechnicalAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technicalAccuracy', Sort.desc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByTotalQuestionsAnswered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuestionsAnswered', Sort.asc);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QAfterSortBy>
  thenByTotalQuestionsAnsweredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuestionsAnswered', Sort.desc);
    });
  }
}

extension PerformanceSnapshotQueryWhereDistinct
    on QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QDistinct> {
  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QDistinct>
  distinctByAvgResponseTimeSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avgResponseTimeSeconds');
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QDistinct>
  distinctByCalculatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calculatedAt');
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QDistinct>
  distinctByCommunication() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'communication');
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QDistinct>
  distinctByCompletedSessions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedSessions');
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QDistinct>
  distinctByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confidence');
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QDistinct>
  distinctByConsistency() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'consistency');
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QDistinct>
  distinctByKnowledgeDepth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'knowledgeDepth');
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QDistinct>
  distinctByLearningAbility() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'learningAbility');
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QDistinct>
  distinctByMedianResponseTimeSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'medianResponseTimeSeconds');
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QDistinct>
  distinctByOverallScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overallScore');
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QDistinct>
  distinctByReadinessTier({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'readinessTier',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QDistinct>
  distinctByResponseTimeSpeedScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'responseTimeSpeedScore');
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QDistinct>
  distinctByScoreDelta() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scoreDelta');
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QDistinct>
  distinctBySessionSource({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'sessionSource',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QDistinct>
  distinctBySnapshotId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'snapshotId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QDistinct>
  distinctByTechnicalAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'technicalAccuracy');
    });
  }

  QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QDistinct>
  distinctByTotalQuestionsAnswered() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalQuestionsAnswered');
    });
  }
}

extension PerformanceSnapshotQueryProperty
    on QueryBuilder<PerformanceSnapshot, PerformanceSnapshot, QQueryProperty> {
  QueryBuilder<PerformanceSnapshot, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PerformanceSnapshot, double, QQueryOperations>
  avgResponseTimeSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avgResponseTimeSeconds');
    });
  }

  QueryBuilder<PerformanceSnapshot, DateTime, QQueryOperations>
  calculatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calculatedAt');
    });
  }

  QueryBuilder<PerformanceSnapshot, double, QQueryOperations>
  communicationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'communication');
    });
  }

  QueryBuilder<PerformanceSnapshot, int, QQueryOperations>
  completedSessionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedSessions');
    });
  }

  QueryBuilder<PerformanceSnapshot, double, QQueryOperations>
  confidenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confidence');
    });
  }

  QueryBuilder<PerformanceSnapshot, double, QQueryOperations>
  consistencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'consistency');
    });
  }

  QueryBuilder<PerformanceSnapshot, double, QQueryOperations>
  knowledgeDepthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'knowledgeDepth');
    });
  }

  QueryBuilder<PerformanceSnapshot, double, QQueryOperations>
  learningAbilityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'learningAbility');
    });
  }

  QueryBuilder<PerformanceSnapshot, double, QQueryOperations>
  medianResponseTimeSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medianResponseTimeSeconds');
    });
  }

  QueryBuilder<PerformanceSnapshot, double, QQueryOperations>
  overallScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overallScore');
    });
  }

  QueryBuilder<PerformanceSnapshot, String, QQueryOperations>
  readinessTierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'readinessTier');
    });
  }

  QueryBuilder<PerformanceSnapshot, double, QQueryOperations>
  responseTimeSpeedScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'responseTimeSpeedScore');
    });
  }

  QueryBuilder<PerformanceSnapshot, double, QQueryOperations>
  scoreDeltaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scoreDelta');
    });
  }

  QueryBuilder<PerformanceSnapshot, String, QQueryOperations>
  sessionSourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sessionSource');
    });
  }

  QueryBuilder<PerformanceSnapshot, String, QQueryOperations>
  snapshotIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'snapshotId');
    });
  }

  QueryBuilder<PerformanceSnapshot, double, QQueryOperations>
  technicalAccuracyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'technicalAccuracy');
    });
  }

  QueryBuilder<PerformanceSnapshot, int, QQueryOperations>
  totalQuestionsAnsweredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalQuestionsAnswered');
    });
  }
}
