import 'package:floward/networking/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';
import 'ar_EG.dart';
import 'en_US.dart';

class LocalizationService extends Translations {
  Locale? appLocale = Get.deviceLocale;
  set locale(Locale? value) => appLocale = value;

  static const fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'ar_EG': ar_EG,
      };

  static const arabicOption = 'عربي';
  static const englishOption = 'English';

  static const arabicLocale = Locale('ar', 'EG');
  static const englishLocale = Locale('en', 'US');

  Future<void> changeLocale(Locale locale) async {
    await saveLocale(locale);
    Get.updateLocale(locale);
  }

  Future<void> saveLocale(Locale _locale) async => await cacheStorage.write(
      CacheStorageKeys.appLocale, _locale.languageCode);

  void getLocale() {
    final localeLanguage = cacheStorage.read(CacheStorageKeys.appLocale);
    Locale currentLocale;
    if (localeLanguage == arabicLocale.languageCode) {
      currentLocale = arabicLocale;
    } else {
      currentLocale = englishLocale;
    }
    locale = currentLocale;
    changeLocale(currentLocale);
  }
}
