import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/offers/bloc/states.dart';

class OfferCubitClass extends Cubit<OfferStates> {
  OfferCubitClass() : super(OfferInitState());

  static OfferCubitClass get(context) => BlocProvider.of(context);

  bool map = true;

  void toggleMap() {
    map = true;
    emit(PerformToggleMenuSuccessState());
  }

  void toggleMenu() {
    map = false;
    emit(PerformToggleMenuSuccessState());
  }
}
