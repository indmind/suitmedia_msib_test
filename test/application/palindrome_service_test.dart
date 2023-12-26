import 'package:flutter_test/flutter_test.dart';
import 'package:suitmedia_msib_test/application/palindrome_service.dart';

void main() {
  late PalindromeService palindromeService;

  setUp(() {
    palindromeService = PalindromeService();
  });

  test('should correctly check a palindrome', () {
    final palindromes = [
      'katak',
      'kasur rusak',
      'Kodok kataK koDok',
      'ibu Ratna antar ubi',
    ];

    final results = palindromes.map((e) => palindromeService.isPalindrome(e));

    expect(results, everyElement(true));
  });

  test('should correctly check a non-palindrome', () {
    final nonPalindromes = [
      'kotak',
      'kursi',
      'meja',
      'buku',
    ];

    final results =
        nonPalindromes.map((e) => palindromeService.isPalindrome(e));

    expect(results, everyElement(false));
  });
}
