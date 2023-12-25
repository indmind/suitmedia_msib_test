import 'package:dio/dio.dart';

class UserApiClient with DioMixin implements Dio {
  UserApiClient() {
    options = BaseOptions(
      baseUrl: 'https://reqres.in/api/users',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 10),
    );

    httpClientAdapter = HttpClientAdapter();
  }
}
