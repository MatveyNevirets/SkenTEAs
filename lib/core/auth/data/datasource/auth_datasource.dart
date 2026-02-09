abstract interface class AuthDatasource {
  Future<(String, String)> signIn(String email, String password);
  Future<(String, String)> signUp(
    String email,
    String password,
    String username,
  );
  Future<(String, String)> signInWithGoogle();
  Future<void> logout();
}
