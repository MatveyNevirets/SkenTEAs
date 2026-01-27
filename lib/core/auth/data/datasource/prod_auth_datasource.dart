import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grpc/service_api.dart';
import 'package:skenteas/core/auth/data/datasource/auth_datasource.dart';
import 'package:skenteas/core/auth/data/models/user.dart';
import 'package:skenteas/core/key_value_storage/domain/repository/key_value_storage_repository.dart';
import 'package:skenteas/generated/auth/auth.pbgrpc.dart';

class ProdAuthDatasource implements AuthDatasource {
  final AuthRpcClient client;
  final KeyValueStorageRepository keyValueStorageRepository;

  ProdAuthDatasource({
    required this.client,
    required this.keyValueStorageRepository,
  });

  @override
  Future<void> logout() async {}

  @override
  Future<(String, String)> signIn(String email, String password) async {
    try {
      final token = await client.signIn(
        UserDto(email: email, password: password),
      );
      return (token.accessToken, token.refreshToken);
    } on Object catch (e, stack) {
      throw Exception("$e StackTrace: $stack");
    }
  }

  @override
  Future<(String, String)> signUp(
    String email,
    String password,
    String username,
  ) async {
    try {
      final token = await client.signUp(
        UserDto(email: email, password: password, username: username),
      );
      return (token.accessToken, token.refreshToken);
    } on Object catch (e, stack) {
      throw Exception("$e StackTrace: $stack");
    }
  }

  @override
  Future<User> fetchUser() async {
    final token = await keyValueStorageRepository.readString(
      dotenv.env['ACCESS_TOKEN_KEY']!,
    );

    final userDto = await client.fetchUser(
      RequestDto(),
      options: CallOptions(metadata: {"accessToken": token!}),
    );

    final user = User(id: int.parse(userDto.id), username: userDto.username);

    return user;
  }
}
