import 'package:skenteas/core/auth/data/models/user.dart';

abstract interface class AuthRepository {
  Future<(String, String)> signIn(String email, String password);
  Future<(String, String)> signUp(
    String email,
    String password,
    String username,
  );
  Future<User> fetchUser();
  Future<void> logout();
}
