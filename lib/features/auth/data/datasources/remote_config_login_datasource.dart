import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_tdd_sample/features/auth/data/datasources/login_datasource.dart';
import 'package:flutter_tdd_sample/features/auth/data/models/app_user_model.dart';
import 'package:flutter_tdd_sample/features/common/responses/response.dart';

class RemoteConfigLoginDatasource extends LoginDatasource {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigLoginDatasource(this._remoteConfig);

  @override
  Future<Response<AppUserModel>> loginWithUsernameAndPassword(String username, String password) {
    throw UnimplementedError();
  }
}
