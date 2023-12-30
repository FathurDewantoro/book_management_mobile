import 'package:book_management_mobile/ui/login/login_page.dart';
import 'package:book_management_mobile/ui/register/register_page.dart';
import 'package:book_management_mobile/utils/colors.dart';
import 'package:book_management_mobile/utils/my_elevated_button.dart';
import 'package:book_management_mobile/utils/size_helper.dart';
import 'package:book_management_mobile/utils/text_style.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Image.asset('assets/images/onboarding.png'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Basic Book \nManagement Apps",
                  style: headlineSmall(primaryColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Sebuah platform yang dirancang khusus untuk mempermudah pengguna dalam mengelola data buku secara efisien",
                  style: bodyLarge(grayColor500),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
            Column(
              children: [
                MyElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ));
                    },
                    width: displayWidth(context),
                    borderRadius: BorderRadius.circular(10),
                    height: 50,
                    child: Text(
                      "Daftar Sekarang",
                      style: titleButton(whiteColor),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        )),
                    child: Text(
                      "Sudah memiliki akun",
                      textAlign: TextAlign.center,
                      style: titleSmall(grayColo700),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
