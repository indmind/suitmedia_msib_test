import 'package:flutter/material.dart';

import 'widgets/user_list_tile.dart';

class ThirdScreen extends StatelessWidget {
  static const String route = '/third';

  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 15,
        ),
        itemCount: 10,
        itemBuilder: (context, index) => const UserListTile(),
        separatorBuilder: (context, index) => const Divider(
          height: 31,
          thickness: 0.5,
        ),
      ),
    );
  }
}
