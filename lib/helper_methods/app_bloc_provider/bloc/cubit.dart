import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/helper_methods/app_bloc_provider/bloc/states.dart';

class AppCubitClass extends Cubit<AppStates> {
  AppCubitClass() : super(InitialAppState());

  static AppCubitClass get(context) => BlocProvider.of(context);
}
