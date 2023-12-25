import 'package:flutter/material.dart';

import '../third_screen/third_screen.dart';

class SecondScreen extends StatelessWidget {
  static const String route = '/second';

  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 21.0,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome',
              style: textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            Text(
              'John Doe',
              style: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                height: 0.75,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Selected User Name',
                  style: textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            FilledButton(
              onPressed: () => Navigator.pushNamed(context, ThirdScreen.route),
              child: const Text('Choose a User'),
            ),
          ],
        ),
      ),
    );
  }
}
