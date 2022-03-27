abstract class LoginStates {}

class LoginInitState extends LoginStates {}

class ResetControllersSuccessState extends LoginStates {}

class SwapSeeAndNotSuccessState extends LoginStates {}

class MakeItCompanySuccessState extends LoginStates {}
class MakeItNotCompanySuccessState extends LoginStates {}

class RememberSuccessState extends LoginStates {}
class NotRememberSuccessState extends LoginStates {}

class ShowErrorInSnackBar extends LoginStates {}
class LoginLoadingState extends LoginStates {}
class LoginSuccessState extends LoginStates {}
class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}



