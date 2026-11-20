// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuestionRecordCollection on Isar {
  IsarCollection<QuestionRecord> get questionRecords => this.collection();
}

const QuestionRecordSchema = CollectionSchema(
  name: r'QuestionRecord',
  id: -2596799986946836067,
  properties: {
    r'correctOptionIndex': PropertySchema(
      id: 0,
      name: r'correctOptionIndex',
      type: IsarType.long,
    ),
    r'difficulty': PropertySchema(
      id: 1,
      name: r'difficulty',
      type: IsarType.string,
    ),
    r'explanation': PropertySchema(
      id: 2,
      name: r'explanation',
      type: IsarType.string,
    ),
    r'firstSeenAt': PropertySchema(
      id: 3,
      name: r'firstSeenAt',
      type: IsarType.dateTime,
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
    r'questionText': PropertySchema(
      id: 6,
      name: r'questionText',
      type: IsarType.string,
    ),
    r'section': PropertySchema(id: 7, name: r'section', type: IsarType.string),
    r'timesAppeared': PropertySchema(
      id: 8,
      name: r'timesAppeared',
      type: IsarType.long,
    ),
    r'topic': PropertySchema(id: 9, name: r'topic', type: IsarType.string),
  },

  estimateSize: _questionRecordEstimateSize,
  serialize: _questionRecordSerialize,
  deserialize: _questionRecordDeserialize,
  deserializeProp: _questionRecordDeserializeProp,
  idName: r'id',
  indexes: {
    r'questionHash': IndexSchema(
      id: 6570774640181109505,
      name: r'questionHash',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'questionHash',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _questionRecordGetId,
  getLinks: _questionRecordGetLinks,
  attach: _questionRecordAttach,
  version: '3.2.0',
);

int _questionRecordEstimateSize(
  QuestionRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.difficulty.length * 3;
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
  bytesCount += 3 + object.topic.length * 3;
  return bytesCount;
}

void _questionRecordSerialize(
  QuestionRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.correctOptionIndex);
  writer.writeString(offsets[1], object.difficulty);
  writer.writeString(offsets[2], object.explanation);
  writer.writeDateTime(offsets[3], object.firstSeenAt);
  writer.writeStringList(offsets[4], object.options);
  writer.writeString(offsets[5], object.questionHash);
  writer.writeString(offsets[6], object.questionText);
  writer.writeString(offsets[7], object.section);
  writer.writeLong(offsets[8], object.timesAppeared);
  writer.writeString(offsets[9], object.topic);
}

QuestionRecord _questionRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuestionRecord();
  object.correctOptionIndex = reader.readLong(offsets[0]);
  object.difficulty = reader.readString(offsets[1]);
  object.explanation = reader.readString(offsets[2]);
  object.firstSeenAt = reader.readDateTime(offsets[3]);
  object.id = id;
  object.options = reader.readStringList(offsets[4]) ?? [];
  object.questionHash = reader.readString(offsets[5]);
  object.questionText = reader.readString(offsets[6]);
  object.section = reader.readString(offsets[7]);
  object.timesAppeared = reader.readLong(offsets[8]);
  object.topic = reader.readString(offsets[9]);
  return object;
}

P _questionRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _questionRecordGetId(QuestionRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _questionRecordGetLinks(QuestionRecord object) {
  return [];
}

void _questionRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  QuestionRecord object,
) {
  object.id = id;
}

extension QuestionRecordByIndex on IsarCollection<QuestionRecord> {
  Future<QuestionRecord?> getByQuestionHash(String questionHash) {
    return getByIndex(r'questionHash', [questionHash]);
  }

  QuestionRecord? getByQuestionHashSync(String questionHash) {
    return getByIndexSync(r'questionHash', [questionHash]);
  }

  Future<bool> deleteByQuestionHash(String questionHash) {
    return deleteByIndex(r'questionHash', [questionHash]);
  }

  bool deleteByQuestionHashSync(String questionHash) {
    return deleteByIndexSync(r'questionHash', [questionHash]);
  }

  Future<List<QuestionRecord?>> getAllByQuestionHash(
    List<String> questionHashValues,
  ) {
    final values = questionHashValues.map((e) => [e]).toList();
    return getAllByIndex(r'questionHash', values);
  }

  List<QuestionRecord?> getAllByQuestionHashSync(
    List<String> questionHashValues,
  ) {
    final values = questionHashValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'questionHash', values);
  }

  Future<int> deleteAllByQuestionHash(List<String> questionHashValues) {
    final values = questionHashValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'questionHash', values);
  }

  int deleteAllByQuestionHashSync(List<String> questionHashValues) {
    final values = questionHashValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'questionHash', values);
  }

  Future<Id> putByQuestionHash(QuestionRecord object) {
    return putByIndex(r'questionHash', object);
  }

  Id putByQuestionHashSync(QuestionRecord object, {bool saveLinks = true}) {
    return putByIndexSync(r'questionHash', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByQuestionHash(List<QuestionRecord> objects) {
    return putAllByIndex(r'questionHash', objects);
  }

  List<Id> putAllByQuestionHashSync(
    List<QuestionRecord> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'questionHash', objects, saveLinks: saveLinks);
  }
}

