import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  static const String route = '/third';

  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/first');
          },
          child: const Text('Go to First Screen'),
        ),
      ),
    );
  }
}
