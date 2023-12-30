import 'package:book_management_mobile/utils/colors.dart';
import 'package:book_management_mobile/utils/my_elevated_button.dart';
import 'package:book_management_mobile/utils/size_helper.dart';
import 'package:book_management_mobile/utils/styles.dart';
import 'package:book_management_mobile/utils/text_style.dart';
import 'package:flutter/material.dart';

class TambahBukuPage extends StatefulWidget {
  const TambahBukuPage({super.key});

  @override
  State<TambahBukuPage> createState() => _TambahBukuPageState();
}

class _TambahBukuPageState extends State<TambahBukuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBarCustomPrimary("Tambah Buku"),
      body: ListView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        children: [
          Text(
            "Formulir Tambah Buku",
            style: titleLarge(primaryColor),
          ),
          Text(
            "Isi semua data sesuai dengan formulir yang tersedia.",
            style: bodyLarge(grayColor500),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: displayWidth(context),
            child: const Text(
              'ISBN',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 13),
            decoration: InputDecorationCustom("ISBN"),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: displayWidth(context),
            child: const Text(
              'Title',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 13),
            decoration: InputDecorationCustom("Title"),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: displayWidth(context),
            child: const Text(
              'Subtitle',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 13),
            decoration: InputDecorationCustom("Subtitle"),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: displayWidth(context),
            child: const Text(
              'Author',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 13),
            decoration: InputDecorationCustom("Author"),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: displayWidth(context),
            child: const Text(
              'Published',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 13),
            decoration: InputDecorationCustom("Published"),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: displayWidth(context),
            child: const Text(
              'Publisher',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 13),
            decoration: InputDecorationCustom("Publisher"),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: displayWidth(context),
            child: const Text(
              'Pages',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 13),
            decoration: InputDecorationCustom("Pages"),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: displayWidth(context),
            child: const Text(
              'Website',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 13),
            decoration: InputDecorationCustom("Website"),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: displayWidth(context),
            child: const Text(
              'Deksripsi',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 13),
            minLines: 5,
            maxLines: 10,
            decoration: InputDecorationCustom("Deksripsi"),
          ),
          const SizedBox(height: 20),
          MyElevatedButton(
              onPressed: () {},
              borderRadius: BorderRadius.circular(10),
              child: Text(
                "Simpan",
                style: titleButton(whiteColor),
              ),
              height: 50),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
