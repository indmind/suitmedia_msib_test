import 'package:flutter/material.dart';

import 'presentation/screens/first_screen/first_screen.dart';
import 'presentation/screens/second_screen/second_screen.dart';
import 'presentation/screens/third_screen/third_screen.dart';
import 'presentation/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightAppTheme,
      initialRoute: FirstScreen.route,
      routes: {
        FirstScreen.route: (_) => const FirstScreen(),
        SecondScreen.route: (_) => const SecondScreen(),
        ThirdScreen.route: (_) => const ThirdScreen(),
      },
    );
  }
}
