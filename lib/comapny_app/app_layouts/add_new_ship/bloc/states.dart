abstract class AddNewShipStates {}

class AddNewShipInitialState extends AddNewShipStates {}

class SelectCitySuccessState extends AddNewShipStates {}
class SelectAreaSuccessState extends AddNewShipStates {}
class SelectServiceSuccessState extends AddNewShipStates {}
class SelectAdditionalSuccessState extends AddNewShipStates {}
class ResetDropDownListsSuccessState extends AddNewShipStates {}

class ResetAreasSuccessState extends AddNewShipStates {}
class GetAdditionalServiceListSuccessState extends AddNewShipStates {}

class ShowErrorMsgInSnackBar extends AddNewShipStates {}

class ShowErrorMsgRedInSnackBar extends AddNewShipStates {}

class GetDateAndShowIt extends AddNewShipStates {}

class ConvertDateToString extends AddNewShipStates {}

class GetFileSuccessState extends AddNewShipStates {}
class SendFileSuccessState extends AddNewShipStates {}
class SendFileLoadingState extends AddNewShipStates {}
class SendFileErrorState extends AddNewShipStates {}

class GetCitiesDataSuccess extends AddNewShipStates {}

class GetServiceListSuccessState extends AddNewShipStates {}

class CollectShipmentsOrderSuccessState extends AddNewShipStates {}

class CreateNewShipmentOrderSuccessState extends AddNewShipStates {}
class CalculateCostsSuccessState extends AddNewShipStates {}

class CreateNewShipmentOrderLoadingState extends AddNewShipStates {}

class CreateNewShipmentOrderErrorState extends AddNewShipStates {
  final String error;

  CreateNewShipmentOrderErrorState(this.error);
}
class GetLimitedWeightLoadingState extends AddNewShipStates {}

class GetLimitedWeightSuccessState extends AddNewShipStates {}

class GetLimitedWeightErrorState extends AddNewShipStates {
  final String error;

  GetLimitedWeightErrorState(this.error);
}
