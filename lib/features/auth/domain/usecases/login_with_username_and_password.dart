import 'package:flutter_tdd_sample/features/auth/domain/entities/app_user.dart';
import 'package:flutter_tdd_sample/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_tdd_sample/features/common/responses/response.dart';

class LoginWithUsernameAndPassword {
  final AuthRepository _repository;

  LoginWithUsernameAndPassword(this._repository);

  Future<Response<AppUser>> call({
    required String username,
    required String password,
  }) async {
    return await _repository.loginWithUsernameAndPassword(username, password);
  }
}
