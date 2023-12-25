import '../../../domain/models/user_model.dart';

/// State of the [UserListController] with pagination.
sealed class UserListState {
  final List<UserModel> users;

  UserListState(this.users);
}

/// Initial state of the [UserListController].
///
/// This state will be used when the [UserListController] is initialized.
class InitialUserListState extends UserListState {
  InitialUserListState() : super([]);
}

/// State of the [UserListController] when the user list is loaded.
class LoadedUserListState extends UserListState {
  LoadedUserListState({required List<UserModel> users}) : super(users);
}

/// State of the [UserListController] when the user list is loading.
///
/// This state will be used when the [UserListController] is fetching the user list.
class LoadingUserListState extends UserListState {
  LoadingUserListState({
    required List<UserModel> users,
  }) : super(users);
}

/// State of the [UserListController] when the user list is fully loaded.
///
/// This state will be used when the [UserListController] is in the last page
class FullyLoadedUserListState extends UserListState {
  FullyLoadedUserListState({
    required List<UserModel> users,
  }) : super(users);
}

/// State of the [UserListController] when the user list is failed to load.
///
/// This state will be used when the [UserListController] is failed to fetch the user list.
class FailedUserListState extends UserListState {
  final (Exception, StackTrace) error;

  FailedUserListState({
    required List<UserModel> users,
    required this.error,
  }) : super(users);
}
