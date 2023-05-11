import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:smart_parking/controllers/history_controller.dart';
import 'package:smart_parking/controllers/manage_controller.dart';
import 'package:smart_parking/controllers/widget_controller.dart';
import 'package:smart_parking/pages/login_page.dart';
import 'package:smart_parking/pages/main_page.dart';
import 'package:smart_parking/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) async {});

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final widgetC = Get.put(WidgetController());
  final manageC = Get.put(ManageController());
  final historyC = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
