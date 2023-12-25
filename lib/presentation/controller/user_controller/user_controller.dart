import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

/// Business logic for the user login feature.
@Riverpod(keepAlive: true)
class UserController extends _$UserController {
  @override
  String? build() => null;

  void login(String username) {
    state = username;
  }
}
