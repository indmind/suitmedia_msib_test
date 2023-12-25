import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user_api_client.dart';

part 'datasources.g.dart';

@riverpod
UserApiClient userApiClient(UserApiClientRef ref) => UserApiClient();
