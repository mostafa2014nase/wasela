abstract class HomeStatesForCompany {}

class HomeForCompanyInitialState extends HomeStatesForCompany {}

class DrawerTransaction extends HomeStatesForCompany {}

class GetCodAndBalanceLoadingState extends HomeStatesForCompany {}

class GetCodAndBalanceSuccessState extends HomeStatesForCompany {}

class GetCodAndBalanceErrorState extends HomeStatesForCompany {
  final String error;

  GetCodAndBalanceErrorState(this.error);
}
class GetChartDataLoadingState extends HomeStatesForCompany {}

class GetChartDataSuccessState extends HomeStatesForCompany {}

class GetChartDataErrorState extends HomeStatesForCompany {
  final String error;

  GetChartDataErrorState(this.error);
}

class LogOutSuccessState extends HomeStatesForCompany {}

class LogOutErrorState extends HomeStatesForCompany {
  final String error;

  LogOutErrorState(this.error);
}
