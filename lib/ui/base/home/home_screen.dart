import 'package:book_management_mobile/ui/detail_buku/detail_buku_page.dart';
import 'package:book_management_mobile/utils/colors.dart';
import 'package:book_management_mobile/utils/size_helper.dart';
import 'package:book_management_mobile/utils/styles.dart';
import 'package:book_management_mobile/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            SizedBox(
              width: 6,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi' Fathur !",
                  style: titleLarge(whiteColor),
                ),
                Text(
                  "Administrator",
                  style: bodySmall(whiteColor),
                )
              ],
            )
          ],
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        children: [
          Text(
            "Daftar Buku",
            style: titleLarge(primaryColor),
          ),
          Text(
            "Berikut adalah daftar buku yang ada dalam databse perpustakaan.",
            style: bodyLarge(grayColor500),
          ),
          SizedBox(
            height: 20,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DetailBukuPage();
                    },
                  ));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(14),
                  decoration: decorationBorder(),
                  child: Row(
                    children: [
                      Icon(
                        IconlyLight.paper,
                        color: primaryColor,
                        size: 28,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.72,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Practical Modern JavaScript",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: titleSmall(grayColor900),
                            ),
                            Text(
                              "Dive into ES6 and the Future of JavaScript and another caption",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: bodyLarge(grayColor500),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Author : Nicolas Bevaque",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: bodyLarge(grayColor500),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
