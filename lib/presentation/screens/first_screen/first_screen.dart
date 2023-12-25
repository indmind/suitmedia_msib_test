import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/palindrome_controller/palindrome_controller.dart';
import '../../controller/palindrome_controller/palindrome_state.dart';
import '../../controller/user_controller/user_controller.dart';
import '../../widgets/dialogs/palindrome_result_dialog.dart';
import '../../widgets/unfocus_scope.dart';
import '../second_screen/second_screen.dart';

class FirstScreen extends ConsumerStatefulWidget {
  static const String route = '/first';

  const FirstScreen({super.key});

  @override
  ConsumerState<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends ConsumerState<FirstScreen> {
  final GlobalKey<FormState> _nameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _palindromeFormKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _palindromeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen<PalindromeState>(
      palindromeControllerProvider,
      (_, state) => PalindromeResultDialog.show(
        context,
        word: state.word!,
        isPalindrome: state is ValidPalindromeState,
      ),
    );

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
                  Form(
                    key: _nameFormKey,
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(hintText: 'Name'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 22),
                  Form(
                    key: _palindromeFormKey,
                    child: TextFormField(
                      controller: _palindromeController,
                      decoration: const InputDecoration(hintText: 'Palindrome'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a word';
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 45),
                  FilledButton(
                    onPressed: _checkForPalindrome,
                    child: const Text('CHECK'),
                  ),
                  const SizedBox(height: 15),
                  FilledButton(
                    onPressed: _login,
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

  void _checkForPalindrome() {
    if (!_palindromeFormKey.currentState!.validate()) {
      return;
    }

    ref
        .read(palindromeControllerProvider.notifier)
        .checkPalindrome(_palindromeController.text);
  }

  void _login() {
    if (!_nameFormKey.currentState!.validate()) {
      return;
    }

    ref.read(userControllerProvider.notifier).login(_nameController.text);

    Navigator.pushNamed(context, SecondScreen.route);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _palindromeController.dispose();

    super.dispose();
  }
}
