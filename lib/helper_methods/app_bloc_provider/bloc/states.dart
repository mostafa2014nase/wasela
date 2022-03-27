import 'package:wasela/helper_methods/modules/user_client_model.dart';

abstract class AppStates {}

class InitialAppState extends AppStates {}
class EnableUpdateSuccessState extends AppStates {}
class ResetFalseSuccessState extends AppStates {}

class GetProfileCompanyLoadingState extends AppStates {}
class GetProfileCompanySuccessState extends AppStates {
  final CompanyModel companyModel;

  GetProfileCompanySuccessState(this.companyModel);
}
class GetProfileCompanyErrorState extends AppStates {
  final String error;

  GetProfileCompanyErrorState(this.error);
}
