import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'colors.dart';
import 'my_elevated_button.dart';
import 'size_helper.dart';
import 'text_style.dart';

Future<dynamic> alertSuccess(context, {required title, required subtitle}) {
  return showDialog(
    // barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: AlertDialog(
          backgroundColor: whiteColor,
          surfaceTintColor: whiteColor,
          title: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: Lottie.asset(
                  'assets/lottie/success.json',
                  repeat: false,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: titleLarge(grayColor900),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<dynamic> alertError(context, {required title, required subtitle}) {
  return showDialog(
    // barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: AlertDialog(
          backgroundColor: whiteColor,
          surfaceTintColor: whiteColor,
          title: Column(
            children: [
              Container(
                width: displayWidth(context),
                height: 100,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: Lottie.asset('assets/lottie/error.json',
                    fit: BoxFit.contain),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: titleLarge(grayColor900),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showPopupFailed(BuildContext context, String title, String subtitle) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: whiteColor,
        surfaceTintColor: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Adjust the border radius
        ),
        contentPadding: EdgeInsets.all(20),
        content: Container(
          width: displayWidth(context),
          height: 210,
          decoration: BoxDecoration(color: whiteColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: errorColor50, width: 5),
                    color: errorColor100,
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  CupertinoIcons.exclamationmark_circle,
                  color: errorColor,
                  size: 30,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                title,
                style: titleLarge(grayColor900),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                subtitle,
                style: bodyLarge(grayColor500),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      );
    },
  );
}

void showPopUpLogout(BuildContext context, String title, String subtitle) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: whiteColor,
        surfaceTintColor: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Adjust the border radius
        ),
        contentPadding: EdgeInsets.all(20),
        content: Container(
          width: displayWidth(context),
          height: 300,
          decoration: BoxDecoration(color: whiteColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: displayWidth(context),
                height: 100,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: Lottie.asset('assets/lottie/error.json',
                    fit: BoxFit.contain),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                title,
                style: titleLarge(grayColor900),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                subtitle,
                style: bodyLarge(grayColor500),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              MyElevatedButton(
                onPressed: () {
                  //Navigator.pop(context, Constants.top);
                },
                child: Text(
                  "Keluar",
                  style: titleButton(whiteColor),
                ),
                height: 50,
                color: errorColor500,
                borderRadius: BorderRadius.circular(8),
                width: displayWidth(context),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: displayWidth(context),
                height: 50,
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    "Cancel",
                    style: titleButton(grayColor900),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
