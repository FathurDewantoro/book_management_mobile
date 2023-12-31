import 'package:book_management_mobile/app/data/shared/shared_preferences.dart';
import 'package:book_management_mobile/app/ui/base/base_page.dart';
import 'package:book_management_mobile/app/ui/onboarding/onboarding_page.dart';
import 'package:book_management_mobile/app/utils/colors.dart';
import 'package:book_management_mobile/app/utils/size_helper.dart';
import 'package:book_management_mobile/app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkIsLogin();
  }

  void checkIsLogin() async {
    bool isLogin = await MySharedPreferences().checkLogin();
    Future.delayed(Duration(seconds: 2)).then((value) {
      if (isLogin) {
        Get.offAll(() => BasePage(), transition: Transition.cupertino);
      } else {
        Get.offAll(() => OnBoardingPage(), transition: Transition.cupertino);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: displayWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Image.asset(
              "assets/images/logo_white.png",
              width: displayWidth(context) * 0.4,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text(
                "Version 0.0.1",
                style: bodySmall(grayColor500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
