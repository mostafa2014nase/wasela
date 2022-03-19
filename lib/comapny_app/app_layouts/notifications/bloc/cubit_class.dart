import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasela/comapny_app/app_layouts/notifications/bloc/states.dart';

class NotificationCubitClass extends Cubit<NotificationStates> {
  NotificationCubitClass() : super(NotificationInitState());

  static NotificationCubitClass get(context) => BlocProvider.of(context);

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
