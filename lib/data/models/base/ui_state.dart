class UiState<T> {
  T? data;
  String? message;
  State? state;

  UiState({this.data, this.message, this.state});

  UiState.loading({LoadingType loadingType = LoadingType.MAIN})
      : state = Loading(loadingType: loadingType);

  UiState.success(this.data) : state = Success();

  UiState.noData() : state = NoData();

  UiState.noInternet() : state = NoInternet();

  UiState.error(this.message) : state = Error();

  UiState.serverError(this.message) : state = ServerError();

  UiState.idle() : state = Idle();
}

abstract class State {}

class Success extends State {
  Success();
}

class NoData extends State {
  NoData();
}

class Loading extends State {
  LoadingType loadingType;

  Loading({this.loadingType = LoadingType.MAIN});
}

class NoInternet extends State {
  NoInternet();
}

class Error extends State {
  Error();
}

class ServerError extends State {
  ServerError();
}

class Idle extends State {
  Idle();
}

enum LoadingType { MAIN, REFRESH, PAGING }

extension UiStateExtension on UiState {
  bool get isLoading => state.runtimeType == Loading;

  bool get isLoadingMore =>
      state.runtimeType == Loading &&
      (state as Loading).loadingType == LoadingType.PAGING;

  bool get isError => state.runtimeType == Error;

  bool get isNoInternet => state.runtimeType == NoInternet;

  bool get isNoData => state.runtimeType == NoData;

  bool get isServerError => state.runtimeType == ServerError;

  bool get isSuccess => state.runtimeType == Success;

  bool get isIdle => state.runtimeType == Idle;

  T? getDataWrapper<T>() {
    if (isSuccess) {
      return (data as T);
    } else {
      return null;
    }
  }
}
