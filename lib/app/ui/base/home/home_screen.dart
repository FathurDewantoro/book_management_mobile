import 'package:book_management_mobile/app/controllers/home_controller.dart';
import 'package:book_management_mobile/app/controllers/profile_controller.dart';
import 'package:book_management_mobile/app/data/model/book_response.dart';
import 'package:book_management_mobile/app/ui/detail_buku/detail_buku_page.dart';
import 'package:book_management_mobile/app/utils/colors.dart';
import 'package:book_management_mobile/app/utils/size_helper.dart';
import 'package:book_management_mobile/app/utils/styles.dart';
import 'package:book_management_mobile/app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _controller = Get.put(HomeController());
  final ProfileController _profileController = Get.put(ProfileController());
  late ScrollController scrollController;

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      _controller.reachBottom(true);
      _controller
          .fetchAllBook("?page=${_controller.bookResponse!.currentPage! + 1}");
    }
  }

  GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Future<void> refreshData() async {
    // Simulating an API request or data refresh
    _controller.fetchAllBook("");
  }

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: primaryColor,
        centerTitle: false,
        title: Row(
          children: [
            Image.asset(
              'assets/images/profile.png',
              width: 55,
            ),
            const SizedBox(
              width: 6,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Text(
                      "Hi' ${_profileController.isLoadingUser.value ? "" : _profileController.listNama[0]} !",
                      style: titleLarge(whiteColor),
                    )),
                Text(
                  "Administrator",
                  style: bodySmall(whiteColor),
                )
              ],
            )
          ],
        ),
      ),
      body: RefreshIndicator(
        key: refreshIndicatorKey,
        onRefresh: refreshData,
        child: ListView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          children: [
            Obx(() => _controller.isLoadingFetchBook.isTrue
                ? Skeletonizer(
                    enabled: true,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: const CardBuku(
                              title: "Practical Modern JavaScript",
                              subtitile:
                                  "Dive into ES6 and the Future of JavaScript and another caption",
                              author: "Nicolas Bevaque"),
                        );
                      },
                    ))
                : _controller.dataLength.value == 0
                    ? SizedBox(
                        height: displayHeight(context) * 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/lottie/404.json',
                                width: displayWidth(context) * 0.5),
                            Text(
                              "Data buku tidak tersedia, silahkan tambahkan buku baru.",
                              textAlign: TextAlign.center,
                              style: bodyLarge(grayColor500),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Daftar Buku",
                            style: titleLarge(primaryColor),
                          ),
                          Text(
                            "Berikut adalah daftar buku yang ada dalam databse perpustakaan.",
                            style: bodyLarge(grayColor500),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: _controller.dataLength.value,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              Datum book =
                                  _controller.bookResponse!.data![index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return DetailBukuPage(
                                        dataBuku: book,
                                      );
                                    },
                                  ));
                                },
                                child: CardBuku(
                                    title: book.title ?? "-",
                                    subtitile: book.subtitle ?? "-",
                                    author: book.author ?? "-"),
                              );
                            },
                          ),
                          _controller.loadingScrollDown.value
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Center(
                                      child: LoadingAnimationWidget
                                          .threeArchedCircle(
                                        color: primaryColor,
                                        size: 28,
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ))
          ],
        ),
      ),
    );
  }
}

class CardBuku extends StatelessWidget {
  final String title;
  final String subtitile;
  final String author;
  const CardBuku(
      {super.key,
      required this.title,
      required this.subtitile,
      required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: decorationBorder(),
      child: Row(
        children: [
          const Icon(
            IconlyLight.paper,
            color: primaryColor,
            size: 28,
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: displayWidth(context) * 0.72,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: titleSmall(grayColor900),
                ),
                Text(
                  subtitile,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: bodyLarge(grayColor500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Author : $author",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: bodyLarge(grayColor500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
