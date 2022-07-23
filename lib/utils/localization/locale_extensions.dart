import 'package:floward/localization/Localization_service.dart';
import 'package:flutter/material.dart';

import '../../localization/localization.dart';

extension LocalizationX on LocalizationServiceController {
  Locale get currentLocale => localizationString.value == 'ar'
      ? LocalizationService.arabicLocale
      : LocalizationService.englishLocale;
}
