import 'package:book_management_mobile/ui/onboarding/onboarding_page.dart';
import 'package:book_management_mobile/utils/colors.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Management App',
      theme: ThemeData(
        primaryColor: primaryColor,
        fontFamily: 'Inter',
      ),
      home: const OnBoardingPage(),
    );
  }
}
