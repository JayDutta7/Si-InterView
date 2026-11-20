import 'package:flutter_test/flutter_test.dart';
import 'package:mobileprep_ai/core/utils/hash_util.dart';

void main() {
  test('HashUtil deterministic SHA-256 and normalization test', () {
    const rawQuestion1 =
        '  In Flutter, what is the exact role of an Element in relation to Widgets and RenderObjects?  ';
    const rawQuestion2 =
        'in flutter what is the exact role of an element in relation to widgets and renderobjects';

    final hash1 = HashUtil.computeQuestionHash(rawQuestion1);
    final hash2 = HashUtil.computeQuestionHash(rawQuestion2);

    expect(hash1, equals(hash2));
    expect(hash1.length, equals(64)); // SHA-256 hex length
  });
}
