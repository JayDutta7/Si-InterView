// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_interview_session.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLiveInterviewSessionCollection on Isar {
  IsarCollection<LiveInterviewSession> get liveInterviewSessions =>
      this.collection();
}

const LiveInterviewSessionSchema = CollectionSchema(
  name: r'LiveInterviewSession',
  id: -8186055192117119711,
  properties: {
    r'completedAt': PropertySchema(
      id: 0,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'difficulty': PropertySchema(
      id: 1,
      name: r'difficulty',
      type: IsarType.string,
    ),
    r'feedbackSummary': PropertySchema(
      id: 2,
      name: r'feedbackSummary',
      type: IsarType.string,
    ),
    r'isCompleted': PropertySchema(
      id: 3,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'overallScore': PropertySchema(
      id: 4,
      name: r'overallScore',
      type: IsarType.double,
    ),
    r'sessionId': PropertySchema(
      id: 5,
      name: r'sessionId',
      type: IsarType.string,
    ),
    r'startedAt': PropertySchema(
      id: 6,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
    r'topic': PropertySchema(id: 7, name: r'topic', type: IsarType.string),
    r'totalExchanges': PropertySchema(
      id: 8,
      name: r'totalExchanges',
      type: IsarType.long,
    ),
    r'transcript': PropertySchema(
      id: 9,
      name: r'transcript',
      type: IsarType.stringList,
    ),
  },

  estimateSize: _liveInterviewSessionEstimateSize,
  serialize: _liveInterviewSessionSerialize,
  deserialize: _liveInterviewSessionDeserialize,
  deserializeProp: _liveInterviewSessionDeserializeProp,
  idName: r'id',
  indexes: {
    r'sessionId': IndexSchema(
      id: 6949518585047923839,
      name: r'sessionId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'sessionId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _liveInterviewSessionGetId,
  getLinks: _liveInterviewSessionGetLinks,
  attach: _liveInterviewSessionAttach,
  version: '3.2.0',
);

int _liveInterviewSessionEstimateSize(
  LiveInterviewSession object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.difficulty.length * 3;
  bytesCount += 3 + object.feedbackSummary.length * 3;
  bytesCount += 3 + object.sessionId.length * 3;
  bytesCount += 3 + object.topic.length * 3;
  bytesCount += 3 + object.transcript.length * 3;
  {
    for (var i = 0; i < object.transcript.length; i++) {
      final value = object.transcript[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _liveInterviewSessionSerialize(
  LiveInterviewSession object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.completedAt);
  writer.writeString(offsets[1], object.difficulty);
  writer.writeString(offsets[2], object.feedbackSummary);
  writer.writeBool(offsets[3], object.isCompleted);
  writer.writeDouble(offsets[4], object.overallScore);
  writer.writeString(offsets[5], object.sessionId);
  writer.writeDateTime(offsets[6], object.startedAt);
  writer.writeString(offsets[7], object.topic);
  writer.writeLong(offsets[8], object.totalExchanges);
  writer.writeStringList(offsets[9], object.transcript);
}

LiveInterviewSession _liveInterviewSessionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LiveInterviewSession();
  object.completedAt = reader.readDateTimeOrNull(offsets[0]);
  object.difficulty = reader.readString(offsets[1]);
  object.feedbackSummary = reader.readString(offsets[2]);
  object.id = id;
  object.isCompleted = reader.readBool(offsets[3]);
  object.overallScore = reader.readDouble(offsets[4]);
  object.sessionId = reader.readString(offsets[5]);
  object.startedAt = reader.readDateTime(offsets[6]);
  object.topic = reader.readString(offsets[7]);
  object.totalExchanges = reader.readLong(offsets[8]);
  object.transcript = reader.readStringList(offsets[9]) ?? [];
  return object;
}

P _liveInterviewSessionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _liveInterviewSessionGetId(LiveInterviewSession object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _liveInterviewSessionGetLinks(
  LiveInterviewSession object,
) {
  return [];
}

void _liveInterviewSessionAttach(
  IsarCollection<dynamic> col,
  Id id,
  LiveInterviewSession object,
) {
  object.id = id;
}

extension LiveInterviewSessionByIndex on IsarCollection<LiveInterviewSession> {
  Future<LiveInterviewSession?> getBySessionId(String sessionId) {
    return getByIndex(r'sessionId', [sessionId]);
  }

  LiveInterviewSession? getBySessionIdSync(String sessionId) {
    return getByIndexSync(r'sessionId', [sessionId]);
  }

  Future<bool> deleteBySessionId(String sessionId) {
    return deleteByIndex(r'sessionId', [sessionId]);
  }

  bool deleteBySessionIdSync(String sessionId) {
    return deleteByIndexSync(r'sessionId', [sessionId]);
  }

  Future<List<LiveInterviewSession?>> getAllBySessionId(
    List<String> sessionIdValues,
  ) {
    final values = sessionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'sessionId', values);
  }

  List<LiveInterviewSession?> getAllBySessionIdSync(
    List<String> sessionIdValues,
  ) {
    final values = sessionIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'sessionId', values);
  }

  Future<int> deleteAllBySessionId(List<String> sessionIdValues) {
    final values = sessionIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'sessionId', values);
  }

  int deleteAllBySessionIdSync(List<String> sessionIdValues) {
    final values = sessionIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'sessionId', values);
  }

  Future<Id> putBySessionId(LiveInterviewSession object) {
    return putByIndex(r'sessionId', object);
  }

  Id putBySessionIdSync(LiveInterviewSession object, {bool saveLinks = true}) {
    return putByIndexSync(r'sessionId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySessionId(List<LiveInterviewSession> objects) {
    return putAllByIndex(r'sessionId', objects);
  }

  List<Id> putAllBySessionIdSync(
    List<LiveInterviewSession> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'sessionId', objects, saveLinks: saveLinks);
  }
}

extension LiveInterviewSessionQueryWhereSort
    on QueryBuilder<LiveInterviewSession, LiveInterviewSession, QWhere> {
  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LiveInterviewSessionQueryWhere
    on QueryBuilder<LiveInterviewSession, LiveInterviewSession, QWhereClause> {
  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterWhereClause>
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

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterWhereClause>
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

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterWhereClause>
  sessionIdEqualTo(String sessionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'sessionId', value: [sessionId]),
      );
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterWhereClause>
  sessionIdNotEqualTo(String sessionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sessionId',
                lower: [],
                upper: [sessionId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sessionId',
                lower: [sessionId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sessionId',
                lower: [sessionId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sessionId',
                lower: [],
                upper: [sessionId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension LiveInterviewSessionQueryFilter
    on
        QueryBuilder<
          LiveInterviewSession,
          LiveInterviewSession,
          QFilterCondition
        > {
  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'completedAt'),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'completedAt'),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'completedAt', value: value),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  completedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'completedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  completedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'completedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  completedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'completedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  difficultyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  difficultyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  difficultyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  difficultyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'difficulty',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  difficultyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  difficultyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  difficultyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  difficultyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'difficulty',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  difficultyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'difficulty', value: ''),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  difficultyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'difficulty', value: ''),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  feedbackSummaryEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'feedbackSummary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  feedbackSummaryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'feedbackSummary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  feedbackSummaryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'feedbackSummary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  feedbackSummaryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'feedbackSummary',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  feedbackSummaryStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'feedbackSummary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  feedbackSummaryEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'feedbackSummary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  feedbackSummaryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'feedbackSummary',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  feedbackSummaryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'feedbackSummary',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  feedbackSummaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'feedbackSummary', value: ''),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  feedbackSummaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'feedbackSummary', value: ''),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isCompleted', value: value),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  sessionIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sessionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  sessionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sessionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  sessionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sessionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  sessionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sessionId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  sessionIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sessionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  sessionIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sessionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  sessionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sessionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  sessionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sessionId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  sessionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sessionId', value: ''),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  sessionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sessionId', value: ''),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  startedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'startedAt', value: value),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  startedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'startedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  startedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'startedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  startedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'startedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  topicEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'topic',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  topicGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'topic',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  topicLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'topic',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  topicBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'topic',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  topicStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'topic',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  topicEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'topic',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  topicContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'topic',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  topicMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'topic',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  topicIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'topic', value: ''),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  topicIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'topic', value: ''),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  totalExchangesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalExchanges', value: value),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  totalExchangesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalExchanges',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  totalExchangesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalExchanges',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  totalExchangesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalExchanges',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  transcriptElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'transcript',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  transcriptElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'transcript',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  transcriptElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'transcript',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  transcriptElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'transcript',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  transcriptElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'transcript',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  transcriptElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'transcript',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  transcriptElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'transcript',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  transcriptElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'transcript',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  transcriptElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'transcript', value: ''),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  transcriptElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'transcript', value: ''),
      );
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  transcriptLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'transcript', length, true, length, true);
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  transcriptIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'transcript', 0, true, 0, true);
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  transcriptIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'transcript', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  transcriptLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'transcript', 0, true, length, include);
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  transcriptLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'transcript', length, include, 999999, true);
    });
  }

  QueryBuilder<
    LiveInterviewSession,
    LiveInterviewSession,
    QAfterFilterCondition
  >
  transcriptLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'transcript',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension LiveInterviewSessionQueryObject
    on
        QueryBuilder<
          LiveInterviewSession,
          LiveInterviewSession,
          QFilterCondition
        > {}

