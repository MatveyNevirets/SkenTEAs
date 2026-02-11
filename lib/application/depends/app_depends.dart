import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skenteas/application/env.dart';
import 'package:skenteas/application/runner/app_env.dart';
import 'package:skenteas/core/files/data/datasource/grpc_files_datasource.dart';
import 'package:skenteas/core/files/data/datasource/i_files_datasource.dart';
import 'package:skenteas/core/files/data/datasource/mock_files_datasource.dart';
import 'package:skenteas/core/files/data/repository/i_files_repository_impl.dart';
import 'package:skenteas/core/files/domain/repository/i_files_repository.dart';
import 'package:skenteas/core/key_value_storage/data/datasource/key_value_datasource.dart';
import 'package:skenteas/core/key_value_storage/data/datasource/shared_preferences_key_value_datasource.dart';
import 'package:skenteas/core/key_value_storage/data/repository/key_value_storage_repository_impl.dart';
import 'package:skenteas/core/key_value_storage/domain/repository/key_value_storage_repository.dart';
import 'package:skenteas/core/pick_image/data/image_picker_service.dart';
import 'package:skenteas/core/pick_image/domain/i_pick_image_service.dart';
import 'package:skenteas/core/posts/data/datasource/mock_post_datasource.dart';
import 'package:skenteas/core/posts/data/datasource/post_datasource.dart';
import 'package:skenteas/core/posts/data/datasource/prod_posts_datasource.dart';
import 'package:skenteas/core/posts/data/repository/post_repository_impl.dart';
import 'package:skenteas/core/posts/domain/repository/post_repository.dart';
import 'package:skenteas/core/auth/data/datasource/auth_datasource.dart';
import 'package:skenteas/core/auth/data/datasource/mock_auth_database.dart';
import 'package:skenteas/core/auth/data/datasource/firebase_auth_datasource.dart';
import 'package:skenteas/core/auth/data/repository/auth_repository_impl.dart';
import 'package:skenteas/core/auth/domain/repository/auth_repository.dart';
import 'package:skenteas/firebase_options.dart';
import 'package:skenteas/generated/auth/auth.pbgrpc.dart';
import 'package:skenteas/generated/files/files.pbgrpc.dart';
import 'package:skenteas/generated/posts/posts.pbgrpc.dart';

typedef OnProgress = void Function(String dependName, int progress);
typedef OnError = void Function(Object? error, StackTrace stack);

enum DependsEnum {
  firebaseInit,
  keyValueDatasource,
  keyValueRepository,
  googleSignIn,
  authRpcClient,
  postsRpcClient,
  filesRpcClient,
  authDatasource,
  authRepository,
  postsDatasource,
  postsRepository,
  filesDatasource,
  filesReposirory,
  imagePicker,
  pickImageService,
}

class AppDepends {
  final AppEnv appEnv;
  final getIt = GetIt.I;

  final channel = GrpcOrGrpcWebClientChannel.toSingleEndpoint(
    host: Env.serverHost,
    port: Env.nginxPort,
    transportSecure: false,
  );

  // Develop enviroment
  bool useEmulator = false;

  AppDepends(this.appEnv);

  Future<void> initDepends({
    required OnProgress onProgress,
    required OnError onError,
  }) async {
    /// ---
    ///  Fireabase initializing
    /// ---
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      if (useEmulator) {
        await FirebaseAuth.instance.useAuthEmulator("10.0.2.2", 9099);
      }
      onProgress(
        DependsEnum.firebaseInit.toString(),
        countProgress(
          DependsEnum.firebaseInit.index,
          DependsEnum.values.length,
        ),
      );
    } on Object catch (e, stack) {
      onError(e, stack);
      throw Exception("$e StackTrace: $stack");
    }

    /// ---
    ///  Setups the KeyValueDatasource depend
    /// ---
    try {
      getIt.registerSingleton<KeyValueDatasource>(
        SharedPreferencesKeyValueDatasource(),
      );
      onProgress(
        DependsEnum.keyValueDatasource.toString(),
        countProgress(
          DependsEnum.keyValueDatasource.index,
          DependsEnum.values.length,
        ),
      );
    } on Object catch (e, stack) {
      onError(e, stack);
    }

    /// ---
    ///  Setups the KeyValueRepository depend
    /// ---
    try {
      getIt.registerSingleton<KeyValueStorageRepository>(
        KeyValueStorageRepositoryImpl(
          keyValueDatasource: getIt<KeyValueDatasource>(),
        ),
      );
      onProgress(
        DependsEnum.keyValueRepository.toString(),
        countProgress(
          DependsEnum.keyValueRepository.index,
          DependsEnum.values.length,
        ),
      );
    } on Object catch (e, stack) {
      onError(e, stack);
    }

    /// ---
    /// ImagePicker
    /// ---

    try {
      getIt.registerSingleton<ImagePicker>(ImagePicker());
      onProgress(
        DependsEnum.imagePicker.name,
        countProgress(DependsEnum.imagePicker.index, DependsEnum.values.length),
      );
    } on Object catch (e, stack) {
      onError(e, stack);
    }

    /// ---
    /// PickImage service
    /// ---

    try {
      getIt.registerSingleton<IPickImageService>(
        ImagePickerService(imagePicker: getIt<ImagePicker>()),
      );
      onProgress(
        DependsEnum.pickImageService.name,
        countProgress(
          DependsEnum.pickImageService.index,
          DependsEnum.values.length,
        ),
      );
    } on Object catch (e, stack) {
      onError(e, stack);
    }

