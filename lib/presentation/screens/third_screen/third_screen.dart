import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/user_model.dart';
import '../../controller/user_list_controller/user_list_controller.dart';
import '../../controller/user_list_controller/user_list_state.dart';
import 'widgets/user_list_tile.dart';

class ThirdScreen extends ConsumerStatefulWidget {
  static const String route = '/third';

  const ThirdScreen({super.key});

  @override
  ConsumerState<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends ConsumerState<ThirdScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userListControllerProvider.notifier).fetchUsers();
    });

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final delta = MediaQuery.of(context).size.height * 0.2;

    if (maxScroll - currentScroll <= delta) {
      final state = ref.read(userListControllerProvider);

      /// Prevent automatic fetching users when the state is [FailedUserListState]
      if (state is! FailedUserListState) {
        ref.read(userListControllerProvider.notifier).fetchUsers();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userListState = ref.watch(userListControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(userListControllerProvider.notifier).fetchUsers(true),
        child: switch (userListState) {
          InitialUserListState(users: final users) ||
          LoadingUserListState(users: final users) =>
            users.isEmpty
                ? _buildLoading()
                : Center(
                    child: _buildList(
                      users,
                      _buildLoading(),
                    ),
                  ),
          LoadedUserListState(users: final users) => _buildList(users),
          FullyLoadedUserListState(users: final users) => _buildList(
              users,
              const Center(
                child: Text('Thats all!'),
              ),
            ),
          FailedUserListState(users: final users) => Center(
              child: _buildList(
                users,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Failed to load users'),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => ref
                          .read(userListControllerProvider.notifier)
                          .fetchUsers(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
        },
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _buildList(List<UserModel> users, [Widget? trailing]) {
    if (trailing != null) {
      trailing = Padding(
        padding: const EdgeInsets.all(18.0),
        child: trailing,
      );
    }

    if (users.isEmpty) {
      if (trailing != null) {
        return Center(child: trailing);
      }

      return const Padding(
        padding: EdgeInsets.all(18.0),
        child: Center(
          child: Text('No users'),
        ),
      );
    }

    return ListView.separated(
      key: const PageStorageKey('user_list'),
      controller: _scrollController,
      itemCount: users.length + (trailing != null ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == users.length) {
          return trailing;
        }

        final user = users[index];

        return UserListTile(
          user: user,
          onTap: () => Navigator.pop(context, user),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        height: 0,
        thickness: 0.5,
        indent: 18,
        endIndent: 18,
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }
}
