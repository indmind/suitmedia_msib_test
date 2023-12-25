import 'package:flutter/material.dart';

import 'app_bar_theme.dart';
import 'button_themes.dart';
import 'color_scheme.dart';
import 'input_decoration_theme.dart';
import 'text_theme.dart';

/// The light theme for the app.
///
/// This is the default theme for the app.
final lightAppTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: lightColorScheme,
  textTheme: textTheme,
  appBarTheme: appBarTheme,
  inputDecorationTheme: inputDecorationTheme,
  filledButtonTheme: filledButtonTheme,
);
