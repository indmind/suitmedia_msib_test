import 'package:flutter/material.dart';

import '../../widgets/unfocus_scope.dart';
import '../second_screen/second_screen.dart';
import '../third_screen/third_screen.dart';

class FirstScreen extends StatelessWidget {
  static const String route = '/first';

  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UnfocusScope(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: const Border(),
        ),
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/avatar.png',
                    width: 116,
                    height: 116,
                  ),
                  const SizedBox(height: 58),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                  const SizedBox(height: 22),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Palindrome'),
                  ),
                  const SizedBox(height: 45),
                  FilledButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, SecondScreen.route),
                    child: const Text('CHECK'),
                  ),
                  const SizedBox(height: 15),
                  FilledButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, ThirdScreen.route),
                    child: const Text('NEXT'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
