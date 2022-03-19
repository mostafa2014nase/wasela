import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/ship/bloc/states.dart';

class ShipForCompanyAppCubitClass extends Cubit<ShipStates> {
  ShipForCompanyAppCubitClass() : super(ShipInitState());

  static ShipForCompanyAppCubitClass get(context) => BlocProvider.of(context);

  int index = 0;

  void toggleTab(int receivedIndex) {
    index = receivedIndex;
    emit(PerformToggleTabsSuccessState());
  }
}
