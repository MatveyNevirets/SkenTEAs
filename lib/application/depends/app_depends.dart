import 'package:skenteas/application/runner/app_env.dart';

typedef OnProgress = void Function(String dependName, int progress);
typedef OnError = void Function(Object? error, StackTrace stack);

class AppDepends {
  final AppEnv appEnv;

  AppDepends(this.appEnv);

  Future<void> initDepends({
    required OnProgress onProgress,
    required OnError onError,
  }) async {
    // TODO: Log messages
    // TODO: Initial dependency functions

    try {
      switch (appEnv) {
        case AppEnv.prod:
          // TODO: Will change to the logger package later
          print("The prod's dependecies variable has been loaded successfully");
        case AppEnv.test:
          // TODO: Will change to the logger package later
          print("The test's dependecies variable has been loaded successfully");
      }
      onProgress("Fake depend", 100);
    } on Object catch (e, stack) {
      onError(e, stack);
    }

    // TODO: Will change to the logger package later
    print("All dependecies has been loaded successfully");
  }
}
