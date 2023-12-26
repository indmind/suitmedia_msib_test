import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/repositories/repositories.dart';
import 'palindrome_service.dart';
import 'user_service.dart';

part 'services.g.dart';

@riverpod
PalindromeService palindromeService(PalindromeServiceRef ref) =>
    PalindromeService();

@riverpod
UserService userService(UserServiceRef ref) =>
    UserService(ref.watch(userRepositoryProvider));
