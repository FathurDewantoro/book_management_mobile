import 'package:book_management_mobile/app/controllers/register_controller.dart';
import 'package:book_management_mobile/app/routes/app_routes.dart';
import 'package:book_management_mobile/app/ui/loading/loading_register_page.dart';
import 'package:book_management_mobile/app/utils/size_helper.dart';
import 'package:book_management_mobile/app/utils/colors.dart';
import 'package:book_management_mobile/app/utils/my_elevated_button.dart';
import 'package:book_management_mobile/app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class RegisterPage extends GetView<RegisterController> {
  final TextEditingController namaC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController repeatPasswordC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
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
          Form(
              key: _formKey,
              child: Column(
                children: [
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
                    controller: namaC,
                    decoration: InputDecorationText(
                      "Nama Lengkap",
                      const Icon(IconlyLight.profile),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Form tidak boleh kosong';
                      }
                      return null;
                    },
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
                    keyboardType: TextInputType.emailAddress,
                    controller: emailC,
                    style: const TextStyle(fontSize: 16),
                    decoration: InputDecorationText(
                        "Email", const Icon(IconlyLight.message)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Form tidak boleh kosong';
                      }
                      return null;
                    },
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
                  Obx(() => TextFormField(
                        keyboardType: TextInputType.text,
                        style: const TextStyle(fontSize: 16),
                        obscureText: controller.obsPassword.value,
                        controller: passwordC,
                        decoration: InpuDecorationPassword(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Form tidak boleh kosong';
                          } else if (value != repeatPasswordC.text) {
                            return "Password harus sama";
                          }
                          return null;
                        },
                      )),
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
                  Obx(
                    () => TextFormField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(fontSize: 16),
                      obscureText: controller.obsPassword.value,
                      controller: repeatPasswordC,
                      decoration: InpuDecorationPassword(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Form tidak boleh kosong';
                        } else if (value != passwordC.text) {
                          return "Password harus sama";
                        }
                        return null;
                      },
                    ),
                  )
                ],
              )),
          const SizedBox(
            height: 30,
          ),
          MyElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  register();
                }
              },
              borderRadius: BorderRadius.circular(10),
              height: 50,
              child: Text(
                "Daftarkan",
                style: titleButton(whiteColor),
              )),
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
                  "Sudah memiliki akun ?",
                  textAlign: TextAlign.center,
                  style: bodyLarge(grayColo700),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.login),
                  child: Text(
                    " Login",
                    textAlign: TextAlign.center,
                    style: bodyLarge(secondaryColor),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  void register() {
    var param = {
      "name": namaC.text,
      "email": emailC.text,
      "password": passwordC.text,
      "password_confirmation": repeatPasswordC.text
    };

    controller.register(param);
    Get.to(() => LoadingRegisterPage());
  }

  // ignore: non_constant_identifier_names
  InputDecoration InputDecorationText(String hint, Icon icon) {
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
      hintText: 'Masukkan kata sandi',
      hintStyle: titleMedium(grayColor500),
      border: const OutlineInputBorder(borderSide: BorderSide()),
      suffixIcon: IconButton(
          onPressed: () {
            controller.toogeObscure();
          },
          icon: Obx(() => Icon(
                controller.obsPassword.value
                    ? IconlyLight.hide
                    : IconlyLight.show,
                size: 24,
              ))),
    );
  }
}
