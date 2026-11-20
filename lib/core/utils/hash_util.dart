import 'dart:convert';
import 'package:crypto/crypto.dart';

class HashUtil {
  HashUtil._();

  /// Normalize question text by converting to lowercase, stripping punctuation,
  /// collapsing extra whitespaces, and trimming.
  static String normalizeQuestion(String text) {
    return text
        .toLowerCase()
        .replaceAll(RegExp(r'[^\w\s]'), '') // remove all punctuation
        .replaceAll(RegExp(r'\s+'), ' ') // collapse multi-spaces into single space
        .trim();
  }

  /// Compute deterministic SHA-256 hash of normalized question text
  static String computeQuestionHash(String text) {
    final normalized = normalizeQuestion(text);
    final bytes = utf8.encode(normalized);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
