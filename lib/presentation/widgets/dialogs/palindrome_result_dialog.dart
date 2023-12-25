import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// A dialog that shows the result of a palindrome check.
///
/// The dialog animates the word being checked, and then shows the result.
class PalindromeResultDialog extends StatelessWidget {
  final String word;
  final bool isPalindrome;

  const PalindromeResultDialog({
    super.key,
    required this.word,
    required this.isPalindrome,
  });

  static Future<void> show(
    BuildContext context, {
    required String? word,
    required bool isPalindrome,
  }) async {
    if (word == null || word.isEmpty) {
      return;
    }

    await showDialog(
      context: context,
      builder: (_) => PalindromeResultDialog(
        word: word,
        isPalindrome: isPalindrome,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final textWidget = Text(
      word.toLowerCase().replaceAll(' ', ''),
      style: textTheme.headlineLarge,
      textAlign: TextAlign.center,
    );

    final reversedTextWidget = Text(
      word.split('').reversed.join('').toLowerCase().replaceAll(' ', ''),
      style: textTheme.headlineLarge,
      textAlign: TextAlign.center,
    );

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Opacity(
            opacity: 0,
            child: textWidget,
          ),
          textWidget.animate(delay: 4.5.seconds).fadeOut(),
          textWidget
              .animate(delay: 0.5.seconds)
              .slideY(begin: -1, duration: 0.5.seconds, curve: Curves.bounceOut)
              .then(delay: 0.5.seconds)
              .flipH(end: 1, duration: 1.seconds, curve: Curves.easeInOut)
              .then()
              .crossfade(
                duration: 0.25.seconds,
                builder: (context) => reversedTextWidget,
              )
              .then(delay: 0.5.seconds, duration: 0.5.seconds)
              .slideY(end: -1, curve: Curves.easeOut)
              .then()
              .tint(
                color: isPalindrome ? Colors.green : Colors.red,
                end: 1,
              )
              .then(delay: 0.5.seconds)
              .scaleXY(
                end: 1.1,
                duration: 0.5.seconds,
                curve: Curves.easeOut,
                alignment: Alignment.topCenter,
              )
              .moveY(
                end: 10,
                duration: 0.5.seconds,
                curve: Curves.easeOut,
              ),
          Text(
            isPalindrome ? 'is a palindrome' : 'is not a palindrome',
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ).animate(delay: 4.5.seconds).fadeIn(),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
