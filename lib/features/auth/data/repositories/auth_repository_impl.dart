import 'package:flutter_tdd_sample/features/auth/data/datasources/login_datasource.dart';
import 'package:flutter_tdd_sample/features/auth/domain/entities/app_user.dart';
import 'package:flutter_tdd_sample/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_tdd_sample/features/common/responses/response.dart';

class AuthRepositoryImpl extends AuthRepository {
  final LoginDatasource _loginDatasource;

  AuthRepositoryImpl(this._loginDatasource);

  @override
  Future<Response<AppUser>> loginWithUsernameAndPassword(String username, String password) {
    throw UnimplementedError();
  }
}
