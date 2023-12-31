import 'package:book_management_mobile/app/controllers/login_controller.dart';
import 'package:book_management_mobile/app/routes/app_routes.dart';
import 'package:book_management_mobile/app/utils/button_off.dart';
import 'package:book_management_mobile/app/utils/colors.dart';
import 'package:book_management_mobile/app/utils/my_elevated_button.dart';
import 'package:book_management_mobile/app/utils/pop_up_custom.dart';
import 'package:book_management_mobile/app/utils/size_helper.dart';
import 'package:book_management_mobile/app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginPage extends GetView<LoginController> {
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
          Form(
              key: _formKey,
              child: Column(
                children: [
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
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(fontSize: 16),
                      decoration: InputDecorationEmail(),
                      controller: emailC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Form tidak boleh kosong';
                        }
                        return null;
                      }),
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
                  Obx(() => TextFormField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(fontSize: 16),
                      obscureText: controller.obsPassword.value,
                      controller: passwordC,
                      decoration: InpuDecorationPassword(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Form tidak boleh kosong';
                        }
                        return null;
                      })),
                ],
              )),
          const SizedBox(
            height: 26,
          ),
          Obx(() => controller.isLoadingLogin.isTrue
              ? ButtonOff(
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.threeArchedCircle(
                      color: Colors.white,
                      size: 26,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Memvalidasi kredensial",
                      style: titleButton(whiteColor),
                    )
                  ],
                ))
              : MyElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      login();
                    }
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Text(
                    "Login",
                    style: titleButton(whiteColor),
                  ),
                  height: 50)),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "atau",
              style: bodyLarge(grayColo700),
            ),
          ),
          const SizedBox(
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
                  onTap: () => Get.toNamed(Routes.register),
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
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: errorColor),
      ),
      errorStyle: bodySmall(errorColor),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: errorColor),
      ),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: borderColor)),
      contentPadding: const EdgeInsets.all(14),
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
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: errorColor),
      ),
      errorStyle: bodySmall(errorColor),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: errorColor),
      ),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: borderColor)),
      contentPadding: const EdgeInsets.all(14),
      prefixIcon: const Icon(IconlyLight.lock),
      hintText: 'Masukkan password anda',
      hintStyle: titleMedium(grayColor500),
      border: const OutlineInputBorder(borderSide: BorderSide()),
      suffixIcon: Obx(() => IconButton(
          onPressed: () {
            controller.toogeObscure();
          },
          icon: Icon(
            controller.obsPassword.isTrue ? IconlyLight.hide : IconlyLight.show,
            size: 24,
          ))),
    );
  }

  void login() async {
    var param = {
      "email": emailC.text,
      "password": passwordC.text,
    };

    controller.login(param).then((value) {
      controller.success.isFalse
          ? alertError(Get.context,
              title: "Error", subtitle: controller.message.value)
          : Get.offAllNamed(Routes.base);
    });
  }
}
