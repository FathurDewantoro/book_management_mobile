import 'package:book_management_mobile/ui/edit_buku/edit_buku_page.dart';
import 'package:book_management_mobile/utils/colors.dart';
import 'package:book_management_mobile/utils/my_elevated_button.dart';
import 'package:book_management_mobile/utils/size_helper.dart';
import 'package:book_management_mobile/utils/styles.dart';
import 'package:book_management_mobile/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class DetailBukuPage extends StatefulWidget {
  const DetailBukuPage({super.key});

  @override
  State<DetailBukuPage> createState() => _DetailBukuPageState();
}

class _DetailBukuPageState extends State<DetailBukuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBarPopCustomPrimary(context, "Detail Buku"),
      body: ListView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        children: [
          Text(
            "Practical Modern JavaScript",
            style: titleSmall(grayColor900),
          ),
          Text(
            "Dive into ES6 and the Future of JavaScript",
            style: bodyLarge(grayColor500),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Detail Buku",
            style: titleSmall(grayColor900),
          ),
          Text(
            "Author :  Nicolás Bevacqua",
            style: bodyLarge(grayColor500),
          ),
          Text(
            "Publisher : Pt. Publikasi",
            style: bodyLarge(grayColor500),
          ),
          Text(
            "Published : 12 Mei 2022",
            style: bodyLarge(grayColor500),
          ),
          Text(
            "ISBN :  9234789128",
            style: bodyLarge(grayColor500),
          ),
          Text(
            "Page :  1",
            style: bodyLarge(grayColor500),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Deskripsi",
            style: titleSmall(grayColor900),
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nec ex neque. Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi tincidunt leo vel urna aliquam, lacinia condimentum enim rhoncus. Fusce venenatis, dolor id mollis porttitor, nisi lacus efficitur quam, vel sodales lectus mi quis diam. Vestibulum in erat vel nisi venenatis egestas. Duis luctus vitae purus ut rhoncus. Nulla tincidunt volutpat justo a tincidunt. In rhoncus gravida lectus, non gravida libero luctus nec.",
            style: bodyLarge(grayColor500),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Website",
            style: titleSmall(grayColor900),
          ),
          Row(
            children: [
              Icon(IconlyLight.paper),
              SizedBox(
                width: 6,
              ),
              SizedBox(
                width: displayWidth(context) * 0.8,
                child: Text(
                  "https://github.com/mjavascript/practical-modern-javascript",
                  style: bodyLarge(secondaryColor),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 180,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.all(0),
        width: displayWidth(context),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: whiteColor,
            border: Border(
              top: BorderSide(
                color:
                    borderColor, // Adjust the border color // Adjust the border width
              ),
            )),
        child: MyElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return EditBukuPage();
                },
              ));
            },
            child: Text(
              "Edit Buku",
              style: titleButton(whiteColor),
            ),
            width: displayWidth(context),
            borderRadius: BorderRadius.circular(8),
            height: 50),
      ),
    );
  }
}
