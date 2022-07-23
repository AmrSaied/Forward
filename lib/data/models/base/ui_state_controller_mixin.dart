import 'package:get/get.dart';

import 'api_status.dart';
import 'ui_state.dart';

mixin UiStateControllerMixin on GetxController {
  UiState<T> mapToUiState<T>(ApiStatus responseStatus) {
    switch (responseStatus.status.runtimeType) {
      case NoInternetStatus:
        return UiState.noInternet();
      case SuccessStatus:
        return UiState.success(responseStatus.data);
      case ErrorStatus:
        if (responseStatus.status?.subStatusCode == 0) {
          return UiState.error(responseStatus.status?.message);
        } else {
          return UiState.serverError("Server Error");
        }

      case UnAuthorizedStatus:
        return UiState.error("unAuthorized");
      default:
        return UiState.error("Generic Error");
    }
  }
}
