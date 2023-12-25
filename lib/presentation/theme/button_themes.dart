import 'package:flutter/material.dart';

import 'text_theme.dart';

final filledButtonTheme = FilledButtonThemeData(
  style: FilledButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    minimumSize: const Size.fromHeight(41),
    textStyle: textTheme.bodyMedium!.copyWith(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
);
