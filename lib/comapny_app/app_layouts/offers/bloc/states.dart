abstract class OfferStates {}

class OfferInitState extends OfferStates {}

class GetOffersSystemsLoadingState extends OfferStates {}
class GetOffersSystemsSuccessState extends OfferStates {}
class GetOffersSystemsErrorState extends OfferStates {
  final String error;

  GetOffersSystemsErrorState(this.error);

}
class EnrollOfferLoadingState extends OfferStates {}
class EnrollOfferSuccessState extends OfferStates {}
class EnrollOfferErrorState extends OfferStates {
  final String error;

  EnrollOfferErrorState(this.error);

}
class Clicked extends OfferStates {}
class NotClicked extends OfferStates {}