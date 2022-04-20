abstract class RegisterStates {}

class RegisterStatesInitState extends RegisterStates {}

class ResetControllersSuccessState extends RegisterStates {}

class SwapSeeAndNotSuccessState extends RegisterStates {}

class MakeItCompanySuccessState extends RegisterStates {}

class MakeItNotCompanySuccessState extends RegisterStates {}

class RegisterCompanyLoadingState extends RegisterStates {}

class RegisterCompanySuccessState extends RegisterStates {}

class RegisterCompanyErrorState extends RegisterStates {
  final String error;

  RegisterCompanyErrorState(this.error);
}
class RegisterClientLoadingState extends RegisterStates {}

class RegisterClientSuccessState extends RegisterStates {}
class GetCitiesDataSuccess extends RegisterStates {}
class SelectChoiceSuccessState extends RegisterStates {}

class RegisterClientErrorState extends RegisterStates {
  final String error;

  RegisterClientErrorState(this.error);
}
