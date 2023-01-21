import '../../../models/model_login_screen.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final LoginScreenModel login;
  LoginSuccessState(this.login);
}

class LoginErrorState extends LoginStates {
  final dynamic error;
  final String? errorMassage;
  LoginErrorState(this.error, this.errorMassage);
}

class ChangeIconSifForPasswordState extends LoginStates {}
