abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class DrawerTransaction extends HomeStates {}

class LogOutSuccessState extends HomeStates {}

class LogOutErrorState extends HomeStates {
  final String error;

  LogOutErrorState(this.error);
}
