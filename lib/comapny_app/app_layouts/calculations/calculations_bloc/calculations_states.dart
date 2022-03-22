abstract class CalculationsStatesForCompany {}

class CalculationsForCompanyInitialState extends CalculationsStatesForCompany {}

class DrawerTransaction extends CalculationsStatesForCompany {}

class LogOutSuccessState extends CalculationsStatesForCompany {}

class LogOutErrorState extends CalculationsStatesForCompany {
  final String error;

  LogOutErrorState(this.error);
}
