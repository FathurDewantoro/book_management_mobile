import 'package:book_management_mobile/app/controllers/register_controller.dart';
import 'package:book_management_mobile/app/routes/app_routes.dart';
import 'package:book_management_mobile/app/utils/colors.dart';
import 'package:book_management_mobile/app/utils/my_elevated_button.dart';
import 'package:book_management_mobile/app/utils/size_helper.dart';
import 'package:book_management_mobile/app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoadingRegisterPage extends StatelessWidget {
  final RegisterController authController = Get.find();
  LoadingRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Obx(
          () => authController.isRegisterLoading.value
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/lottie/loading.json'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Sedang menyimpan data",
                      style: titleLarge(grayColo700),
                    ),
                    Text(
                      "Tunggu sebentar lagi proses registrasi akan selesai...",
                      textAlign: TextAlign.center,
                      style: bodyLarge(grayColor500),
                    ),
                  ],
                )
              : authController.success.value
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: displayWidth(context) * 0.3,
                            child: Lottie.asset('assets/lottie/success.json',
                                repeat: false)),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Selamat",
                          style: titleLarge(grayColo700),
                        ),
                        Text(
                          "Anda berhasil terdaftar di dalam sistem, silhakan login untuk berjelajah lebih jauh.",
                          textAlign: TextAlign.center,
                          style: bodyLarge(grayColor500),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        MyElevatedButton(
                          onPressed: () {
                            Get.offAllNamed(Routes.login);
                          },
                          child: Text(
                            "Kembali Login",
                            style: titleButton(whiteColor),
                          ),
                          height: 50,
                          borderRadius: BorderRadius.circular(10),
                        )
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: displayWidth(context) * 0.3,
                            child: Lottie.asset('assets/lottie/error.json',
                                repeat: false)),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Gagal",
                          style: titleLarge(grayColo700),
                        ),
                        Text(
                          "Pastikan email yang anda kirimkan belum pernah terdafatar sebelumnya.",
                          textAlign: TextAlign.center,
                          style: bodyLarge(grayColor500),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        MyElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "Kembali",
                            style: titleButton(whiteColor),
                          ),
                          height: 50,
                          borderRadius: BorderRadius.circular(10),
                        )
                      ],
                    ),
        ),
      ),
    );
  }
}
