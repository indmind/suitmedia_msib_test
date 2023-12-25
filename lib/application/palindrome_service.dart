/// Service to check if a word is a palindrome.
///
/// A palindrome is a word, phrase, number, or other sequence of characters
/// which reads the same backward as forward, such as "katak" or "kasur rusak"
class PalindromeService {
  /// Check wether a word is a palindrome.
  ///
  /// This will check if a word is a palindrome by comparing the first and last
  /// character, the second and second last character and will stop when the
  /// characters doesn't match.
  bool isPalindrome(String word) {
    if (word.isEmpty) {
      return false;
    }

    // Convert the word to lowercase and remove all spaces
    word = word.toLowerCase().replaceAll(' ', '');

    // Check if the word is a palindrome
    for (int i = 0; i < word.length / 2; i++) {
      if (word[i] != word[word.length - i - 1]) {
        return false;
      }
    }

    return true;

    // another way to check if a word is a palindrome (inefficient)
    // return word == word.split('').reversed.join('');
  }
}
