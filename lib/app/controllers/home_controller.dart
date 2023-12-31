import 'dart:convert';

import 'package:book_management_mobile/app/data/model/book_response.dart';
import 'package:book_management_mobile/app/data/shared/shared_preferences.dart';
import 'package:book_management_mobile/app/service/api/dio_client.dart';
import 'package:book_management_mobile/app/service/api/url_access.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  BookResponse? bookResponse;
  var isLoadingFetchBook = false.obs;
  var message = "".obs;
  var success = false.obs;
  var reachBottom = false.obs;
  var loadingScrollDown = false.obs;
  var dataLength = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllBook("");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchAllBook(String? path) async {
    bookResponse == null || path == ""
        ? isLoadingFetchBook(true)
        : loadingScrollDown(true);
    var token = await MySharedPreferences().readToken();

    var response = await configDio(
      baseUrl: UrlAccess.baseUrl,
      endPoint: "${UrlAccess.books}${path ?? ""}",
      mode: "get",
      token: token,
    );

    if (response!.statusCode! < 300) {
      var res = BookResponse.fromJson(jsonDecode(response.toString()));

      success(true);
      if (bookResponse == null) {
        bookResponse = res;
        print("70$runtimeType Panjang Buku : ${bookResponse!.data?.length}");
        dataLength(bookResponse!.data?.length);
      } else if (path == "") {
        bookResponse = null;
        bookResponse = res;
        dataLength(0);
        dataLength(bookResponse!.data?.length);
        print("70$runtimeType Panjang Buku : ${bookResponse!.data?.length}");
      } else {
        for (var element in res.data!) {
          bookResponse!.data!.add(element);
        }
        bookResponse!.currentPage = res.currentPage;
        dataLength(bookResponse!.data?.length);
        print("70$runtimeType Panjang Buku : ${bookResponse!.data?.length}");
      }
    } else {
      success(false);
      message(response.data["message"]);
    }

    isLoadingFetchBook(false);
    loadingScrollDown(false);
  }
}
