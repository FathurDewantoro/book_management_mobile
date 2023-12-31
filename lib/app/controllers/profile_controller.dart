import 'dart:convert';

import 'package:book_management_mobile/app/data/model/user_response.dart';
import 'package:book_management_mobile/app/data/shared/shared_preferences.dart';
import 'package:book_management_mobile/app/service/api/dio_client.dart';
import 'package:book_management_mobile/app/service/api/url_access.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  List<String> listNama = [];
  UserResponse? userResponse;
  var isLoadingUser = false.obs;
  var successUser = false.obs;
  var message = "".obs;
  @override
  void onInit() {
    fetchUser();
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

  fetchUser() async {
    isLoadingUser(true);
    var token = await MySharedPreferences().readToken();

    var response = await configDio(
      baseUrl: UrlAccess.baseUrl,
      endPoint: UrlAccess.user,
      mode: "get",
      token: token,
    );

    if (response!.statusCode! < 300) {
      var res = UserResponse.fromJson(jsonDecode(response.toString()));
      successUser(true);
      userResponse = res;
      listNama = userResponse!.name.split(" ");
    } else {
      successUser(false);
      message(response.data["message"]);
    }

    isLoadingUser(false);
  }

  logout() async {
    var token = await MySharedPreferences().readToken();
    var response = await configDio(
      baseUrl: UrlAccess.baseUrl,
      endPoint: UrlAccess.logout,
      mode: "delete",
      token: token,
    );

    if (response!.statusCode! < 300) {
      message("Berhasil logout");
    }

    await MySharedPreferences().deleteToken();
  }
}
