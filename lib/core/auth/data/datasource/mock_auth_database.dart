import 'package:logger/logger.dart';
import 'package:skenteas/core/auth/data/datasource/auth_datasource.dart';

class MockAuthDatabase implements AuthDatasource {
  String? token;

  @override
  Future<void> logout() async {
    await Future.delayed(Duration(seconds: 2));
    token = null;
    Logger().d("Unauthentication was successful");
  }

  @override
  Future<(String, String)> signIn(String email, String password) async {
    token = "token";
    await Future.delayed(Duration(seconds: 2));
    Logger().d("Authentication was successful");
    return (token!, token!);
  }

  @override
  Future<(String, String)> signUp(
    String email,
    String password,
    String username,
  ) async {
    if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
      token = "token";
      await Future.delayed(Duration(seconds: 2));
      Logger().d("Authentication was successful");
      return (token!, token!);
    } else {
      await Future.delayed(Duration(seconds: 2));
      Logger().d("All fields must be filled");
      return ("", "");
    }
  }

  @override
  Future<(String, String)> signInWithGoogle() async {
    await Future.delayed(Duration(seconds: 2));
    return ("", "");
  }
}
