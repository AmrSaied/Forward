import 'package:event_bus/event_bus.dart';
import 'package:floward/localization/Localization_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'localization/Localization_service.dart';
import 'localization/localization.dart';
import 'presentation/app/app.dart';

final cacheStorage = GetStorage();
final EventBus eventBus = EventBus();
final navKey = GlobalKey<NavigatorState>();

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await GetStorage.init();
  initializeDateFormatting();
  Get.put(LocalizationService());
  Get.put(LocalizationServiceController(Get.find()));
  runApp(const MyApp());
}
