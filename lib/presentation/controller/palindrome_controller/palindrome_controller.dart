import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/palindrome_service.dart';
import '../../../application/services.dart';
import 'palindrome_state.dart';

part 'palindrome_controller.g.dart';

/// Business logic for the palindrome feature.
@riverpod
class PalindromeController extends _$PalindromeController {
  PalindromeService get _service => ref.read(palindromeServiceProvider);

  @override
  PalindromeState build() => InitialPalindromeState();

  void checkPalindrome(String word) {
    if (_service.isPalindrome(word)) {
      state = ValidPalindromeState(word: word);
    } else {
      state = InvalidPalindromeState(word: word);
    }
  }
}
