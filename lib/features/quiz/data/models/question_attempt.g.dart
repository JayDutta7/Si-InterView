// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_attempt.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuestionAttemptCollection on Isar {
  IsarCollection<QuestionAttempt> get questionAttempts => this.collection();
}

const QuestionAttemptSchema = CollectionSchema(
  name: r'QuestionAttempt',
  id: 8944178884388344148,
  properties: {
    r'answeredAt': PropertySchema(
      id: 0,
      name: r'answeredAt',
      type: IsarType.dateTime,
    ),
    r'correctIndex': PropertySchema(
      id: 1,
      name: r'correctIndex',
      type: IsarType.long,
    ),
    r'explanation': PropertySchema(
      id: 2,
      name: r'explanation',
      type: IsarType.string,
    ),
    r'isCorrect': PropertySchema(
      id: 3,
      name: r'isCorrect',
      type: IsarType.bool,
    ),
    r'options': PropertySchema(
      id: 4,
      name: r'options',
      type: IsarType.stringList,
    ),
    r'questionHash': PropertySchema(
      id: 5,
      name: r'questionHash',
      type: IsarType.string,
    ),
    r'questionRecordId': PropertySchema(
      id: 6,
      name: r'questionRecordId',
      type: IsarType.long,
    ),
    r'questionText': PropertySchema(
      id: 7,
      name: r'questionText',
      type: IsarType.string,
    ),
    r'responseTimeMs': PropertySchema(
      id: 8,
      name: r'responseTimeMs',
      type: IsarType.long,
    ),
    r'section': PropertySchema(id: 9, name: r'section', type: IsarType.string),
    r'selectedIndex': PropertySchema(
      id: 10,
      name: r'selectedIndex',
      type: IsarType.long,
    ),
    r'sessionId': PropertySchema(
      id: 11,
      name: r'sessionId',
      type: IsarType.string,
    ),
    r'topic': PropertySchema(id: 12, name: r'topic', type: IsarType.string),
  },

  estimateSize: _questionAttemptEstimateSize,
  serialize: _questionAttemptSerialize,
  deserialize: _questionAttemptDeserialize,
  deserializeProp: _questionAttemptDeserializeProp,
  idName: r'id',
  indexes: {
    r'sessionId': IndexSchema(
      id: 6949518585047923839,
      name: r'sessionId',
      unique: false,
      replace: false,
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

  getId: _questionAttemptGetId,
  getLinks: _questionAttemptGetLinks,
  attach: _questionAttemptAttach,
  version: '3.2.0',
);

int _questionAttemptEstimateSize(
  QuestionAttempt object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.explanation.length * 3;
  bytesCount += 3 + object.options.length * 3;
  {
    for (var i = 0; i < object.options.length; i++) {
      final value = object.options[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.questionHash.length * 3;
  bytesCount += 3 + object.questionText.length * 3;
  bytesCount += 3 + object.section.length * 3;
  bytesCount += 3 + object.sessionId.length * 3;
  bytesCount += 3 + object.topic.length * 3;
  return bytesCount;
}

void _questionAttemptSerialize(
  QuestionAttempt object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.answeredAt);
  writer.writeLong(offsets[1], object.correctIndex);
  writer.writeString(offsets[2], object.explanation);
  writer.writeBool(offsets[3], object.isCorrect);
  writer.writeStringList(offsets[4], object.options);
  writer.writeString(offsets[5], object.questionHash);
  writer.writeLong(offsets[6], object.questionRecordId);
  writer.writeString(offsets[7], object.questionText);
  writer.writeLong(offsets[8], object.responseTimeMs);
  writer.writeString(offsets[9], object.section);
  writer.writeLong(offsets[10], object.selectedIndex);
  writer.writeString(offsets[11], object.sessionId);
  writer.writeString(offsets[12], object.topic);
}

QuestionAttempt _questionAttemptDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuestionAttempt();
  object.answeredAt = reader.readDateTime(offsets[0]);
  object.correctIndex = reader.readLong(offsets[1]);
  object.explanation = reader.readString(offsets[2]);
  object.id = id;
  object.isCorrect = reader.readBool(offsets[3]);
  object.options = reader.readStringList(offsets[4]) ?? [];
  object.questionHash = reader.readString(offsets[5]);
  object.questionRecordId = reader.readLong(offsets[6]);
  object.questionText = reader.readString(offsets[7]);
  object.responseTimeMs = reader.readLong(offsets[8]);
  object.section = reader.readString(offsets[9]);
  object.selectedIndex = reader.readLong(offsets[10]);
  object.sessionId = reader.readString(offsets[11]);
  object.topic = reader.readString(offsets[12]);
  return object;
}

P _questionAttemptDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _questionAttemptGetId(QuestionAttempt object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _questionAttemptGetLinks(QuestionAttempt object) {
  return [];
}

void _questionAttemptAttach(
  IsarCollection<dynamic> col,
  Id id,
  QuestionAttempt object,
) {
  object.id = id;
}

extension QuestionAttemptQueryWhereSort
    on QueryBuilder<QuestionAttempt, QuestionAttempt, QWhere> {
  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QuestionAttemptQueryWhere
    on QueryBuilder<QuestionAttempt, QuestionAttempt, QWhereClause> {
  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterWhereClause>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterWhereClause> idBetween(
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterWhereClause>
  sessionIdEqualTo(String sessionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'sessionId', value: [sessionId]),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterWhereClause>
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

extension QuestionAttemptQueryFilter
    on QueryBuilder<QuestionAttempt, QuestionAttempt, QFilterCondition> {
  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  answeredAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'answeredAt', value: value),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  answeredAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'answeredAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  answeredAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'answeredAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  answeredAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'answeredAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  correctIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'correctIndex', value: value),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  correctIndexGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'correctIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  correctIndexLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'correctIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  correctIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'correctIndex',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  explanationEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'explanation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  explanationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'explanation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  explanationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'explanation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  explanationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'explanation',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  explanationStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'explanation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  explanationEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'explanation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  explanationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'explanation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  explanationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'explanation',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  explanationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'explanation', value: ''),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  explanationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'explanation', value: ''),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  isCorrectEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isCorrect', value: value),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  optionsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'options',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  optionsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'options',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  optionsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'options',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  optionsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'options',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  optionsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'options',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  optionsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'options',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  optionsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'options',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  optionsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'options',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  optionsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'options', value: ''),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  optionsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'options', value: ''),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  optionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'options', length, true, length, true);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  optionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'options', 0, true, 0, true);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  optionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'options', 0, false, 999999, true);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  optionsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'options', 0, true, length, include);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  optionsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'options', length, include, 999999, true);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  optionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'options',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionHashEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'questionHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionHashGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'questionHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionHashLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'questionHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionHashBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'questionHash',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionHashStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'questionHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionHashEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'questionHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'questionHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionHashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'questionHash',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'questionHash', value: ''),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'questionHash', value: ''),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionRecordIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'questionRecordId', value: value),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionRecordIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'questionRecordId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionRecordIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'questionRecordId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionRecordIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'questionRecordId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionTextEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'questionText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'questionText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'questionText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'questionText',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionTextStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'questionText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionTextEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'questionText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'questionText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'questionText',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'questionText', value: ''),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  questionTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'questionText', value: ''),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  responseTimeMsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'responseTimeMs', value: value),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  responseTimeMsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'responseTimeMs',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  responseTimeMsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'responseTimeMs',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  responseTimeMsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'responseTimeMs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  sectionEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'section',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  sectionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'section',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  sectionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'section',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  sectionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'section',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  sectionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'section',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  sectionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'section',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  sectionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'section',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  sectionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'section',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  sectionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'section', value: ''),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  sectionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'section', value: ''),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  selectedIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'selectedIndex', value: value),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  selectedIndexGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'selectedIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  selectedIndexLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'selectedIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  selectedIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'selectedIndex',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  sessionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sessionId', value: ''),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  sessionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sessionId', value: ''),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
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

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  topicIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'topic', value: ''),
      );
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterFilterCondition>
  topicIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'topic', value: ''),
      );
    });
  }
}

