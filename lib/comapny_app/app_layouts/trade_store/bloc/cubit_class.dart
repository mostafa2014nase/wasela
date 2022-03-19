import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/trade_store/bloc/states.dart';

class TradeStoreSystemCubitClass extends Cubit<TradeStoreSystemStates> {
  TradeStoreSystemCubitClass() : super(TradeStoreSystemInitState());

  static TradeStoreSystemCubitClass get(context) => BlocProvider.of(context);

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