    /// ---
    ///   Setups the GoogleSignIn depend
    /// ---

    try {
      GoogleSignIn googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize(clientId: Env.firebaseClientId);

      getIt.registerSingleton<GoogleSignIn>(googleSignIn);
    } on Object catch (e, stack) {
      throw Exception("$e StackTrace: $stack");
    }

    /// ---
    ///  Setups the AuthRpcClient depend
    /// ---
    try {
      getIt.registerSingleton<AuthRpcClient>(AuthRpcClient(channel));
      onProgress(
        DependsEnum.authRpcClient.name,
        countProgress(
          DependsEnum.authRpcClient.index,
          DependsEnum.values.length,
        ),
      );
    } catch (e, stack) {
      onError(e, stack);
    }

    /// ---
    ///  Setups the PostsRpcClient depend
    /// ---
    try {
      getIt.registerSingleton<PostsRpcClient>(PostsRpcClient(channel));
      onProgress(
        DependsEnum.postsRpcClient.name,
        countProgress(
          DependsEnum.postsRpcClient.index,
          DependsEnum.values.length,
        ),
      );
    } catch (e, stack) {
      onError(e, stack);
    }

    /// ---
    ///  Setups the FilesRpcClient depend
    /// ---
    try {
      getIt.registerSingleton<FilesRpcClient>(FilesRpcClient(channel));
      onProgress(
        DependsEnum.filesRpcClient.name,
        countProgress(
          DependsEnum.filesRpcClient.index,
          DependsEnum.values.length,
        ),
      );
    } catch (e, stack) {
      onError(e, stack);
    }

    /// ---
    ///  Setups the AuthDatasource depend
    /// ---
    try {
      late final AuthDatasource authDatasource;
      switch (appEnv) {
        case AppEnv.prod:
          authDatasource = FirebaseAuthDatasource(
            iPickImageService: getIt<IPickImageService>(),
            client: getIt<AuthRpcClient>(),
            keyValueStorageRepository: getIt<KeyValueStorageRepository>(),
          );
        case AppEnv.test:
          authDatasource = MockAuthDatabase();
      }
      getIt.registerSingleton<AuthDatasource>(authDatasource);
      onProgress(
        DependsEnum.authDatasource.toString(),
        countProgress(
          DependsEnum.authDatasource.index,
          DependsEnum.values.length,
        ),
      );
    } on Object catch (e, stack) {
      onError(e, stack);
    }

    /// ---
    ///  Setups the AuthRepository depend
    /// ---

    try {
      getIt.registerSingleton<AuthRepository>(
        AuthRepositoryImpl(authDatasource: getIt<AuthDatasource>()),
      );

      onProgress(
        DependsEnum.authDatasource.toString(),
        countProgress(
          DependsEnum.authRepository.index,
          DependsEnum.values.length,
        ),
      );
    } on Object catch (e, stack) {
      onError(e, stack);
    }

    /// ---
    ///  Setups the PostsDatasource depend
    /// ---

    try {
      final postsDatasource = switch (appEnv) {
        AppEnv.test => MockPostsDatasource(),
        AppEnv.prod => ProdPostsDatasource(
          postsRpcClient: getIt<PostsRpcClient>(),
          keyValueStorageRepository: getIt<KeyValueStorageRepository>(),
        ),
      };
      getIt.registerSingleton<PostsDatasource>(postsDatasource);
      onProgress(
        DependsEnum.postsDatasource.toString(),
        countProgress(
          DependsEnum.postsDatasource.index,
          DependsEnum.values.length,
        ),
      );
    } on Object catch (e, stack) {
      onError(e, stack);
    }

    /// ---
    ///  Setups the PostsDatasource depend
    /// ---

    try {
      getIt.registerSingleton<PostsRepository>(
        PostsRepositoryImpl(postDatasource: getIt<PostsDatasource>()),
      );
      onProgress(
        DependsEnum.postsRepository.toString(),
        countProgress(
          DependsEnum.postsRepository.index,
          DependsEnum.values.length,
        ),
      );
    } on Object catch (e, stack) {
      onError(e, stack);
    }

    //

    /// ---
    ///  Setups the FilesDatasource depend
    /// ---

    try {
      final filesDatasource = switch (appEnv) {
        AppEnv.test => MockFilesDatasource(),
        AppEnv.prod => GrpcFilesDatasource(
          keyValueStorageRepository: getIt<KeyValueStorageRepository>(),
          filesRpcClient: getIt<FilesRpcClient>(),
        ),
      };
      getIt.registerSingleton<IFilesDatasource>(filesDatasource);
      onProgress(
        DependsEnum.filesDatasource.toString(),
        countProgress(
          DependsEnum.filesDatasource.index,
          DependsEnum.values.length,
        ),
      );
    } on Object catch (e, stack) {
      onError(e, stack);
    }

    /// ---
    ///  Setups the FilesRepository depend
    /// ---

    try {
      getIt.registerSingleton<IFilesRepository>(
        IFilesRepositoryImpl(filesDatasource: getIt<IFilesDatasource>()),
      );
      onProgress(
        DependsEnum.filesReposirory.toString(),
        countProgress(
          DependsEnum.filesReposirory.index,
          DependsEnum.values.length,
        ),
      );
    } on Object catch (e, stack) {
      onError(e, stack);
    }
  }
}

int countProgress(int currentValue, int length) {
  return (((currentValue + 1) * 100) / length).toInt();
}
