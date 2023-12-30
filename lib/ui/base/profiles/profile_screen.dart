import 'package:book_management_mobile/utils/colors.dart';
import 'package:book_management_mobile/utils/my_elevated_button.dart';
import 'package:book_management_mobile/utils/size_helper.dart';
import 'package:book_management_mobile/utils/styles.dart';
import 'package:book_management_mobile/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          Column(
            children: [
              Text(
                "Fathur Tias Dewantoro",
                style: titleLarge(primaryColor),
              ),
              Text(
                "fathurtiasdewantoro@gmail.com",
                style: bodyLarge(grayColor500),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          MyElevatedButton(
              onPressed: () {},
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
}
