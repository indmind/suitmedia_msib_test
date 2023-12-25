import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  static const String route = '/second';

  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/third');
          },
          child: const Text('Go to Third Screen'),
        ),
      ),
    );
  }
}
