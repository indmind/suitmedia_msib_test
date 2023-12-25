import 'package:flutter/material.dart';

import 'color_scheme.dart';
import 'text_theme.dart';

final appBarTheme = AppBarTheme(
  elevation: 0,
  shape: const Border(
    bottom: BorderSide(
      color: Color(0xFFE2E3E4),
      width: 0.5,
    ),
  ),
  centerTitle: true,
  titleTextStyle: textTheme.headlineMedium!.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  ),
  iconTheme: IconThemeData(
    color: lightColorScheme.tertiary,
  ),
);
