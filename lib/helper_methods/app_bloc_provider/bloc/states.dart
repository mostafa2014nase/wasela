import 'package:wasela/helper_methods/modules/user_client_model.dart';

abstract class AppStates {}

class InitialAppState extends AppStates {}

class EnableUpdateSuccessState extends AppStates {}
class GetCitiesDataSuccess extends AppStates {}
class SelectChoiceSuccessState extends AppStates {}
class MakeListsEmptySuccessState extends AppStates {}

class ResetFalseSuccessState extends AppStates {}

class GetImageSuccessState extends AppStates {}

class ResetAllControllers extends AppStates {}
class UpdateProfileSuccessState extends AppStates {}
class UpdateProfileErrorState extends AppStates {}

class GetProfileCompanyLoadingState extends AppStates {}

class GetProfileCompanySuccessState extends AppStates {
  final CompanyModel companyModel;

  GetProfileCompanySuccessState(this.companyModel);
}

class GetProfileCompanyErrorState extends AppStates {
  final String error;

  GetProfileCompanyErrorState(this.error);
}

class GetCompanyCityAndAreaProfileLoadingState extends AppStates {}

class GetCompanyCityAndAreaProfileSuccessState extends AppStates {}

class GetCompanyCityAndAreaProfileErrorState extends AppStates {
  final String error;

  GetCompanyCityAndAreaProfileErrorState(this.error);
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

class GetAllShipmentsDataLoadingState extends AppStates {}


class GetAllShipmentsDataSuccessState extends AppStates {}

class GetAllShipmentsDataErrorState extends AppStates {
  final String error;

  GetAllShipmentsDataErrorState(this.error);
}

class GetAllShipmentsDataWithOutCasesLoadingState extends AppStates {}


class GetAllShipmentsDataWithOutCasesSuccessState extends AppStates {}

class GetAllShipmentsDataWithOutCasesErrorState extends AppStates {
  final String error;

  GetAllShipmentsDataWithOutCasesErrorState(this.error);
}
class GetShipmentsWithStatueBouncePart extends AppStates {}
class GetShipmentsWithStatueBounceCompletePay extends AppStates {}
class GetShipmentsWithStatueBounceCompleteNotPay extends AppStates {}