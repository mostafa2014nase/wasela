abstract class AddOrderStates {}

class AddOrderInitialState extends AddOrderStates {}

class SelectChoiceSuccessState extends AddOrderStates {}

class GetTransportId extends AddOrderStates {}

class GetTransportsDataLoadingState extends AddOrderStates {}

class GetTransportsDataSuccessState extends AddOrderStates {}

class GetTransportsDataErrorState extends AddOrderStates {
  final String error;

  GetTransportsDataErrorState(this.error);
}

class CreatePickUpOrderLoadingState extends AddOrderStates {}

class CreatePickUpOrderSuccessState extends AddOrderStates {}

class CreatePickUpOrderErrorState extends AddOrderStates {
  final String error;

  CreatePickUpOrderErrorState(this.error);
}
