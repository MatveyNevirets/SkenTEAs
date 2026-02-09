abstract class Env {
  static const String serverHost = String.fromEnvironment('SERVER_HOST');
  static const int nginxPort = int.fromEnvironment('NGINX_PORT');
  static const String accessTokenKey = String.fromEnvironment(
    'ACCESS_TOKEN_KEY',
  );
  static const String refreshTokenKey = String.fromEnvironment(
    'REFRESH_TOKEN_KEY',
  );
  static const String firebaseClientId = String.fromEnvironment(
    'FIREBASE_CLIENT_ID',
  );
}
