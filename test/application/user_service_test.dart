import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:suitmedia_msib_test/application/user_service.dart';
import 'package:suitmedia_msib_test/data/entities/user_response_entity.dart';
import 'package:suitmedia_msib_test/data/repositories/user_repository.dart';
import 'package:suitmedia_msib_test/domain/models/user_model.dart';

@GenerateNiceMocks([MockSpec<UserRepository>()])
import 'user_service_test.mocks.dart';

void main() {
  late UserRepository userRepository;
  late UserService userService;

  setUp(() {
    userRepository = MockUserRepository();
    userService = UserService(userRepository);
  });

  test('should correctly get users', () async {
    when(userRepository.getUser(page: 1, perPage: 10)).thenAnswer(
      (_) async => UserResponseEntity(
        page: 1,
        perPage: 10,
        total: 12,
        totalPages: 2,
        data: [
          UserModel(
            id: 1,
            email: 'fake@mail.com',
            firstName: 'fake',
            lastName: 'fake',
            avatar: 'fake',
          ),
        ],
      ),
    );

    final users = await userService.getUsers();

    expect(users, isA<(List<UserModel>, bool)>());
    expect(users.$1, isNotEmpty);
    expect(users.$2, false);
    expect(users.$1.first, isA<UserModel>());
  });

  test('should correctly get users with pagination', () async {
    when(userRepository.getUser(page: 1, perPage: 10)).thenAnswer(
      (_) async => UserResponseEntity(
        page: 1,
        perPage: 10,
        total: 12,
        totalPages: 2,
        data: [
          UserModel(
            id: 1,
            email: 'fake@gmail.com',
            firstName: 'fake',
            lastName: 'fake',
            avatar: 'fake',
          ),
        ],
      ),
    );

    final users = await userService.getUsers(page: 1, perPage: 10);

    expect(users, isA<(List<UserModel>, bool)>());
    expect(users.$1, isNotEmpty);
    expect(users.$2, false);
    expect(users.$1.first, isA<UserModel>());
  });

  test('should correctly get users with pagination and last page', () async {
    when(userRepository.getUser(page: 2, perPage: 10)).thenAnswer(
      (_) async => UserResponseEntity(
        page: 2,
        perPage: 10,
        total: 12,
        totalPages: 2,
        data: [
          UserModel(
            id: 1,
            email: 'fake@gmail.com',
            firstName: 'fake',
            lastName: 'fake',
            avatar: 'fake',
          ),
        ],
      ),
    );

    final users = await userService.getUsers(page: 2, perPage: 10);

    expect(users, isA<(List<UserModel>, bool)>());
    expect(users.$1, isNotEmpty);
    expect(users.$2, true);
    expect(users.$1.first, isA<UserModel>());
  });
}
