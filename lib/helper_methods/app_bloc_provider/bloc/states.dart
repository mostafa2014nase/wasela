import 'package:wasela/helper_methods/modules/user_client_model.dart';

abstract class AppStates {}

class InitialAppState extends AppStates {}
class EnableUpdateSuccessState extends AppStates {}
class ResetFalseSuccessState extends AppStates {}
class GetImageSuccessState extends AppStates {}
class ResetAllControllers extends AppStates {}

class GetProfileCompanyLoadingState extends AppStates {}
class GetProfileCompanySuccessState extends AppStates {
  final CompanyModel companyModel;

  GetProfileCompanySuccessState(this.companyModel);
}
class GetProfileCompanyErrorState extends AppStates {
  final String error;

  GetProfileCompanyErrorState(this.error);
}


class GetProfileClientLoadingState extends AppStates {}
class GetProfileClientSuccessState extends AppStates {
  final ClientModel clientModel;

  GetProfileClientSuccessState(this.clientModel);
}
class GetProfileClientErrorState extends AppStates {
  final String error;

  GetProfileClientErrorState(this.error);
}

class UpdateProfileCompanyLoadingState extends AppStates {}
class UpdateProfileCompanySuccessState extends AppStates {}
class UpdateProfileCompanyErrorState extends AppStates {
  final String error;

  UpdateProfileCompanyErrorState(this.error);
}
class UpdateProfileClientLoadingState extends AppStates {}
class UpdateProfileClientSuccessState extends AppStates {}
class UpdateProfileClientErrorState extends AppStates {
  final String error;

  UpdateProfileClientErrorState(this.error);
}
