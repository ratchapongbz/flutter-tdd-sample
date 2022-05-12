import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_tdd_sample/features/auth/data/datasources/remote_config_login_datasource.dart';
import 'package:flutter_tdd_sample/features/auth/data/models/app_user_model.dart';
import 'package:flutter_tdd_sample/features/common/errors/app_error.dart';
import 'package:flutter_tdd_sample/features/common/responses/response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remote_config_login_datasource_test.mocks.dart';

@GenerateMocks([FirebaseRemoteConfig])
void main() {
  late MockFirebaseRemoteConfig remoteConfig;
  late RemoteConfigLoginDatasource datasource;

  const mockUsername = 'test-username';
  const mockPassword = 'test-password';
  const referenceKey = RemoteConfigLoginDatasource.referenceKey;

  setUp(() {
    remoteConfig = MockFirebaseRemoteConfig();
    datasource = RemoteConfigLoginDatasource(remoteConfig);
  });

  test(
    'datasource should call remoteConfig fetchAndActivate and getString with key "$referenceKey"',
    () async {
      // arrange
      when(remoteConfig.fetchAndActivate()).thenAnswer((_) async => true);
      when(remoteConfig.getString(referenceKey)).thenReturn(RemoteConfigValue.defaultValueForString);

      // act
      await datasource.loginWithUsernameAndPassword(mockUsername, mockPassword);

      // assert
      verify(remoteConfig.fetchAndActivate()).called(1);
      verify(remoteConfig.getString(referenceKey)).called(1);
    },
  );

  test(
    'description should return null with error(nullValue) if remoteConfig user data is null',
    () async {
      // arrange
      when(remoteConfig.fetchAndActivate()).thenAnswer((_) async => true);
      when(remoteConfig.getString(referenceKey)).thenReturn(RemoteConfigValue.defaultValueForString);

      // act
      final response = await datasource.loginWithUsernameAndPassword(mockUsername, mockPassword);

      // assert
      expect(response, Response<AppUserModel>(value: null, error: AppError.nullValue('null value')));
    },
  );

  group(
    'datasource should return correct user if remoteConfig has user data',
    () {
      const expectedUserModel = AppUserModel(
        id: 'id-001',
        name: 'name-001',
        areaId: 'areaId-001',
      );

      setUp(() => when(remoteConfig.fetchAndActivate()).thenAnswer((_) async => true));

      test(
        'login success when remoteConfig has only one user',
        () async {
          // arrange
          when(remoteConfig.getString(referenceKey)).thenAnswer(
            (_) => '[{"username": "test-username",'
                '"password": "test-password",'
                '"id": "${expectedUserModel.id}",'
                '"name": "${expectedUserModel.name}",'
                '"area_id": "${expectedUserModel.areaId}"'
                '}]',
          );

          // act
          final response = await datasource.loginWithUsernameAndPassword(mockUsername, mockPassword);

          // assert
          expect(response, const Response(value: expectedUserModel, error: null));
        },
      );

      test(
        'login success when remoteConfig has many users',
        () async {
          // arrange
          when(remoteConfig.getString(referenceKey)).thenAnswer(
            (_) => '[{"username": "test-username",'
                '"password": "test-password",'
                '"id": "${expectedUserModel.id}",'
                '"name": "${expectedUserModel.name}",'
                '"area_id": "${expectedUserModel.areaId}"'
                '}, {"username": "test-username-00",'
                '"password": "test-password-00",'
                '"id": "id-002",'
                '"name": "name-002",'
                '"area_id": "areaId-002"'
                '}]',
          );
          // act
          final response = await datasource.loginWithUsernameAndPassword(mockUsername, mockPassword);

          // assert
          expect(response, const Response(value: expectedUserModel, error: null));
        },
      );

      test(
        'should return null with error(unAuthorized) if login with wrong username',
        () async {
          // arrange
          when(remoteConfig.getString(referenceKey)).thenAnswer(
            (_) => '[{"username": "test-username",'
                '"password": "test-password",'
                '"id": "${expectedUserModel.id}",'
                '"name": "${expectedUserModel.name}",'
                '"area_id": "${expectedUserModel.areaId}"'
                '}]',
          );

          // act
          final response = await datasource.loginWithUsernameAndPassword('wrong-username', mockPassword);

          // assert
          expect(response, Response<AppUserModel>(value: null, error: AppError.unAuthorized('unauthorized')));
        },
      );
    },
  );
}
