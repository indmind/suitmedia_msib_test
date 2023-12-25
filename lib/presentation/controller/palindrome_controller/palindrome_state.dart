/// Represents the state of the palindrome controller.
///
/// This class has 3 states:
/// - [InitialPalindromeState] when the app is first opened.
/// - [ValidPalindromeState] when the word is a palindrome.
/// - [InvalidPalindromeState] when the word is not a palindrome.
sealed class PalindromeState {
  String? word;

  PalindromeState({this.word});
}

class InitialPalindromeState extends PalindromeState {
  InitialPalindromeState() : super(word: null);
}

class ValidPalindromeState extends PalindromeState {
  ValidPalindromeState({required String word}) : super(word: word);
}

class InvalidPalindromeState extends PalindromeState {
  InvalidPalindromeState({required String word}) : super(word: word);
}
