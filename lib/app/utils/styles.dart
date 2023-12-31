import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:iconly/iconly.dart";

import "colors.dart";
import "text_style.dart";

BoxDecoration DecorationBorderOnly() {
  return BoxDecoration(
    color: whiteColor,
    border: Border.all(color: borderColor), // Set the border color
    borderRadius: BorderRadius.circular(8.0), // Set the border radius
  );
}

AppBar AppBarCustomPrimary(String title) {
  return AppBar(
    backgroundColor: primaryColor,
    centerTitle: false,
    toolbarHeight: 80,
    title: Text(
      title,
      style: titleLarge(whiteColor),
    ),
  );
}

AppBar AppBarPopCustomPrimary(context, String title) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(IconlyLight.arrow_left, color: whiteColor),
    ),
    backgroundColor: primaryColor,
    centerTitle: false,
    toolbarHeight: 80,
    title: Text(
      title,
      style: titleLarge(whiteColor),
    ),
  );
}

BoxShadow containerBoxShadow() {
  return const BoxShadow(
    color: Colors.black12,
    offset: Offset(0, 0.5),
    blurRadius: 0.5,
    spreadRadius: 0,
  );
}

BoxDecoration whiteContainerShadow() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [containerBoxShadow()],
  );
}

BoxDecoration decorationBorder() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: borderColor, width: 1));
}

InputDecoration InputDecorationCustom(String hintText) {
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primaryColor)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: borderColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: errorColor),
    ),
    errorStyle: bodySmall(errorColor),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: errorColor),
    ),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: borderColor)),
    // contentPadding: EdgeInsets.all(20),
    contentPadding: EdgeInsets.only(left: 14, top: 20),
    hintText: hintText,
    hintStyle: titleMedium(grayColor500),
    fillColor: whiteColor,
    filled: true,
    border:
        const OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
  );
}

InputDecoration InputDecorationCustomPencarian(String hintText) {
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primaryColor)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: borderColor),
    ),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: borderColor)),
    contentPadding: EdgeInsets.all(12),
    hintText: hintText,
    prefixIcon: Icon(
      IconlyLight.search,
      color: grayColor500,
      size: 24,
    ),
    hintStyle: titleMedium(grayColor500),
    fillColor: whiteColor,
    filled: true,
    border:
        const OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
  );
}

InputDecoration InputDecorationCustomPrefix(String hintText, IconData icon) {
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primaryColor)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: borderColor),
    ),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: borderColor)),
    contentPadding: EdgeInsets.all(12),
    hintText: hintText,
    prefixIcon: Icon(
      icon,
      color: grayColor500,
      size: 24,
    ),
    hintStyle: titleMedium(grayColor500),
    fillColor: whiteColor,
    filled: true,
    border:
        const OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
  );
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