extension QuestionRecordQueryWhereSort
    on QueryBuilder<QuestionRecord, QuestionRecord, QWhere> {
  QueryBuilder<QuestionRecord, QuestionRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QuestionRecordQueryWhere
    on QueryBuilder<QuestionRecord, QuestionRecord, QWhereClause> {
  QueryBuilder<QuestionRecord, QuestionRecord, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterWhereClause> idBetween(
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterWhereClause>
  questionHashEqualTo(String questionHash) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'questionHash',
          value: [questionHash],
        ),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterWhereClause>
  questionHashNotEqualTo(String questionHash) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'questionHash',
                lower: [],
                upper: [questionHash],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'questionHash',
                lower: [questionHash],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'questionHash',
                lower: [questionHash],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'questionHash',
                lower: [],
                upper: [questionHash],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension QuestionRecordQueryFilter
    on QueryBuilder<QuestionRecord, QuestionRecord, QFilterCondition> {
  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  correctOptionIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'correctOptionIndex', value: value),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  correctOptionIndexGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'correctOptionIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  correctOptionIndexLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'correctOptionIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  correctOptionIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'correctOptionIndex',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  difficultyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'difficulty', value: ''),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  difficultyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'difficulty', value: ''),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  explanationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'explanation', value: ''),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  explanationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'explanation', value: ''),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  firstSeenAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'firstSeenAt', value: value),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  firstSeenAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'firstSeenAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  firstSeenAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'firstSeenAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  firstSeenAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'firstSeenAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition> idBetween(
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  optionsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'options', value: ''),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  optionsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'options', value: ''),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  optionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'options', length, true, length, true);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  optionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'options', 0, true, 0, true);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  optionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'options', 0, false, 999999, true);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  optionsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'options', 0, true, length, include);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  optionsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'options', length, include, 999999, true);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  questionHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'questionHash', value: ''),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  questionHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'questionHash', value: ''),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  questionTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'questionText', value: ''),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  questionTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'questionText', value: ''),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  sectionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'section', value: ''),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  sectionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'section', value: ''),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  timesAppearedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timesAppeared', value: value),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  timesAppearedGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timesAppeared',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  timesAppearedLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timesAppeared',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  timesAppearedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timesAppeared',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
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

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  topicIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'topic', value: ''),
      );
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterFilterCondition>
  topicIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'topic', value: ''),
      );
    });
  }
}

extension QuestionRecordQueryObject
    on QueryBuilder<QuestionRecord, QuestionRecord, QFilterCondition> {}

extension QuestionRecordQueryLinks
    on QueryBuilder<QuestionRecord, QuestionRecord, QFilterCondition> {}

