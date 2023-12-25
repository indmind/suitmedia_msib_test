import '../data/repositories/user_repository.dart';
import '../domain/models/user_model.dart';

class UserService {
  final UserRepository _repository;

  UserService(this._repository);

  Future<(List<UserModel> users, bool isLast)> getUsers({
    int page = 1,
    int perPage = 10,
  }) async {
    final response = await _repository.getUser(
      page: page,
      perPage: perPage,
    );

    final isLast = page == response.totalPages;

    return (response.data ?? [], isLast);
  }
}
