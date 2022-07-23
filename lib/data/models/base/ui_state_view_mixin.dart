import 'package:floward/styles/widget/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:one_context/one_context.dart';

import 'ui_state.dart';

mixin UiStateViewMixin {
  Widget handleUiState<T>(
    Rx<UiState<T>> observableState,
    Widget Function(T model) success,
  ) {
    final stateValue = observableState.value;
    return _getWidgetOfUiState<T>(
      stateValue,
      success,
      loadingWidget,
      noInternetWidget,
      noDataWidget,
      errorWidget,
    );
  }

  Widget _getWidgetOfUiState<T>(
    UiState<T> uiStateModel,
    Widget Function(T model) success,
    Widget Function(LoadingType loadingType) loading,
    Widget Function() noInternet,
    Widget Function() noData,
    Widget Function(String message) error,
  ) {
    switch (uiStateModel.state.runtimeType) {
      case Loading:
        return _onLoading(uiStateModel, loading);
      case Success:
        return success(uiStateModel.data as T);
      case NoInternet:
        return noInternetWidget();
      case NoData:
        return noDataWidget();
      case Error:
        return errorWidget(uiStateModel.message);
      case ServerError:
        return errorWidget("Server Error");

      case Idle:
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _onLoading(
    UiState stateValue,
    Widget Function(LoadingType loadingType) loading,
  ) {
    Loading loadingType = stateValue.state as Loading;
    return loading(loadingType.loadingType);
  }

  Widget loadingWidget(LoadingType loadingType) {
    if (loadingType == LoadingType.REFRESH) {
      return const SizedBox.shrink();
    } else if (loadingType == LoadingType.PAGING) {
      return const SizedBox.shrink();
    } else {
      return const LoadingView();
    }
  }

  Widget errorWidget(String? message) {
    OneContext().showDialog(
      builder: (_) => AlertDialog(
        title: const Text("Error Massage"),
        content: Text(message!),
      ),
    );
    return const SizedBox.shrink();
  }

  Widget noInternetWidget() {
    return SizedBox(
      child: Center(
        child: Lottie.asset(
          'assets/json/lottiefiles/no-internet-connection-empty-state.json',
        ),
      ),
    );
  }

  Widget noDataWidget() {
    return SizedBox(
      child: Center(
        child: Lottie.asset('assets/json/lottiefiles/empty_data_icon.json'),
      ),
    );
  }

  Widget handleUiMultipleStates<T, R>(
    Rx<UiState<T>> observableState,
    Widget Function(T model) success,
  ) {
    final stateValue = observableState.value;
    return _getWidgetOfUiState<T>(
      stateValue,
      success,
      loadingWidget,
      noInternetWidget,
      noDataWidget,
      errorWidget,
    );
  }
}
