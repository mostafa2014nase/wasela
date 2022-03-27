import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/add_order/bloc/states.dart';

class AddOrderCubitClass extends Cubit<AddOrderStates> {
  AddOrderCubitClass() : super(AddOrderInitialState());

  static AddOrderCubitClass get(context) => BlocProvider.of(context);

  // add order screen

  TextEditingController productNumber = TextEditingController();
  TextEditingController orderContain = TextEditingController();

  List<String> orderKind = [
    "بيك أب",
    "حساب",
    "مرتجعات",
    "تعديل على الشحنة",
    "الغاء الشحنة",
    "خامات",
    "طلببات أخري",
  ];

  List<String> transport = [
    "موتوسيكل",
    "ميني فان",
    "دبابة",
    "جامبو",
  ];

  var orderSelected;
  bool isKindSelected = false;

  void selectKind(choice) {
    orderSelected = choice;
    isKindSelected = !isKindSelected;
    emit(SelectChoiceSuccessState());
  }
  var trasnportSelected;
  bool isTransportSelected = false;

  void selectTransport(choice) {
    trasnportSelected = choice;
    isTransportSelected = !isTransportSelected;
    emit(SelectChoiceSuccessState());
  }
}
