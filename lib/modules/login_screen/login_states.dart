abstract class LoginScreenStates {}

class LoginScreenInitialState extends LoginScreenStates {}

class LoginScreenLoadingState extends LoginScreenStates {}

class LoginScreenSuccessState extends LoginScreenStates {

  final String uId;
  LoginScreenSuccessState(this.uId);
}

class LoginScreenErrorState extends LoginScreenStates {

  String error;
  LoginScreenErrorState(this.error);
}

class LoginScreenChangePasswordVisibility extends LoginScreenStates{}