class QuestionEntity {
  final int? id;
  final String questionHash;
  final String section;
  final String topic;
  final String interviewStyle;
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;
  final String explanation;

  const QuestionEntity({
    this.id,
    required this.questionHash,
    required this.section,
    required this.topic,
    this.interviewStyle = 'Technical Conceptual',
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
    required this.explanation,
  });

  QuestionEntity copyWith({
    int? id,
    String? questionHash,
    String? section,
    String? topic,
    String? interviewStyle,
    String? questionText,
    List<String>? options,
    int? correctOptionIndex,
    String? explanation,
  }) {
    return QuestionEntity(
      id: id ?? this.id,
      questionHash: questionHash ?? this.questionHash,
      section: section ?? this.section,
      topic: topic ?? this.topic,
      interviewStyle: interviewStyle ?? this.interviewStyle,
      questionText: questionText ?? this.questionText,
      options: options ?? this.options,
      correctOptionIndex: correctOptionIndex ?? this.correctOptionIndex,
      explanation: explanation ?? this.explanation,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'section': section,
      'topic': topic,
      'interviewStyle': interviewStyle,
      'question': questionText,
      'options': options,
      'correctOptionIndex': correctOptionIndex,
      'explanation': explanation,
    };
  }

  factory QuestionEntity.fromJson(Map<String, dynamic> json, {String? hash}) {
    final opts = (json['options'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        [];
    return QuestionEntity(
      questionHash: hash ?? '',
      section: json['section'] as String? ?? 'General',
      topic: json['topic'] as String? ?? 'General',
      interviewStyle: json['interviewStyle'] as String? ?? 'Technical Conceptual',
      questionText: json['question'] as String? ?? json['questionText'] as String? ?? '',
      options: opts,
      correctOptionIndex: (json['correctOptionIndex'] as num?)?.toInt() ?? 0,
      explanation: json['explanation'] as String? ?? '',
    );
  }
}
