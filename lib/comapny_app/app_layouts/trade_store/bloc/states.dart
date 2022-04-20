abstract class TradeStoreSystemStates {}

class TradeStoreSystemInitState extends TradeStoreSystemStates {}

class PerformToggleMenuSuccessState extends TradeStoreSystemStates {}
class GetStorageSystemsLoadingState extends TradeStoreSystemStates {}
class GetStorageSystemsSuccessState extends TradeStoreSystemStates {}
class GetStorageSystemsErrorState extends TradeStoreSystemStates {
  final String error;

  GetStorageSystemsErrorState(this.error);
}
class EnrollStorageLoadingState extends TradeStoreSystemStates {}
class EnrollStorageSuccessState extends TradeStoreSystemStates {}
class EnrollStorageErrorState extends TradeStoreSystemStates {
  final String error;

  EnrollStorageErrorState(this.error);
}
