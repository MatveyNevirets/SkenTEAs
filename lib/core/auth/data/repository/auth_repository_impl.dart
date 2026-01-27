import 'package:skenteas/core/auth/data/datasource/auth_datasource.dart';
import 'package:skenteas/core/auth/data/models/user.dart';
import 'package:skenteas/core/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _authDatasource;

  AuthRepositoryImpl({required AuthDatasource authDatasource})
    : _authDatasource = authDatasource;

  @override
  Future<void> logout() async {
    try {
      await _authDatasource.logout();
    } on Object catch (e, stack) {
      throw Exception("$e StackTrace: $stack");
    }
  }

  @override
  Future<(String, String)> signIn(String email, String password) async {
    try {
      final tokens = await _authDatasource.signIn(email, password);
      return (tokens.$1, tokens.$2);
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
      final tokens = await _authDatasource.signUp(email, password, username);
      return (tokens.$1, tokens.$2);
    } on Object catch (e, stack) {
      throw Exception("$e StackTrace: $stack");
    }
  }

  @override
  Future<User> fetchUser() async {
    try {
      return await _authDatasource.fetchUser();
    } on Object catch (e, stack) {
      throw Exception("$e StackTrace: $stack");
    }
  }
}
