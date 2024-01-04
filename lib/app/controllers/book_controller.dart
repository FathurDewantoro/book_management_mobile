import 'dart:convert';

import 'package:book_management_mobile/app/data/model/tambah_buku_response.dart';
import 'package:book_management_mobile/app/data/shared/shared_preferences.dart';
import 'package:book_management_mobile/app/service/api/dio_client.dart';
import 'package:book_management_mobile/app/service/api/url_access.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  late TambahBukuResponse dataResponseBuku;
  var isLoadingAdd = false.obs;
  var isLoadingEdit = false.obs;
  var isLoadingDelete = false.obs;
  var successAdd = false.obs;
  var successEdit = false.obs;
  var successDelete = false.obs;
  var message = "".obs;

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

  addBook(param) async {
    isLoadingAdd(true);
    var token = await MySharedPreferences().readToken();
    var response = await configDio(
        baseUrl: UrlAccess.baseUrl,
        endPoint: UrlAccess.addBook,
        param: param,
        mode: "post_raw",
        token: token);

    if (response!.statusCode! < 300) {
      var res = TambahBukuResponse.fromJson(jsonDecode(response.toString()));
      dataResponseBuku = res;
      successAdd(true);
      message(res.message);
    } else {
      successAdd(false);
      print("70 Response Server ${response.data.toString()}");
      // message(response.data["message"]);
    }

    print("70-$runtimeType Message from server : $message");

    isLoadingAdd(false);
  }

  editBook(param, id) async {
    isLoadingEdit(true);
    var token = await MySharedPreferences().readToken();
    var response = await configDio(
        baseUrl: UrlAccess.baseUrl,
        endPoint: "${UrlAccess.books}/$id/edit",
        param: param,
        mode: "put_raw",
        token: token);

    if (response!.statusCode! < 300) {
      message(response.data["message"]);
      successEdit(true);
    } else {
      message(response.data["message"]);
      successEdit(false);
    }

    print("70-_$runtimeType | Pesan dari server : $message");

    isLoadingEdit(false);
  }

  deleteBook(id) async {
    isLoadingEdit(true);
    var token = await MySharedPreferences().readToken();
    var response = await configDio(
        baseUrl: UrlAccess.baseUrl,
        endPoint: "${UrlAccess.books}/$id",
        mode: "delete",
        token: token);

    if (response!.statusCode! < 300) {
      message(response.data["message"]);
      successDelete(true);
    } else {
      message(response.data["message"]);
      successDelete(false);
    }

    print("70-_$runtimeType | Pesan dari server : $message");

    isLoadingEdit(false);
  }
}
