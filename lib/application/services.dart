import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'palindrome_service.dart';

part 'services.g.dart';

/// Provider for the [PalindromeService].
@riverpod
PalindromeService palindromeService(PalindromeServiceRef ref) {
  return PalindromeService();
}
