abstract class MainNavStates {}

class InitialMainNavState extends MainNavStates {}

class NavBarSuccessState extends MainNavStates {}

class NavBarLoadingState extends MainNavStates {}

class NavBarErrorState extends MainNavStates {
  final String error;

  NavBarErrorState({required this.error});
}
class NavBarIndexChangedSuccessState extends MainNavStates {}

class NavBarIndexChangedLoadingState extends MainNavStates {}

class NavBarIndexChangedErrorState extends MainNavStates {
  final String error;

  NavBarIndexChangedErrorState({required this.error});
}

class GetUserDataLoadingState extends MainNavStates {}

class GetUserDataSuccessState extends MainNavStates {}
class GetUserDataErrorState extends MainNavStates {
  final String error;

  GetUserDataErrorState(this.error);
}

class SaveUidSuccessState extends MainNavStates {}

class SaveUidErrorState extends MainNavStates {
  final String error;

  SaveUidErrorState(this.error);
}

class MakeFalseState extends MainNavStates {}

class MakeTrueState extends MainNavStates {}
