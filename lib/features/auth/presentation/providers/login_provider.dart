import 'package:flutter/material.dart';
import 'package:flutter_tdd_sample/features/auth/domain/usecases/login_with_username_and_password.dart';

class LoginProvider extends ChangeNotifier {
  final LoginWithUsernameAndPassword loginWithUsernameAndPassword;

  LoginProvider(this.loginWithUsernameAndPassword);
}