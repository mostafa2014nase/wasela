abstract class DrawerStates {}

class DrawerStatesInitState extends DrawerStates {}

class PerformEnglishLanguageSuccessState extends DrawerStates {}
class PerformArabicLanguageSuccessState extends DrawerStates {}
class PerformChangeLanguageSuccessState extends DrawerStates {}
class SwapToEmailAnswerSuccessState extends DrawerStates {}
class SwapToCallAnswerSuccessState extends DrawerStates {}
class SetArabicNow extends DrawerStates {}
class SetEnglishNow extends DrawerStates {}
class ResetControllersSuccessState extends DrawerStates {}
class SwapSeeAndNotSuccessState extends DrawerStates {}
class ChangePasswordLoadingState extends DrawerStates {}
class ChangePasswordSuccessState extends DrawerStates {}
class ChangePasswordErrorState extends DrawerStates {
  final String error;

  ChangePasswordErrorState(this.error);
}

