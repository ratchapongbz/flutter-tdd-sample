import 'package:flutter_tdd_sample/features/auth/domain/entities/app_user.dart';
import 'package:flutter_tdd_sample/features/common/responses/response.dart';

abstract class AuthRepository {
  Future<Response<AppUser>> loginWithUsernameAndPassword(String username, String password);
}
