import 'package:flutter_tdd_sample/features/auth/data/models/app_user_model.dart';
import 'package:flutter_tdd_sample/features/common/responses/response.dart';

abstract class LoginDatasource {
  Future<Response<AppUserModel>> loginWithUsernameAndPassword(String username, String password);
}
