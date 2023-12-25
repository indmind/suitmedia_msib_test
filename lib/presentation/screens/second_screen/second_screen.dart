import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/user_model.dart';
import '../../controller/user_controller/user_controller.dart';
import '../third_screen/third_screen.dart';

class SecondScreen extends StatefulWidget {
  static const String route = '/second';

  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  UserModel? _selectedUser;

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
            Consumer(
              builder: (context, ref, _) => Text(
                ref.watch(userControllerProvider) ?? 'Anonymous',
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  height: 0.75,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  _selectedUser == null
                      ? 'No user selected'
                      : '${_selectedUser?.firstName ?? '-'} ${_selectedUser?.lastName ?? '-'}',
                  style: textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            FilledButton(
              onPressed: () async {
                final user = await Navigator.pushNamed(
                  context,
                  ThirdScreen.route,
                ) as UserModel?;

                if (user != null) {
                  setState(() {
                    _selectedUser = user;
                  });
                }
              },
              child: const Text('Choose a User'),
            ),
          ],
        ),
      ),
    );
  }
}
