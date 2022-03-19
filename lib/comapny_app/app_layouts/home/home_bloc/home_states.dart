abstract class HomeStatesForCompany {}

class HomeForCompanyInitialState extends HomeStatesForCompany {}

class DrawerTransaction extends HomeStatesForCompany {}

class LogOutSuccessState extends HomeStatesForCompany {}

class LogOutErrorState extends HomeStatesForCompany {
  final String error;

  LogOutErrorState(this.error);
}
