import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_tdd_sample/features/auth/data/datasources/login_datasource.dart';
import 'package:flutter_tdd_sample/features/auth/data/models/app_user_model.dart';
import 'package:flutter_tdd_sample/features/common/errors/app_error.dart';
import 'package:flutter_tdd_sample/features/common/responses/response.dart';

class RemoteConfigLoginDatasource extends LoginDatasource {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigLoginDatasource(this._remoteConfig);

  static const String referenceKey = 'users';

  @override
  Future<Response<AppUserModel>> loginWithUsernameAndPassword(String username, String password) async {
    await _remoteConfig.fetchAndActivate();
    final userDataString = _remoteConfig.getString(referenceKey);
    try {
      Iterable decodedUsers = jsonDecode(userDataString);

      final user = decodedUsers.firstWhere(
        (element) => element['username'] == username && element['password'] == password,
        orElse: () => null,
      );

      final parsedUser = user == null ? null : AppUserModel.fromJson(user);
      final error = parsedUser != null ? null : AppError.unAuthorized('unauthorized');
      return Response(value: parsedUser, error: error);
    } catch (exception) {
      return Response(value: null, error: AppError.nullValue('null value'));
    }
  }
}