extension LiveInterviewSessionQueryLinks
    on
        QueryBuilder<
          LiveInterviewSession,
          LiveInterviewSession,
          QFilterCondition
        > {}

extension LiveInterviewSessionQuerySortBy
    on QueryBuilder<LiveInterviewSession, LiveInterviewSession, QSortBy> {
  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  sortByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.asc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  sortByDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.desc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  sortByFeedbackSummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedbackSummary', Sort.asc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  sortByFeedbackSummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedbackSummary', Sort.desc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  sortByOverallScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.asc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  sortByOverallScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.desc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  sortBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  sortBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  sortByTopic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.asc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  sortByTopicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.desc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  sortByTotalExchanges() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExchanges', Sort.asc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  sortByTotalExchangesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExchanges', Sort.desc);
    });
  }
}

extension LiveInterviewSessionQuerySortThenBy
    on QueryBuilder<LiveInterviewSession, LiveInterviewSession, QSortThenBy> {
  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.asc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenByDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.desc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenByFeedbackSummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedbackSummary', Sort.asc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenByFeedbackSummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedbackSummary', Sort.desc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenByOverallScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.asc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenByOverallScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.desc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenByTopic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.asc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenByTopicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.desc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenByTotalExchanges() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExchanges', Sort.asc);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QAfterSortBy>
  thenByTotalExchangesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExchanges', Sort.desc);
    });
  }
}

