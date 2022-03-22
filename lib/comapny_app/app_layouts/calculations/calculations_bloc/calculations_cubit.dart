import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/calculations/calculations_bloc/calculations_states.dart';

class CalculationsCubitClassForCompany
    extends Cubit<CalculationsStatesForCompany> {
  CalculationsCubitClassForCompany()
      : super(CalculationsForCompanyInitialState());

  static CalculationsCubitClassForCompany get(context) =>
      BlocProvider.of(context);
}
