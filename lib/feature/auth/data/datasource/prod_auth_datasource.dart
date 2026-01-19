import 'package:skenteas/feature/auth/data/datasource/auth_datasource.dart';

class MockAuthDatabaseProdAuthDatasource implements AuthDatasource {
  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
  
  @override
  Future<String?> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
  
  @override
  Future<String?> signUp(String email, String password, String username) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
