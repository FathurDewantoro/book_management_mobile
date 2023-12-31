import 'package:book_management_mobile/app/controllers/book_controller.dart';
import 'package:book_management_mobile/app/routes/app_routes.dart';
import 'package:book_management_mobile/app/utils/colors.dart';
import 'package:book_management_mobile/app/utils/my_elevated_button.dart';
import 'package:book_management_mobile/app/utils/size_helper.dart';
import 'package:book_management_mobile/app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoadingAddBookPage extends StatelessWidget {
  LoadingAddBookPage({super.key});
  final BookController controller = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Obx(() => controller.isLoadingAdd.value
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
                    "Tunggu sebentar lagi proses penyimpanan data akan selesai...",
                    textAlign: TextAlign.center,
                    style: bodyLarge(grayColor500),
                  ),
                ],
              )
            : Column(
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
                    "Data buku berhasil disimpan di dalam database.",
                    textAlign: TextAlign.center,
                    style: bodyLarge(grayColor500),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  MyElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(Routes.base);
                    },
                    child: Text(
                      "Kembali Home",
                      style: titleButton(whiteColor),
                    ),
                    height: 50,
                    borderRadius: BorderRadius.circular(10),
                  )
                ],
              )),
      ),
    );
  }
}
