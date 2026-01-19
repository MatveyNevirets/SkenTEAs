import 'package:logger/logger.dart';
import 'package:skenteas/feature/auth/data/datasource/auth_datasource.dart';

class MockAuthDatabase implements AuthDatasource {
  String? token;

  @override
  Future<void> logout() async {
    await Future.delayed(Duration(seconds: 2));
    token = null;
    Logger().d("Unauthentication was successful");
  }

  @override
  Future<String?> signIn(String email, String password) async {
    token = "token";
    await Future.delayed(Duration(seconds: 2));
    Logger().d("Authentication was successful");
    return token;
  }

  @override
  Future<String?> signUp(String email, String password, String username) async {
    if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
      token = "token";
      await Future.delayed(Duration(seconds: 2));
      Logger().d("Authentication was successful");
      return token;
    } else {
      await Future.delayed(Duration(seconds: 2));
      Logger().d("All fields must be filled");
      return null;
    }
  }
}
