import 'package:flutter/material.dart';

/// Unfocuses the current focus scope when the user taps outside of it.
///
/// This is useful for dismissing the keyboard when the user taps outside of a
/// text field.
///
/// Reference: https://stackoverflow.com/a/73633201
class UnfocusScope extends StatelessWidget {
  final Widget child;

  const UnfocusScope({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerDown: (_) {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        } else {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
