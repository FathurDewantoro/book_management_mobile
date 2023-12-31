import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_routes.dart';
import 'app/utils/colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Management App',
      theme: ThemeData(
        primaryColor: primaryColor,
        fontFamily: 'Inter',
      ),
      defaultTransition: Transition.cupertino,
      initialRoute: Routes.splashScreen,
      getPages: getPages,
    );
  }
}
