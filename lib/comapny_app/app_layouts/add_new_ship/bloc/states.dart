abstract class AddNewShipStates {}

class AddNewShipInitialState extends AddNewShipStates {}

class SelectChoiceSuccessState extends AddNewShipStates {}
class ResetAreasSuccessState extends AddNewShipStates {}

class DataSentLoadingState extends AddNewShipStates {}

class DataSentSuccessState extends AddNewShipStates {}
class GetFileSuccessState extends AddNewShipStates {}
class GetCitiesDataSuccess extends AddNewShipStates {}
class GetServiceListSuccessState extends AddNewShipStates {}
class CollectShipmentsOrderSuccessState extends AddNewShipStates {}
class CreateNewShipmentOrderSuccessState extends AddNewShipStates {}
class CreateNewShipmentOrderLoadingState extends AddNewShipStates {}
class CreateNewShipmentOrderErrorState extends AddNewShipStates {
  final String error;

  CreateNewShipmentOrderErrorState(this.error);
}