extension QuestionRecordQuerySortBy
    on QueryBuilder<QuestionRecord, QuestionRecord, QSortBy> {
  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  sortByCorrectOptionIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctOptionIndex', Sort.asc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  sortByCorrectOptionIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctOptionIndex', Sort.desc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  sortByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.asc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  sortByDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.desc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  sortByExplanation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.asc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  sortByExplanationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.desc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  sortByFirstSeenAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstSeenAt', Sort.asc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  sortByFirstSeenAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstSeenAt', Sort.desc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  sortByQuestionHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionHash', Sort.asc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  sortByQuestionHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionHash', Sort.desc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  sortByQuestionText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.asc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  sortByQuestionTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.desc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy> sortBySection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.asc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  sortBySectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.desc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  sortByTimesAppeared() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesAppeared', Sort.asc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  sortByTimesAppearedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesAppeared', Sort.desc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy> sortByTopic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.asc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy> sortByTopicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.desc);
    });
  }
}

extension QuestionRecordQuerySortThenBy
    on QueryBuilder<QuestionRecord, QuestionRecord, QSortThenBy> {
  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  thenByCorrectOptionIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctOptionIndex', Sort.asc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  thenByCorrectOptionIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctOptionIndex', Sort.desc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  thenByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.asc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  thenByDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.desc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  thenByExplanation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.asc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  thenByExplanationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.desc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  thenByFirstSeenAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstSeenAt', Sort.asc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  thenByFirstSeenAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstSeenAt', Sort.desc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  thenByQuestionHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionHash', Sort.asc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  thenByQuestionHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionHash', Sort.desc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  thenByQuestionText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.asc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  thenByQuestionTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.desc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy> thenBySection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.asc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  thenBySectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.desc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  thenByTimesAppeared() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesAppeared', Sort.asc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy>
  thenByTimesAppearedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesAppeared', Sort.desc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy> thenByTopic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.asc);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QAfterSortBy> thenByTopicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topic', Sort.desc);
    });
  }
}

extension QuestionRecordQueryWhereDistinct
    on QueryBuilder<QuestionRecord, QuestionRecord, QDistinct> {
  QueryBuilder<QuestionRecord, QuestionRecord, QDistinct>
  distinctByCorrectOptionIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correctOptionIndex');
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QDistinct> distinctByDifficulty({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'difficulty', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QDistinct>
  distinctByExplanation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'explanation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QDistinct>
  distinctByFirstSeenAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstSeenAt');
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QDistinct> distinctByOptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'options');
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QDistinct>
  distinctByQuestionHash({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionHash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QDistinct>
  distinctByQuestionText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QDistinct> distinctBySection({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'section', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QDistinct>
  distinctByTimesAppeared() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timesAppeared');
    });
  }

  QueryBuilder<QuestionRecord, QuestionRecord, QDistinct> distinctByTopic({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'topic', caseSensitive: caseSensitive);
    });
  }
}

extension QuestionRecordQueryProperty
    on QueryBuilder<QuestionRecord, QuestionRecord, QQueryProperty> {
  QueryBuilder<QuestionRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuestionRecord, int, QQueryOperations>
  correctOptionIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctOptionIndex');
    });
  }

  QueryBuilder<QuestionRecord, String, QQueryOperations> difficultyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'difficulty');
    });
  }

  QueryBuilder<QuestionRecord, String, QQueryOperations> explanationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'explanation');
    });
  }

  QueryBuilder<QuestionRecord, DateTime, QQueryOperations>
  firstSeenAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstSeenAt');
    });
  }

  QueryBuilder<QuestionRecord, List<String>, QQueryOperations>
  optionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'options');
    });
  }

  QueryBuilder<QuestionRecord, String, QQueryOperations>
  questionHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionHash');
    });
  }

  QueryBuilder<QuestionRecord, String, QQueryOperations>
  questionTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionText');
    });
  }

  QueryBuilder<QuestionRecord, String, QQueryOperations> sectionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'section');
    });
  }

  QueryBuilder<QuestionRecord, int, QQueryOperations> timesAppearedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timesAppeared');
    });
  }

  QueryBuilder<QuestionRecord, String, QQueryOperations> topicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topic');
    });
  }
}
