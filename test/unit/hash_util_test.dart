import 'package:flutter_test/flutter_test.dart';
import 'package:mobileprep_ai/core/utils/hash_util.dart';

void main() {
  group('HashUtil Normalization & Anti-Repeat Tests', () {
    test('normalizes punctuation, whitespace and casing accurately', () {
      const q1 = 'What is the role of an Element in Flutter?';
      const q2 = '  what is the role of an element in flutter   ';
      const q3 = 'what   is the role of an element in flutter!???';

      expect(HashUtil.normalizeQuestion(q1), equals('what is the role of an element in flutter'));
      expect(HashUtil.normalizeQuestion(q2), equals('what is the role of an element in flutter'));
      expect(HashUtil.normalizeQuestion(q3), equals('what is the role of an element in flutter'));
    });

    test('generates matching SHA-256 hash for identical normalized questions', () {
      const q1 = 'What is Dispatchers.Default vs Dispatchers.IO in Coroutines?';
      const q2 = 'what is dispatchersdefault vs dispatchersio in coroutines';

      final hash1 = HashUtil.computeQuestionHash(q1);
      final hash2 = HashUtil.computeQuestionHash(q2);

      expect(hash1, equals(hash2));
    });

    test('generates different hashes for semantically different questions', () {
      const q1 = 'What is a RepaintBoundary in Flutter?';
      const q2 = 'What is an InheritedWidget in Flutter?';

      final hash1 = HashUtil.computeQuestionHash(q1);
      final hash2 = HashUtil.computeQuestionHash(q2);

      expect(hash1, isNot(equals(hash2)));
    });
  });
}
