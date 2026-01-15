import 'package:skenteas/feature/auth/data/datasource/auth_datasource.dart';
import 'package:skenteas/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _authDatasource;

  AuthRepositoryImpl({required AuthDatasource authDatasource})
    : _authDatasource = authDatasource;


}
