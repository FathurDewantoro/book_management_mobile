import 'package:book_management_mobile/app/controllers/book_controller.dart';
import 'package:book_management_mobile/app/data/model/book_response.dart';
import 'package:book_management_mobile/app/utils/button_off.dart';
import 'package:book_management_mobile/app/utils/colors.dart';
import 'package:book_management_mobile/app/utils/my_elevated_button.dart';
import 'package:book_management_mobile/app/utils/pop_up_custom.dart';
import 'package:book_management_mobile/app/utils/size_helper.dart';
import 'package:book_management_mobile/app/utils/styles.dart';
import 'package:book_management_mobile/app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EditBukuPage extends StatefulWidget {
  const EditBukuPage({super.key, required this.dataBuku});
  final Datum dataBuku;

  @override
  State<EditBukuPage> createState() => _EditBukuPageState();
}

class _EditBukuPageState extends State<EditBukuPage> {
  BookController controller = Get.put(BookController());

  TextEditingController isbnC = TextEditingController();
  TextEditingController titleC = TextEditingController();
  TextEditingController subtitleC = TextEditingController();
  TextEditingController authorC = TextEditingController();
  TextEditingController publishedC = TextEditingController();
  TextEditingController publisherC = TextEditingController();
  TextEditingController pagesC = TextEditingController();
  TextEditingController websiteC = TextEditingController();
  TextEditingController deskripsiC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setValueTextEditingController();
  }

  setValueTextEditingController() {
    isbnC.text = widget.dataBuku.isbn ?? "";
    titleC.text = widget.dataBuku.title ?? "";
    subtitleC.text = widget.dataBuku.subtitle ?? "";
    authorC.text = widget.dataBuku.author ?? "";
    publishedC.text = widget.dataBuku.published.toString();
    publisherC.text = widget.dataBuku.publisher ?? "";
    pagesC.text = widget.dataBuku.pages.toString();
    websiteC.text = widget.dataBuku.website ?? "";
    deskripsiC.text = widget.dataBuku.description ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBarPopCustomPrimary(context, "Edit Buku"),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        children: [
          Text(
            "Formulir Edit Buku",
            style: titleLarge(primaryColor),
          ),
          Text(
            "Isi semua data sesuai dengan formulir yang tersedia.",
            style: bodyLarge(grayColor500),
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
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
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 16),
                      decoration: InputDecorationCustom("ISBN"),
                      controller: isbnC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Form tidak boleh kosong';
                        }
                        return null;
                      }),
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
                      style: const TextStyle(fontSize: 16),
                      decoration: InputDecorationCustom("Title"),
                      controller: titleC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Form tidak boleh kosong';
                        }
                        return null;
                      }),
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
                      style: const TextStyle(fontSize: 16),
                      decoration: InputDecorationCustom("Subtitle"),
                      controller: subtitleC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Form tidak boleh kosong';
                        }
                        return null;
                      }),
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
                      style: const TextStyle(fontSize: 16),
                      decoration: InputDecorationCustom("Author"),
                      controller: authorC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Form tidak boleh kosong';
                        }
                        return null;
                      }),
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
                      style: const TextStyle(fontSize: 16),
                      decoration: InputDecorationCustom("Published"),
                      controller: publishedC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Form tidak boleh kosong';
                        }
                        return null;
                      }),
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
                      style: const TextStyle(fontSize: 16),
                      decoration: InputDecorationCustom("Publisher"),
                      controller: publisherC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Form tidak boleh kosong';
                        }
                        return null;
                      }),
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
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 16),
                      decoration: InputDecorationCustom("Pages"),
                      controller: pagesC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Form tidak boleh kosong';
                        }
                        return null;
                      }),
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
                      style: const TextStyle(fontSize: 16),
                      decoration: InputDecorationCustom("Website"),
                      controller: websiteC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Form tidak boleh kosong';
                        }
                        return null;
                      }),
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
                      keyboardType: TextInputType.multiline,
                      style: const TextStyle(fontSize: 16),
                      minLines: 5,
                      maxLines: 10,
                      decoration: InputDecorationCustom("Deksripsi"),
                      controller: deskripsiC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Form tidak boleh kosong';
                        }
                        return null;
                      }),
                ],
              )),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          Obx(() => controller.isLoadingEdit.value
              ? ButtonOff(
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.threeArchedCircle(
                      color: Colors.white,
                      size: 26,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Menyimpan data",
                      style: titleButton(whiteColor),
                    )
                  ],
                ))
              : MyElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      saveData();
                    }
                  },
                  borderRadius: BorderRadius.circular(10),
                  height: 50,
                  child: Text(
                    "Simpan Perubahan",
                    style: titleButton(whiteColor),
                  ))),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void saveData() async {
    var param = {
      "isbn": isbnC.text,
      "title": titleC.text,
      "subtitle": subtitleC.text,
      "author": authorC.text,
      "published": publishedC.text,
      "publisher": publisherC.text,
      "pages": int.parse(pagesC.text),
      "description": deskripsiC.text,
      "website": websiteC.text
    };

    await controller.editBook(param, widget.dataBuku.id).then((value) {
      if (controller.successEdit.isTrue) {
        alertSuccess(context,
            title: "Berhasil",
            subtitle: "Data buku berhasil disimpan di dalam sistem.");
      } else {
        alertError(context, title: "Error", subtitle: controller.message.value);
      }
    });
  }
}
