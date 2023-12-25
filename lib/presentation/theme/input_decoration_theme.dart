import 'package:flutter/material.dart';

import 'text_theme.dart';

final inputDecorationTheme = InputDecorationTheme(
  filled: true,
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide.none,
  ),
  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  hintStyle: textTheme.bodyLarge!.copyWith(
    color: const Color.fromRGBO(104, 103, 119, 0.36),
    fontWeight: FontWeight.w500,
  ),
  isDense: true,
);
