import 'package:skenteas/feature/auth/data/datasource/auth_datasource.dart';
import 'package:skenteas/generated/auth/auth.pbgrpc.dart';

class ProdAuthDatasource implements AuthDatasource {
  final AuthRpcClient client;

  ProdAuthDatasource({required this.client});

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
}
