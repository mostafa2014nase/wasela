abstract class ShipStates {}

class ShipInitState extends ShipStates {}

class PerformToggleTabsSuccessState extends ShipStates {}
class ShowDetailsMenu extends ShipStates {}

class SendMessageSuccessState extends ShipStates {}

class SendMessageErrorState extends ShipStates {
  final String error;

  SendMessageErrorState(this.error);
}
class GetAllShipmentsDataLoadingState extends ShipStates {}

class GetAllShipmentsDataSuccessState extends ShipStates {}
class GetAllShipmentsDataErrorState extends ShipStates {
  final String error;

  GetAllShipmentsDataErrorState(this.error);
}