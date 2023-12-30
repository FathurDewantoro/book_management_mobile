import 'package:book_management_mobile/ui/base/base_page.dart';
import 'package:book_management_mobile/ui/register/register_page.dart';
import 'package:book_management_mobile/utils/colors.dart';
import 'package:book_management_mobile/utils/my_elevated_button.dart';
import 'package:book_management_mobile/utils/size_helper.dart';
import 'package:book_management_mobile/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obsPassword = true;

  //toggle change obscure password
  void _toggleObscured() {
    setState(() {
      _obsPassword == true ? _obsPassword = false : _obsPassword = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        children: [
          Image.asset('assets/images/login.png'),
          Text(
            "Selamat Datang",
            style: headlineSmall(primaryColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Masukkan kredensial akun anda untuk masuk kedalam sistem Book Management.",
            style: bodyLarge(grayColor500),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: displayWidth(context),
            child: const Text(
              'Email',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 13),
            decoration: InputDecorationEmail(),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: displayWidth(context),
            child: const Text(
              'Password',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 13),
            obscureText: _obsPassword,
            decoration: InpuDecorationPassword(),
          ),
          SizedBox(
            height: 30,
          ),
          MyElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return BasePage();
                  },
                ));
              },
              borderRadius: BorderRadius.circular(10),
              child: Text(
                "Login",
                style: titleButton(whiteColor),
              ),
              height: 50),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "atau",
              style: bodyLarge(grayColo700),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Belum memiliki akun ?",
                  textAlign: TextAlign.center,
                  style: bodyLarge(grayColo700),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop,
                  child: Text(
                    " Daftar disini",
                    textAlign: TextAlign.center,
                    style: bodyLarge(secondaryColor),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  InputDecoration InputDecorationEmail() {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: primaryColor)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: borderColor),
      ),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: borderColor)),
      contentPadding: EdgeInsets.all(14),
      prefixIcon: const Icon(IconlyLight.message),
      hintText: 'Email',
      hintStyle: titleMedium(grayColor500),
      border:
          const OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
    );
  }

  // ignore: non_constant_identifier_names
  InputDecoration InpuDecorationPassword() {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: primaryColor)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: borderColor),
      ),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: borderColor)),
      contentPadding: EdgeInsets.all(14),
      prefixIcon: const Icon(IconlyLight.lock),
      hintText: 'Masukkan password anda',
      hintStyle: titleMedium(grayColor500),
      border: const OutlineInputBorder(borderSide: BorderSide()),
      suffixIcon: IconButton(
          onPressed: () {
            _toggleObscured();
          },
          icon: Icon(
            _obsPassword ? IconlyLight.hide : IconlyLight.show,
            size: 24,
          )),
    );
  }
}
