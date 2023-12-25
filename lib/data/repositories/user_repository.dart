import '../datasources/user_api_client.dart';
import '../entities/user_response_entity.dart';

class UserRepository {
  final UserApiClient _client;

  UserRepository(this._client);

  Future<UserResponseEntity> getUser({
    int page = 1,
    int perPage = 10,
  }) async {
    final response = await _client.get(
      '?page=$page&per_page=$perPage',
    );

    return UserResponseEntity.fromJson(response.data);
  }
}
