import 'package:book_management_mobile/ui/login/login_page.dart';
import 'package:book_management_mobile/utils/colors.dart';
import 'package:book_management_mobile/utils/my_elevated_button.dart';
import 'package:book_management_mobile/utils/size_helper.dart';
import 'package:book_management_mobile/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        children: [
          Center(
            child: Image.asset(
              'assets/images/daftar.png',
              width: displayWidth(context) * 0.8,
            ),
          ),
          Text(
            "Buat Akun",
            style: headlineSmall(primaryColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Daftarkan diri anda dan gunakan akun anda untuk dapat menggunakan aplikasi lebih lanjut.",
            style: bodyLarge(grayColor500),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: displayWidth(context),
            child: const Text(
              'Nama Lengkap',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 16),
            decoration: InputDecorationText(
                "Nama Lengkap", const Icon(IconlyLight.profile)),
          ),
          const SizedBox(height: 20),
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
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 16),
            decoration:
                InputDecorationText("Email", const Icon(IconlyLight.message)),
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
            style: const TextStyle(fontSize: 16),
            obscureText: _obsPassword,
            decoration: InpuDecorationPassword(),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: displayWidth(context),
            child: const Text(
              'Konfirmasi Password',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 16),
            obscureText: _obsPassword,
            decoration: InpuDecorationPassword(),
          ),
          SizedBox(
            height: 30,
          ),
          MyElevatedButton(
              onPressed: () {},
              borderRadius: BorderRadius.circular(10),
              child: Text(
                "Daftarkan",
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
                  "Sudah memiliki akun ?",
                  textAlign: TextAlign.center,
                  style: bodyLarge(grayColo700),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      )),
                  child: Text(
                    " Login",
                    textAlign: TextAlign.center,
                    style: bodyLarge(secondaryColor),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  InputDecoration InputDecorationText(String hint, Icon icon) {
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
      prefixIcon: icon,
      hintText: hint,
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
      hintText: 'Masukkan kata sandi',
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
