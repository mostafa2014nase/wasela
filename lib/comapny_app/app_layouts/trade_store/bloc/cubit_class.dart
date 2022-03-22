import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/trade_store/bloc/states.dart';

class TradeStoreSystemCubitClass extends Cubit<TradeStoreSystemStates> {
  TradeStoreSystemCubitClass() : super(TradeStoreSystemInitState());

  static TradeStoreSystemCubitClass get(context) => BlocProvider.of(context);

  List<String> storeStyleName = [
    "التخزين انظمة (Drive-in )",
    "نظام 2 ",
    "نظام 3",
    "نظام 4",
    "نظام 5",
  ];
}
