import 'package:book_management_mobile/app/controllers/profile_controller.dart';
import 'package:book_management_mobile/app/routes/app_routes.dart';
import 'package:book_management_mobile/app/utils/colors.dart';
import 'package:book_management_mobile/app/utils/my_elevated_button.dart';
import 'package:book_management_mobile/app/utils/size_helper.dart';
import 'package:book_management_mobile/app/utils/styles.dart';
import 'package:book_management_mobile/app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBarCustomPrimary("Profile"),
      body: ListView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        children: [
          Center(
            child: Image.asset(
              "assets/images/profile.png",
              width: displayWidth(context) * 0.35,
            ),
          ),
          Obx(() => Skeletonizer(
                enabled: controller.isLoadingUser.value,
                child: Column(
                  children: [
                    Text(
                      controller.isLoadingUser.value
                          ? "Fathur Dewantoro"
                          : controller.userResponse!.name,
                      style: titleLarge(primaryColor),
                    ),
                    Text(
                      controller.isLoadingUser.value
                          ? "markemailnyanih@gmail.com"
                          : controller.userResponse!.email,
                      style: bodyLarge(grayColor500),
                    )
                  ],
                ),
              )),
          SizedBox(
            height: 30,
          ),
          MyElevatedButton(
              onPressed: () {
                showPopUpLogout(
                    context, "Keluar", "Apakah anda yakin untuk keluar ?");
              },
              borderRadius: BorderRadius.circular(10),
              // color: accentColor,
              child: Row(
                children: [
                  Icon(
                    IconlyLight.logout,
                    color: whiteColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Keluar Akun",
                    style: titleButton(whiteColor),
                  )
                ],
              ),
              height: 50),
        ],
      ),
    );
  }

  void logout() async {
    await controller.logout();
    Get.offAllNamed(Routes.splashScreen);
  }

  void showPopUpLogout(BuildContext context, String title, String subtitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: whiteColor,
          surfaceTintColor: whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0), // Adjust the border radius
          ),
          contentPadding: EdgeInsets.all(20),
          content: Container(
            width: displayWidth(context),
            height: 300,
            decoration: BoxDecoration(color: whiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: displayWidth(context),
                  height: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Lottie.asset('assets/lottie/error.json',
                      fit: BoxFit.contain),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  title,
                  style: titleLarge(grayColor900),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  subtitle,
                  style: bodyLarge(grayColor500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                MyElevatedButton(
                  onPressed: () {
                    logout();
                  },
                  child: Text(
                    "Keluar",
                    style: titleButton(whiteColor),
                  ),
                  height: 50,
                  color: errorColor500,
                  borderRadius: BorderRadius.circular(8),
                  width: displayWidth(context),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: displayWidth(context),
                  height: 50,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      "Cancel",
                      style: titleButton(grayColor900),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
