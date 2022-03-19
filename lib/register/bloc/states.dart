abstract class RegisterStates {}

class RegisterStatesInitState extends RegisterStates {}

class ResetControllersSuccessState extends RegisterStates {}
class SwapSeeAndNotSuccessState extends RegisterStates {}

class MakeItCompanySuccessState extends RegisterStates {}
class MakeItNotCompanySuccessState extends RegisterStates {}
class RegisterWithPhonesLoadingState extends RegisterStates {}
class RegisterWithPhonesSuccessState extends RegisterStates {}
class RegisterWithPhonesErrorState extends RegisterStates {
  final String error;

  RegisterWithPhonesErrorState(this.error);
}



