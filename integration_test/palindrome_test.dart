import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suitmedia_msib_test/app.dart';
import 'package:suitmedia_msib_test/presentation/widgets/dialogs/palindrome_result_dialog.dart';

void main() {
  testWidgets(
      'type word in palindrome text field, tap check button should show result',
      (tester) async {
    // Load app widget.
    await tester.pumpWidget(const ProviderScope(child: App()));

    final Finder palindromeTextField = find.byType(TextFormField).at(1);
    final Finder checkButton = find.byWidgetPredicate((widget) =>
        widget is FilledButton &&
        widget.child is Text &&
        (widget.child as Text).data == 'CHECK');

    // make sure the textfield exist
    expect(palindromeTextField, findsOneWidget);
    // make sure CHECK button exist
    expect(checkButton, findsOneWidget);

    // Type word in palindrome text field.
    await tester.enterText(palindromeTextField, 'katak');

    // Tap check button.
    await tester.tap(checkButton);

    // Rebuild the widget after the state has changed.
    await tester.pumpAndSettle();

    // a dialog should appear
    expect(find.byType(PalindromeResultDialog), findsOneWidget);
    expect(find.text('is a palindrome'), findsOneWidget);
  });
}