extension QuestionAttemptQueryObject
    on QueryBuilder<QuestionAttempt, QuestionAttempt, QFilterCondition> {}

extension QuestionAttemptQueryLinks
    on QueryBuilder<QuestionAttempt, QuestionAttempt, QFilterCondition> {}

extension QuestionAttemptQuerySortBy
    on QueryBuilder<QuestionAttempt, QuestionAttempt, QSortBy> {
  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortByAnsweredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answeredAt', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortByAnsweredAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answeredAt', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortByCorrectIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctIndex', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortByCorrectIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctIndex', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortByExplanation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortByExplanationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortByIsCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCorrect', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortByIsCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCorrect', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortByQuestionHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionHash', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortByQuestionHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionHash', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortByQuestionRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionRecordId', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortByQuestionRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionRecordId', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortByQuestionText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortByQuestionTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortByResponseTimeMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseTimeMs', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortByResponseTimeMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseTimeMs', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy> sortBySection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortBySectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortBySelectedIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedIndex', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortBySelectedIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedIndex', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy> sortByTopic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  sortByTopicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.desc);
    });
  }
}

extension QuestionAttemptQuerySortThenBy
    on QueryBuilder<QuestionAttempt, QuestionAttempt, QSortThenBy> {
  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenByAnsweredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answeredAt', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenByAnsweredAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answeredAt', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenByCorrectIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctIndex', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenByCorrectIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctIndex', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenByExplanation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenByExplanationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenByIsCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCorrect', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenByIsCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCorrect', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenByQuestionHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionHash', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenByQuestionHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionHash', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenByQuestionRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionRecordId', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenByQuestionRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionRecordId', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenByQuestionText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenByQuestionTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenByResponseTimeMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseTimeMs', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenByResponseTimeMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseTimeMs', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy> thenBySection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenBySectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenBySelectedIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedIndex', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenBySelectedIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedIndex', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy> thenByTopic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.asc);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QAfterSortBy>
  thenByTopicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.desc);
    });
  }
}