extension LiveInterviewSessionQueryWhereDistinct
    on QueryBuilder<LiveInterviewSession, LiveInterviewSession, QDistinct> {
  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QDistinct>
  distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QDistinct>
  distinctByDifficulty({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'difficulty', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QDistinct>
  distinctByFeedbackSummary({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'feedbackSummary',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QDistinct>
  distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QDistinct>
  distinctByOverallScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overallScore');
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QDistinct>
  distinctBySessionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sessionId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QDistinct>
  distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QDistinct>
  distinctByTopic({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'topic', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QDistinct>
  distinctByTotalExchanges() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalExchanges');
    });
  }

  QueryBuilder<LiveInterviewSession, LiveInterviewSession, QDistinct>
  distinctByTranscript() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transcript');
    });
  }
}

extension LiveInterviewSessionQueryProperty
    on
        QueryBuilder<
          LiveInterviewSession,
          LiveInterviewSession,
          QQueryProperty
        > {
  QueryBuilder<LiveInterviewSession, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LiveInterviewSession, DateTime?, QQueryOperations>
  completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<LiveInterviewSession, String, QQueryOperations>
  difficultyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'difficulty');
    });
  }

  QueryBuilder<LiveInterviewSession, String, QQueryOperations>
  feedbackSummaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'feedbackSummary');
    });
  }

  QueryBuilder<LiveInterviewSession, bool, QQueryOperations>
  isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<LiveInterviewSession, double, QQueryOperations>
  overallScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overallScore');
    });
  }

  QueryBuilder<LiveInterviewSession, String, QQueryOperations>
  sessionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sessionId');
    });
  }

  QueryBuilder<LiveInterviewSession, DateTime, QQueryOperations>
  startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<LiveInterviewSession, String, QQueryOperations> topicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topic');
    });
  }

  QueryBuilder<LiveInterviewSession, int, QQueryOperations>
  totalExchangesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalExchanges');
    });
  }

  QueryBuilder<LiveInterviewSession, List<String>, QQueryOperations>
  transcriptProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transcript');
    });
  }
}
