import 'package:book_management_mobile/ui/base/home/home_screen.dart';
import 'package:book_management_mobile/ui/base/profiles/profile_screen.dart';
import 'package:book_management_mobile/ui/base/tambah_buku/tambah_buku_screen.dart';
import 'package:book_management_mobile/utils/colors.dart';
import 'package:book_management_mobile/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    TambahBukuPage(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("60-UI | $runtimeType");
    print("70-method | $runtimeType | initState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(IconlyBold.category),
            icon: Icon(IconlyLight.category),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(IconlyBold.editSquare),
            icon: Icon(IconlyLight.edit_square),
            label: 'Tambah',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(IconlyBold.profile),
            icon: Icon(IconlyLight.profile),
            label: 'Profile',
          ),
        ],
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: paragraphColor,
        selectedLabelStyle: titleSmall(primaryColor),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: whiteColor,
      ),
    );
  }
}
