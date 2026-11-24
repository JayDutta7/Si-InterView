// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adaptive_profile_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAdaptiveProfileRecordCollection on Isar {
  IsarCollection<AdaptiveProfileRecord> get adaptiveProfileRecords =>
      this.collection();
}

const AdaptiveProfileRecordSchema = CollectionSchema(
  name: r'AdaptiveProfileRecord',
  id: -4274449106774082425,
  properties: {
    r'attemptsCount': PropertySchema(
      id: 0,
      name: r'attemptsCount',
      type: IsarType.long,
    ),
    r'lastFeedback': PropertySchema(
      id: 1,
      name: r'lastFeedback',
      type: IsarType.string,
    ),
    r'questionsAtCurrentTier': PropertySchema(
      id: 2,
      name: r'questionsAtCurrentTier',
      type: IsarType.long,
    ),
    r'rating': PropertySchema(id: 3, name: r'rating', type: IsarType.double),
    r'scopeKey': PropertySchema(
      id: 4,
      name: r'scopeKey',
      type: IsarType.string,
    ),
    r'tier': PropertySchema(
      id: 5,
      name: r'tier',
      type: IsarType.string,
      enumMap: _AdaptiveProfileRecordtierEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _adaptiveProfileRecordEstimateSize,
  serialize: _adaptiveProfileRecordSerialize,
  deserialize: _adaptiveProfileRecordDeserialize,
  deserializeProp: _adaptiveProfileRecordDeserializeProp,
  idName: r'id',
  indexes: {
    r'scopeKey': IndexSchema(
      id: -388923758492624597,
      name: r'scopeKey',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'scopeKey',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _adaptiveProfileRecordGetId,
  getLinks: _adaptiveProfileRecordGetLinks,
  attach: _adaptiveProfileRecordAttach,
  version: '3.2.0',
);

int _adaptiveProfileRecordEstimateSize(
  AdaptiveProfileRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.lastFeedback;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.scopeKey.length * 3;
  bytesCount += 3 + object.tier.name.length * 3;
  return bytesCount;
}

void _adaptiveProfileRecordSerialize(
  AdaptiveProfileRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.attemptsCount);
  writer.writeString(offsets[1], object.lastFeedback);
  writer.writeLong(offsets[2], object.questionsAtCurrentTier);
  writer.writeDouble(offsets[3], object.rating);
  writer.writeString(offsets[4], object.scopeKey);
  writer.writeString(offsets[5], object.tier.name);
  writer.writeDateTime(offsets[6], object.updatedAt);
}

AdaptiveProfileRecord _adaptiveProfileRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AdaptiveProfileRecord();
  object.attemptsCount = reader.readLong(offsets[0]);
  object.id = id;
  object.lastFeedback = reader.readStringOrNull(offsets[1]);
  object.questionsAtCurrentTier = reader.readLong(offsets[2]);
  object.rating = reader.readDouble(offsets[3]);
  object.scopeKey = reader.readString(offsets[4]);
  object.tier =
      _AdaptiveProfileRecordtierValueEnumMap[reader.readStringOrNull(
        offsets[5],
      )] ??
      DifficultyTier.mid;
  object.updatedAt = reader.readDateTime(offsets[6]);
  return object;
}

P _adaptiveProfileRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (_AdaptiveProfileRecordtierValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              DifficultyTier.mid)
          as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AdaptiveProfileRecordtierEnumValueMap = {
  r'mid': r'mid',
  r'senior': r'senior',
  r'techLead': r'techLead',
};
const _AdaptiveProfileRecordtierValueEnumMap = {
  r'mid': DifficultyTier.mid,
  r'senior': DifficultyTier.senior,
  r'techLead': DifficultyTier.techLead,
};

Id _adaptiveProfileRecordGetId(AdaptiveProfileRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _adaptiveProfileRecordGetLinks(
  AdaptiveProfileRecord object,
) {
  return [];
}

void _adaptiveProfileRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  AdaptiveProfileRecord object,
) {
  object.id = id;
}

extension AdaptiveProfileRecordByIndex
    on IsarCollection<AdaptiveProfileRecord> {
  Future<AdaptiveProfileRecord?> getByScopeKey(String scopeKey) {
    return getByIndex(r'scopeKey', [scopeKey]);
  }

  AdaptiveProfileRecord? getByScopeKeySync(String scopeKey) {
    return getByIndexSync(r'scopeKey', [scopeKey]);
  }

  Future<bool> deleteByScopeKey(String scopeKey) {
    return deleteByIndex(r'scopeKey', [scopeKey]);
  }

  bool deleteByScopeKeySync(String scopeKey) {
    return deleteByIndexSync(r'scopeKey', [scopeKey]);
  }

  Future<List<AdaptiveProfileRecord?>> getAllByScopeKey(
    List<String> scopeKeyValues,
  ) {
    final values = scopeKeyValues.map((e) => [e]).toList();
    return getAllByIndex(r'scopeKey', values);
  }

  List<AdaptiveProfileRecord?> getAllByScopeKeySync(
    List<String> scopeKeyValues,
  ) {
    final values = scopeKeyValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'scopeKey', values);
  }

  Future<int> deleteAllByScopeKey(List<String> scopeKeyValues) {
    final values = scopeKeyValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'scopeKey', values);
  }

  int deleteAllByScopeKeySync(List<String> scopeKeyValues) {
    final values = scopeKeyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'scopeKey', values);
  }

  Future<Id> putByScopeKey(AdaptiveProfileRecord object) {
    return putByIndex(r'scopeKey', object);
  }

  Id putByScopeKeySync(AdaptiveProfileRecord object, {bool saveLinks = true}) {
    return putByIndexSync(r'scopeKey', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByScopeKey(List<AdaptiveProfileRecord> objects) {
    return putAllByIndex(r'scopeKey', objects);
  }

  List<Id> putAllByScopeKeySync(
    List<AdaptiveProfileRecord> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'scopeKey', objects, saveLinks: saveLinks);
  }
}

