abstract interface class AuthRepository {
  Future<String?> signIn(String email, String password);
  Future<String?> signUp(String email, String password, String username);
  Future<void> logout();
}
