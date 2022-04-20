abstract class ShipStates {}

class ShipInitState extends ShipStates {}

class PerformToggleTabsSuccessState extends ShipStates {}

class ShowDetailsMenu extends ShipStates {}

class HideDetailsMenu extends ShipStates {}

class SendMessageSuccessState extends ShipStates {}

class ShowEmptyTextWidget extends ShipStates {}

class ShowListWidget extends ShipStates {}

class SendMessageErrorState extends ShipStates {
  final String error;

  SendMessageErrorState(this.error);
}

class GetAllShipmentsDataLoadingState extends ShipStates {}

class OpenWhatsAppSuccessState extends ShipStates {}

class OpenWhatsAppErrorState extends ShipStates {}

class GetFromDateAndShowIt extends ShipStates {}

class GetToDateAndShowIt extends ShipStates {}

class ConvertDateToString extends ShipStates {}

class ResetToDateAndString extends ShipStates {}
class ResetFromDateAndString extends ShipStates {}

class GetAllShipmentsDataSuccessState extends ShipStates {}

class GetAllShipmentsDataErrorState extends ShipStates {
  final String error;

  GetAllShipmentsDataErrorState(this.error);
}

class GetAllMatchedShipmentsDataLoadingState extends ShipStates {}

class GetAllMatchedShipmentsDataSuccessState extends ShipStates {}

class GetAllMatchedShipmentsDataErrorState extends ShipStates {
  final String error;

  GetAllMatchedShipmentsDataErrorState(this.error);
}

class GetDateAndShowIt extends ShipStates {}

class GetFileSuccessState extends ShipStates {}

class GetCitiesDataSuccess extends ShipStates {}

class ResetDropDownData extends ShipStates {}

class GetServiceListSuccessState extends ShipStates {}

class CollectShipmentsOrderSuccessState extends ShipStates {}

class EditShipmentOrderSuccessState extends ShipStates {}

class EditShipmentOrderLoadingState extends ShipStates {}

class EditShipmentOrderErrorState extends ShipStates {
  final String error;

  EditShipmentOrderErrorState(this.error);
}

class GetSpecificShipmentDataSuccessState extends ShipStates {}

class GetSpecificShipmentDataLoadingState extends ShipStates {}

class GetSpecificShipmentDataErrorState extends ShipStates {
  final String error;

  GetSpecificShipmentDataErrorState(this.error);
}

class GetCustomerCityAndAreaLoadingState extends ShipStates {}

class GetCustomerCityAndAreaSuccessState extends ShipStates {}

class GetCustomerCityAndAreaErrorState extends ShipStates {
  final String error;

  GetCustomerCityAndAreaErrorState(this.error);
}

class SelectChoiceEditSuccessState extends ShipStates {}

class ResetAreasEditSuccessState extends ShipStates {}

class ShowErrorEditMsgInSnackBar extends ShipStates {}

class ShowErrorEditMsgRedInSnackBar extends ShipStates {}

class GetServiceTypeSuccessState extends ShipStates {}
class NoSuchData extends ShipStates {}
