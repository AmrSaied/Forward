import 'package:get/get.dart';

import 'localization.dart';

class LocalizationServiceController extends GetxController {
  // static Locale? get locale => Get.deviceLocale;
  final LocalizationService _localizationService;
  LocalizationServiceController(this._localizationService);

  static const enFlag = "http://www.geognos.com/api/en/countries/flag/US.png";
  static const arFlag = "http://www.geognos.com/api/en/countries/flag/SA.png";

  String get flag => (localizationString.value == 'ar') ? enFlag : arFlag;

  final RxString localizationString = "".obs;

  String get currentLanguage => localizationString.value == "ar"
      ? LocalizationService.englishOption
      : LocalizationService.arabicOption;

  void switchLanguages() {
    if (localizationString.value == "ar") {
      localizationString.value = "en";
      _localizationService.changeLocale(LocalizationService.englishLocale);
    } else {
      localizationString.value = "ar";
      _localizationService.changeLocale(LocalizationService.arabicLocale);
    }
  }

  @override
  void onInit() {
    _localizationService.getLocale();
    localizationString.value = _localizationService.appLocale!.languageCode;
    super.onInit();
  }
}
