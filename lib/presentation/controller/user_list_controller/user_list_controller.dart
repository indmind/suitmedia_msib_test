import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/services.dart';
import '../../../application/user_service.dart';
import '../../../domain/models/user_model.dart';
import 'user_list_state.dart';

part 'user_list_controller.g.dart';

@Riverpod(keepAlive: true)
class UserListController extends _$UserListController {
  UserService get _service => ref.read(userServiceProvider);

  int _page = 1;

  @override
  UserListState build() {
    return InitialUserListState();
  }

  Future<void> fetchUsers([bool forceRefresh = false]) async {
    final currentState = state;

    if (currentState is LoadingUserListState ||
        (!forceRefresh && currentState is FullyLoadedUserListState)) {
      return;
    }

    if (forceRefresh) {
      _page = 1;
    }

    try {
      state = LoadingUserListState(
        users: currentState.users,
      );

      final (users, isLast) = await _service.getUsers(page: _page);

      final previousUsers = forceRefresh ? <UserModel>[] : currentState.users;

      if (isLast) {
        state = FullyLoadedUserListState(users: previousUsers + users);
      } else {
        state = LoadedUserListState(users: previousUsers + users);
      }

      _page++;
    } on Exception catch (exception, stackTrace) {
      state = FailedUserListState(
        users: currentState.users,
        error: (exception, stackTrace),
      );
    }
  }
}
