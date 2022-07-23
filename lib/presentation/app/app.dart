import 'package:floward/binding/app/app_binding.dart';
import 'package:floward/localization/Localization_service.dart';
import 'package:floward/localization/localization.dart';
import 'package:floward/main.dart';
import 'package:floward/navigation/app_pages.dart';
import 'package:floward/utils/localization/locale_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:one_context/one_context.dart';

class MyApp extends GetWidget<LocalizationServiceController> {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizationController = Get.find<LocalizationServiceController>();
    return ScreenUtilInit(
      designSize: const Size(187.5, 406),
      builder: () => Obx(
        () => GetMaterialApp(
          navigatorObservers: [routeObserver],
          navigatorKey: navKey,
          builder: OneContext().builder,
          debugShowCheckedModeBanner: false,
          initialBinding: AppBinding(),
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          locale: localizationController.currentLocale,
          fallbackLocale: LocalizationService.fallbackLocale,
          translations: LocalizationService(),
          enableLog: true,
          smartManagement: SmartManagement.keepFactory,
        ),
      ),
    );
  }
}