extension QuestionAttemptQueryWhereDistinct
    on QueryBuilder<QuestionAttempt, QuestionAttempt, QDistinct> {
  QueryBuilder<QuestionAttempt, QuestionAttempt, QDistinct>
  distinctByAnsweredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'answeredAt');
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QDistinct>
  distinctByCorrectIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correctIndex');
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QDistinct>
  distinctByExplanation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'explanation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QDistinct>
  distinctByIsCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCorrect');
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QDistinct>
  distinctByOptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'options');
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QDistinct>
  distinctByQuestionHash({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionHash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QDistinct>
  distinctByQuestionRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionRecordId');
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QDistinct>
  distinctByQuestionText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QDistinct>
  distinctByResponseTimeMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'responseTimeMs');
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QDistinct> distinctBySection({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'section', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QDistinct>
  distinctBySelectedIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectedIndex');
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QDistinct>
  distinctBySessionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sessionId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionAttempt, QuestionAttempt, QDistinct> distinctByTopic({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'topic', caseSensitive: caseSensitive);
    });
  }
}

extension QuestionAttemptQueryProperty
    on QueryBuilder<QuestionAttempt, QuestionAttempt, QQueryProperty> {
  QueryBuilder<QuestionAttempt, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuestionAttempt, DateTime, QQueryOperations>
  answeredAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answeredAt');
    });
  }

  QueryBuilder<QuestionAttempt, int, QQueryOperations> correctIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctIndex');
    });
  }

  QueryBuilder<QuestionAttempt, String, QQueryOperations>
  explanationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'explanation');
    });
  }

  QueryBuilder<QuestionAttempt, bool, QQueryOperations> isCorrectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCorrect');
    });
  }

  QueryBuilder<QuestionAttempt, List<String>, QQueryOperations>
  optionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'options');
    });
  }

  QueryBuilder<QuestionAttempt, String, QQueryOperations>
  questionHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionHash');
    });
  }

  QueryBuilder<QuestionAttempt, int, QQueryOperations>
  questionRecordIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionRecordId');
    });
  }

  QueryBuilder<QuestionAttempt, String, QQueryOperations>
  questionTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionText');
    });
  }

  QueryBuilder<QuestionAttempt, int, QQueryOperations>
  responseTimeMsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'responseTimeMs');
    });
  }

  QueryBuilder<QuestionAttempt, String, QQueryOperations> sectionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'section');
    });
  }

  QueryBuilder<QuestionAttempt, int, QQueryOperations> selectedIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedIndex');
    });
  }

  QueryBuilder<QuestionAttempt, String, QQueryOperations> sessionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sessionId');
    });
  }

  QueryBuilder<QuestionAttempt, String, QQueryOperations> topicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topic');
    });
  }
}
