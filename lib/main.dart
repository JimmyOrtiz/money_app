import 'package:flutter/material.dart';

import 'package:money_app/screens/dashboard.dart';
import 'package:money_app/screens/payment_screen.dart';
import 'package:money_app/screens/send_screen.dart';
import 'package:get/get.dart';
import 'package:money_app/services/controllers.dart';
import 'package:flutter/services.dart';

void main() async {
  HomeBinding().dependencies();

  runApp(MyApp());
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<BalanceController>(BalanceController(), permanent: true);
    Get.put<ScreenController>(ScreenController(), permanent: true);
    Get.put<ActivityCardController>(ActivityCardController(), permanent: true);
    Get.put<CardFormatter>(CardFormatter(), permanent: true);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Dashboard.screenID,
      getPages: [
        GetPage(
          name: Dashboard.screenID,
          page: () => Dashboard(),
        ),
        GetPage(
          name: PaymentScreen.screenID,
          page: () => PaymentScreen(),
        ),
        GetPage(
          name: SendScreen.screenID,
          page: () => SendScreen(),
        )
      ],
    );
  }
}
