import 'dart:convert';

import 'package:book_management_mobile/app/data/model/login_response.dart';
import 'package:book_management_mobile/app/data/shared/shared_preferences.dart';
import 'package:book_management_mobile/app/service/api/dio_client.dart';
import 'package:book_management_mobile/app/service/api/url_access.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  List<LoginResponse> dataLogin = [];
  var isLoadingLogin = false.obs;
  var message = "".obs;
  var success = false.obs;
  RxBool obsPassword = true.obs;

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

  Future login(param) async {
    isLoadingLogin(true);
    var response = await configDio(
      baseUrl: UrlAccess.baseUrl,
      endPoint: UrlAccess.login,
      param: param,
      mode: "post_raw",
    );

    if (response!.statusCode! < 300) {
      var res = LoginResponse.fromJson(jsonDecode(response.toString()));
    success(true);
      message(res.message);
      await MySharedPreferences().saveToken(res.token);
    } else {
      success(false);
      message(response.data["message"]);
    }

    isLoadingLogin(false);
  }
}