extension AdaptiveProfileRecordQueryWhereSort
    on QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QWhere> {
  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AdaptiveProfileRecordQueryWhere
    on
        QueryBuilder<
          AdaptiveProfileRecord,
          AdaptiveProfileRecord,
          QWhereClause
        > {
  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterWhereClause>
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

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterWhereClause>
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

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterWhereClause>
  scopeKeyEqualTo(String scopeKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'scopeKey', value: [scopeKey]),
      );
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterWhereClause>
  scopeKeyNotEqualTo(String scopeKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scopeKey',
                lower: [],
                upper: [scopeKey],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scopeKey',
                lower: [scopeKey],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scopeKey',
                lower: [scopeKey],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scopeKey',
                lower: [],
                upper: [scopeKey],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension AdaptiveProfileRecordQueryFilter
    on
        QueryBuilder<
          AdaptiveProfileRecord,
          AdaptiveProfileRecord,
          QFilterCondition
        > {
  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  attemptsCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'attemptsCount', value: value),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  attemptsCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'attemptsCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  attemptsCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'attemptsCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  attemptsCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'attemptsCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
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
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
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
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
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
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
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
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  lastFeedbackIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastFeedback'),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  lastFeedbackIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastFeedback'),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  lastFeedbackEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lastFeedback',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  lastFeedbackGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastFeedback',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  lastFeedbackLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastFeedback',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  lastFeedbackBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastFeedback',
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
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  lastFeedbackStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'lastFeedback',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  lastFeedbackEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'lastFeedback',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  lastFeedbackContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'lastFeedback',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  lastFeedbackMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'lastFeedback',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  lastFeedbackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastFeedback', value: ''),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  lastFeedbackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'lastFeedback', value: ''),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  questionsAtCurrentTierEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'questionsAtCurrentTier',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  questionsAtCurrentTierGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'questionsAtCurrentTier',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  questionsAtCurrentTierLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'questionsAtCurrentTier',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  questionsAtCurrentTierBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'questionsAtCurrentTier',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  ratingEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'rating',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  ratingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rating',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  ratingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rating',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  ratingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rating',
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
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  scopeKeyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'scopeKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  scopeKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'scopeKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  scopeKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'scopeKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  scopeKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'scopeKey',
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
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  scopeKeyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'scopeKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  scopeKeyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'scopeKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  scopeKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'scopeKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  scopeKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'scopeKey',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  scopeKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'scopeKey', value: ''),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  scopeKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'scopeKey', value: ''),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  tierEqualTo(DifficultyTier value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  tierGreaterThan(
    DifficultyTier value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  tierLessThan(
    DifficultyTier value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  tierBetween(
    DifficultyTier lower,
    DifficultyTier upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tier',
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
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  tierStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  tierEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  tierContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tier',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  tierMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tier',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  tierIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tier', value: ''),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  tierIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tier', value: ''),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  updatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  updatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    AdaptiveProfileRecord,
    AdaptiveProfileRecord,
    QAfterFilterCondition
  >
  updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension AdaptiveProfileRecordQueryObject
    on
        QueryBuilder<
          AdaptiveProfileRecord,
          AdaptiveProfileRecord,
          QFilterCondition
        > {}

extension AdaptiveProfileRecordQueryLinks
    on
        QueryBuilder<
          AdaptiveProfileRecord,
          AdaptiveProfileRecord,
          QFilterCondition
        > {}

extension AdaptiveProfileRecordQuerySortBy
    on QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QSortBy> {
  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  sortByAttemptsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptsCount', Sort.asc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  sortByAttemptsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptsCount', Sort.desc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  sortByLastFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFeedback', Sort.asc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  sortByLastFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFeedback', Sort.desc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  sortByQuestionsAtCurrentTier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionsAtCurrentTier', Sort.asc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  sortByQuestionsAtCurrentTierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionsAtCurrentTier', Sort.desc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  sortByScopeKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scopeKey', Sort.asc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  sortByScopeKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scopeKey', Sort.desc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  sortByTier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tier', Sort.asc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  sortByTierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tier', Sort.desc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension AdaptiveProfileRecordQuerySortThenBy
    on QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QSortThenBy> {
  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  thenByAttemptsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptsCount', Sort.asc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  thenByAttemptsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptsCount', Sort.desc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  thenByLastFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFeedback', Sort.asc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  thenByLastFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFeedback', Sort.desc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  thenByQuestionsAtCurrentTier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionsAtCurrentTier', Sort.asc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  thenByQuestionsAtCurrentTierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionsAtCurrentTier', Sort.desc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  thenByScopeKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scopeKey', Sort.asc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  thenByScopeKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scopeKey', Sort.desc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  thenByTier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tier', Sort.asc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  thenByTierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tier', Sort.desc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension AdaptiveProfileRecordQueryWhereDistinct
    on QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QDistinct> {
  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QDistinct>
  distinctByAttemptsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attemptsCount');
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QDistinct>
  distinctByLastFeedback({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastFeedback', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QDistinct>
  distinctByQuestionsAtCurrentTier() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionsAtCurrentTier');
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QDistinct>
  distinctByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating');
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QDistinct>
  distinctByScopeKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scopeKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QDistinct>
  distinctByTier({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tier', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AdaptiveProfileRecord, AdaptiveProfileRecord, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension AdaptiveProfileRecordQueryProperty
    on
        QueryBuilder<
          AdaptiveProfileRecord,
          AdaptiveProfileRecord,
          QQueryProperty
        > {
  QueryBuilder<AdaptiveProfileRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AdaptiveProfileRecord, int, QQueryOperations>
  attemptsCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attemptsCount');
    });
  }

  QueryBuilder<AdaptiveProfileRecord, String?, QQueryOperations>
  lastFeedbackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastFeedback');
    });
  }

  QueryBuilder<AdaptiveProfileRecord, int, QQueryOperations>
  questionsAtCurrentTierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionsAtCurrentTier');
    });
  }

  QueryBuilder<AdaptiveProfileRecord, double, QQueryOperations>
  ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<AdaptiveProfileRecord, String, QQueryOperations>
  scopeKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scopeKey');
    });
  }

  QueryBuilder<AdaptiveProfileRecord, DifficultyTier, QQueryOperations>
  tierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tier');
    });
  }

  QueryBuilder<AdaptiveProfileRecord, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
