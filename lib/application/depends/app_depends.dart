import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:skenteas/application/runner/app_env.dart';
import 'package:skenteas/core/key_value_storage/data/datasource/key_value_datasource.dart';
import 'package:skenteas/core/key_value_storage/data/datasource/shared_preferences_key_value_datasource.dart';
import 'package:skenteas/core/key_value_storage/data/repository/key_value_storage_repository_impl.dart';
import 'package:skenteas/core/key_value_storage/domain/repository/key_value_storage_repository.dart';
import 'package:skenteas/core/posts/data/datasource/mock_post_datasource.dart';
import 'package:skenteas/core/posts/data/datasource/post_datasource.dart';
import 'package:skenteas/core/posts/data/datasource/prod_posts_datasource.dart';
import 'package:skenteas/core/posts/data/repository/post_repository_impl.dart';
import 'package:skenteas/core/posts/domain/repository/post_repository.dart';
import 'package:skenteas/core/auth/data/datasource/auth_datasource.dart';
import 'package:skenteas/core/auth/data/datasource/mock_auth_database.dart';
import 'package:skenteas/core/auth/data/datasource/prod_auth_datasource.dart';
import 'package:skenteas/core/auth/data/repository/auth_repository_impl.dart';
import 'package:skenteas/core/auth/domain/repository/auth_repository.dart';
import 'package:skenteas/generated/auth/auth.pbgrpc.dart';
import 'package:skenteas/generated/posts/posts.pbgrpc.dart';

typedef OnProgress = void Function(String dependName, int progress);
typedef OnError = void Function(Object? error, StackTrace stack);

enum DependsEnum {
  envFile,
  keyValueDatasource,
  keyValueRepository,
  authRpcClient,
  postsRpcClient,
  authDatasource,
  authRepository,
  postsDatasource,
  postsRepository,
}

class AppDepends {
  final AppEnv appEnv;
  late final KeyValueDatasource keyValueDatasource;
  late final KeyValueStorageRepository keyValueStorageRepository;
  late final AuthRpcClient authRpcClient;
  late final PostsRpcClient postsRpcClient;
  late final AuthDatasource authDatasource;
  late final AuthRepository authRepository;
  late final PostsDatasource postsDatasource;
  late final PostsRepository postsRepository;
  final getIt = GetIt.I;

  AppDepends(this.appEnv);

  Future<void> initDepends({
    required OnProgress onProgress,
    required OnError onError,
  }) async {
    /// ---
    ///  Setups the .env depend
    /// ---
    try {
      await dotenv.load(fileName: ".env");
      onProgress(
        DependsEnum.envFile.toString(),
        countProgress(DependsEnum.envFile.index, DependsEnum.values.length),
      );
    } on Object catch (e, stack) {
      onError(e, stack);
    }

    /// ---
    ///  Setups the KeyValueDatasource depend
    /// ---
    try {
      keyValueDatasource = SharedPreferencesKeyValueDatasource();
      getIt.registerSingleton<KeyValueDatasource>(keyValueDatasource);
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
      keyValueStorageRepository = KeyValueStorageRepositoryImpl(
        keyValueDatasource: getIt<KeyValueDatasource>(),
      );
      getIt.registerSingleton<KeyValueStorageRepository>(
        keyValueStorageRepository,
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
    ///  Setups the AuthRpcClient depend
    /// ---
    try {
      final channel = GrpcOrGrpcWebClientChannel.toSingleEndpoint(
        host: dotenv.env['SERVICES_HOST']!,
        port: int.parse(dotenv.env['NGINX_PORT']!),
        transportSecure: false,
      );

      authRpcClient = AuthRpcClient(channel);
      getIt.registerSingleton<AuthRpcClient>(authRpcClient);
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
      final channel = GrpcOrGrpcWebClientChannel.toSingleEndpoint(
        host: dotenv.env['SERVICES_HOST']!,
        port: int.parse(dotenv.env['NGINX_PORT']!),
        transportSecure: false,
      );

      postsRpcClient = PostsRpcClient(channel);
      getIt.registerSingleton<PostsRpcClient>(postsRpcClient);
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
    ///  Setups the AuthDatasource depend
    /// ---
    try {
      switch (appEnv) {
        case AppEnv.prod:
          authDatasource = ProdAuthDatasource(client: getIt<AuthRpcClient>());
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
      authRepository = AuthRepositoryImpl(
        authDatasource: getIt<AuthDatasource>(),
      );
      getIt.registerSingleton<AuthRepository>(authRepository);

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
      postsDatasource = switch (appEnv) {
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
      postsRepository = PostsRepositoryImpl(
        postDatasource: getIt<PostsDatasource>(),
      );

      getIt.registerSingleton<PostsRepository>(postsRepository);
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
  }
}

int countProgress(int currentValue, int length) {
  return (((currentValue + 1) * 100) / length).toInt();
}
