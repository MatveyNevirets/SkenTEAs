import 'package:skenteas/core/consts/error_messages.dart';
import 'package:skenteas/feature/auth/data/datasource/auth_datasource.dart';
import 'package:skenteas/generated/auth/auth.pbgrpc.dart';

class ProdAuthDatasource implements AuthDatasource {
  final AuthRpcClient client;

  ProdAuthDatasource({required this.client});

  @override
  Future<void> logout() async {}

  @override
  Future<String?> signIn(String email, String password) async {
    final token = await client.signIn(
      UserDto(email: email, password: password),
    );
    return AppMessages.signInSuccessful;
  }

  @override
  Future<String?> signUp(String email, String password, String username) async {
    final token = await client.signUp(
      UserDto(email: email, password: password, username: username),
    );
    return AppMessages.signUpSuccessful;
  }
}
