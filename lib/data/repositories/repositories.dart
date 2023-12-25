import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../datasources/datasources.dart';
import 'user_repository.dart';

part 'repositories.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) =>
    UserRepository(ref.watch(userApiClientProvider));
