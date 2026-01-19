import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:skenteas/application/application.dart';
import 'package:skenteas/application/depends/app_depends.dart';
import 'package:skenteas/application/runner/app_env.dart';

class AppRunner {
  final AppEnv appEnv;

  AppRunner(this.appEnv);

  Future<void> run() async {
    runZonedGuarded(
      () async {
        _initApp();

        final appDepends = AppDepends(appEnv);
        await appDepends.initDepends(
          onProgress: (name, progress) {
            Logger().i(
              "$name depend has been completed successfully; Progress: $progress% is completed",
            );
          },
          onError: (e, stack) {
            throw Exception("Application exception: $e StackTrace: $stack");
          },
        );

        Logger().d("All dependecies has been loaded successfully");

        runApp(const Application());

        WidgetsBinding.instance.allowFirstFrame();
      },
      (e, stack) {
        throw Exception("AppRunner exception: $e StackTrace: $stack");
      },
    );
  }

  Future<void> _initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.deferFirstFrame();
  }
}
