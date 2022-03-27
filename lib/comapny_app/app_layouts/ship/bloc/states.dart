abstract class ShipStates {}

class ShipInitState extends ShipStates {}

class PerformToggleTabsSuccessState extends ShipStates {}

class SendMessageSuccessState extends ShipStates {}

class SendMessageErrorState extends ShipStates {
  final String error;

  SendMessageErrorState(this.error);
}
