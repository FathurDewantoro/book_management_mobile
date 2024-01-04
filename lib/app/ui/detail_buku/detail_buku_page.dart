import 'package:book_management_mobile/app/controllers/book_controller.dart';
import 'package:book_management_mobile/app/data/model/book_response.dart';
import 'package:book_management_mobile/app/ui/edit_buku/edit_buku_page.dart';
import 'package:book_management_mobile/app/utils/colors.dart';
import 'package:book_management_mobile/app/utils/my_elevated_button.dart';
import 'package:book_management_mobile/app/utils/pop_up_custom.dart';
import 'package:book_management_mobile/app/utils/size_helper.dart';
import 'package:book_management_mobile/app/utils/styles.dart';
import 'package:book_management_mobile/app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class DetailBukuPage extends StatefulWidget {
  const DetailBukuPage({super.key, required this.dataBuku});
  final Datum dataBuku;

  @override
  State<DetailBukuPage> createState() => _DetailBukuPageState();
}

class _DetailBukuPageState extends State<DetailBukuPage> {
  BookController controller = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBarPopCustomPrimary(context, "Detail Buku"),
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        children: [
          Text(
            widget.dataBuku.title ?? "-",
            style: titleSmall(grayColor900),
          ),
          Text(
            widget.dataBuku.subtitle ?? "-",
            style: bodyLarge(grayColor500),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Detail Buku",
            style: titleSmall(grayColor900),
          ),
          Text(
            "Author :  ${widget.dataBuku.author ?? "-"} ",
            style: bodyLarge(grayColor500),
          ),
          Text(
            "Publisher : ${widget.dataBuku.publisher ?? "-"}",
            style: bodyLarge(grayColor500),
          ),
          Text(
            "Published : ${widget.dataBuku.published ?? "-"}",
            style: bodyLarge(grayColor500),
          ),
          Text(
            "ISBN :  ${widget.dataBuku.isbn ?? "-"}",
            style: bodyLarge(grayColor500),
          ),
          Text(
            "Page :  ${widget.dataBuku.pages ?? "-"}",
            style: bodyLarge(grayColor500),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Deskripsi",
            style: titleSmall(grayColor900),
          ),
          Text(
            widget.dataBuku.description ?? "-",
            style: bodyLarge(grayColor500),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Website",
            style: titleSmall(grayColor900),
          ),
          Row(
            children: [
              const Icon(IconlyLight.paper),
              const SizedBox(
                width: 6,
              ),
              SizedBox(
                width: displayWidth(context) * 0.8,
                child: Text(
                  widget.dataBuku.website ?? "-",
                  style: bodyLarge(secondaryColor),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 180,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.all(0),
        width: displayWidth(context),
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: whiteColor,
            border: Border(
              top: BorderSide(
                color:
                    borderColor, // Adjust the border color // Adjust the border width
              ),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return EditBukuPage(
                        dataBuku: widget.dataBuku,
                      );
                    },
                  ));
                },
                width: displayWidth(context) * 0.7,
                borderRadius: BorderRadius.circular(8),
                height: 50,
                child: Text(
                  "Edit Buku",
                  style: titleButton(whiteColor),
                )),
            MyElevatedButton(
                onPressed: () {
                  controller.deleteBook(widget.dataBuku.id).then((value) {
                    controller.successDelete.isTrue
                        ? alertSuccess(context,
                            title: "Berhasil",
                            subtitle:
                                "Anda berhasil menghapus buku ${widget.dataBuku.title ?? ""}")
                        : alertError(context,
                            title: "Gagal", subtitle: "Gagal menghapus buku.");
                  });
                },
                color: errorColor,
                width: displayWidth(context) * 0.2,
                borderRadius: BorderRadius.circular(8),
                height: 50,
                child: Icon(
                  IconlyLight.delete,
                  color: whiteColor,
                )),
          ],
        ),
      ),
    );
  }
}
