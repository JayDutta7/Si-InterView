import 'dart:convert';

enum LiveBotState {
  connecting,
  listening,
  evaluatingAnswer,
  botSpeaking,
  idle,
  sessionEnded,
}

enum AnswerVerdict {
  right,
  partiallyCorrect,
  wrong,
  pending,
}

class InterviewEvaluation {
  final AnswerVerdict verdict;
  final String feedback;
  final String nextQuestion;
  final double score; // 0 to 10

  const InterviewEvaluation({
    required this.verdict,
    required this.feedback,
    required this.nextQuestion,
    required this.score,
  });

  Map<String, dynamic> toJson() => {
        'verdict': verdict.name,
        'feedback': feedback,
        'nextQuestion': nextQuestion,
        'score': score,
      };

  factory InterviewEvaluation.fromJson(Map<String, dynamic> json) {
    AnswerVerdict v = AnswerVerdict.partiallyCorrect;
    final rawV = (json['verdict'] as String? ?? '').toLowerCase();
    if (rawV.contains('right') || rawV.contains('correct') && !rawV.contains('partially')) {
      v = AnswerVerdict.right;
    } else if (rawV.contains('wrong') || rawV.contains('incorrect')) {
      v = AnswerVerdict.wrong;
    }

    return InterviewEvaluation(
      verdict: v,
      feedback: json['feedback'] as String? ?? 'Good attempt.',
      nextQuestion: json['nextQuestion'] as String? ?? json['followUpQuestion'] as String? ?? '',
      score: (json['score'] as num?)?.toDouble() ?? 7.0,
    );
  }
}

class InterviewExchange {
  final int turnIndex;
  final String question;
  final String candidateAnswer;
  final AnswerVerdict verdict;
  final String feedback;
  final double score;
  final DateTime timestamp;

  const InterviewExchange({
    required this.turnIndex,
    required this.question,
    required this.candidateAnswer,
    required this.verdict,
    required this.feedback,
    required this.score,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'turnIndex': turnIndex,
        'question': question,
        'candidateAnswer': candidateAnswer,
        'verdict': verdict.name,
        'feedback': feedback,
        'score': score,
        'timestamp': timestamp.toIso8601String(),
      };

  factory InterviewExchange.fromJson(Map<String, dynamic> json) {
    AnswerVerdict v = AnswerVerdict.partiallyCorrect;
    final rawV = json['verdict'] as String? ?? '';
    for (final val in AnswerVerdict.values) {
      if (val.name == rawV) {
        v = val;
        break;
      }
    }

    return InterviewExchange(
      turnIndex: json['turnIndex'] as int? ?? 0,
      question: json['question'] as String? ?? '',
      candidateAnswer: json['candidateAnswer'] as String? ?? '',
      verdict: v,
      feedback: json['feedback'] as String? ?? '',
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
      timestamp: DateTime.tryParse(json['timestamp'] as String? ?? '') ?? DateTime.now(),
    );
  }

  String serialize() => jsonEncode(toJson());
  static InterviewExchange deserialize(String jsonStr) =>
      InterviewExchange.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);
}
