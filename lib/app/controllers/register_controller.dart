import 'dart:convert';

import 'package:book_management_mobile/app/data/model/register_response.dart';
import 'package:book_management_mobile/app/service/api/dio_client.dart';
import 'package:book_management_mobile/app/service/api/url_access.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  List<RegisterResponse> dataRegister = [];
  RxBool obsPassword = true.obs;
  var isRegisterLoading = false.obs;
  var message = "".obs;
  var success = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  toogeObscure() {
    obsPassword.value == true ? obsPassword(false) : obsPassword(true);
  }

  Future<void> register(param) async {
    isRegisterLoading(true);
    var response = await configDio(
      baseUrl: UrlAccess.baseUrl,
      endPoint: UrlAccess.register,
      param: param,
      mode: "post_raw",
    );

    if (response!.statusCode! < 300) {
      var res = RegisterResponse.fromJson(jsonDecode(response.toString()));
      dataRegister.add(res);
      success(true);
      message(res.message);
    } else {
      success(false);
      message("Pastikan data yang anda kirimakan benar");
    }

    Future.delayed(Duration(seconds: 2))
        .then((value) => isRegisterLoading(false));
  }
}
