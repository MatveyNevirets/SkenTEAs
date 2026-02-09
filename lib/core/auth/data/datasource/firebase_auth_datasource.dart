import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skenteas/core/auth/data/datasource/auth_datasource.dart';
import 'package:skenteas/generated/auth/auth.pbgrpc.dart';

class FirebaseAuthDatasource implements AuthDatasource {
  final AuthRpcClient client;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseAuthDatasource({required this.client});

  @override
  Future<void> logout() async {}

  @override
  Future<(String, String)> signIn(String email, String password) async {
    try {
      final credentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await isEmailVerified(credentials.user);

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
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await credentials.user!.sendEmailVerification();

      await isEmailVerified(credentials.user);

      final token = await client.signUp(
        UserDto(email: email, password: password, username: username),
      );

      return (token.accessToken, token.refreshToken);
    } on Object catch (e, stack) {
      await _firebaseAuth.currentUser?.delete();
      throw Exception("$e StackTrace: $stack");
    }
  }

  Future<void> isEmailVerified(User? user) async {
    if (user == null) return;

    while (!user!.emailVerified) {
      await Future.delayed(Duration(seconds: 2));
      await user.reload();
      user = _firebaseAuth.currentUser;
    }
  }

  @override
  Future<(String, String)> signInWithGoogle() async {
    try {
      final googleSignIn = GetIt.instance<GoogleSignIn>();

      GoogleSignInAccount? googleAccount = await googleSignIn.authenticate();

      final auth = googleAccount.authentication;

      final credential = GoogleAuthProvider.credential(idToken: auth.idToken);

      await _firebaseAuth.signInWithCredential(credential);

      return ("", "");
    } on Object catch (e, stack) {
      throw Exception("$e StackTrace: $stack");
    }
  }
}
