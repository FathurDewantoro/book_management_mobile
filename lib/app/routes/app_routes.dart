import 'package:book_management_mobile/app/bindings/login_binding.dart';
import 'package:book_management_mobile/app/bindings/register_binding.dart';
import 'package:book_management_mobile/app/ui/base/base_page.dart';
import 'package:book_management_mobile/app/ui/loading/loading_add_book_page.dart';
import 'package:book_management_mobile/app/ui/login/login_page.dart';
import 'package:book_management_mobile/app/ui/onboarding/onboarding_page.dart';
import 'package:book_management_mobile/app/ui/register/register_page.dart';
import 'package:book_management_mobile/app/ui/splash/splash_page.dart';
import 'package:get/get.dart';

class Routes {
  static String onboarding = "/onboarding";
  static String splashScreen = "/splashScreen";
  static String login = "/login";
  static String register = "/register";
  static String base = "/base";
  static String home = "/home";
  static String add = "/add";
  static String profile = "/profile";
  static String detail = "/detail";
  static String edit = "/edit";
  static String loadingAddBook = "/loadingAddBook";
}

final getPages = [
  GetPage(
    name: Routes.loadingAddBook,
    page: () => LoadingAddBookPage(),
  ),
  GetPage(
    name: Routes.splashScreen,
    page: () => SplashPage(),
  ),
  GetPage(
    name: Routes.onboarding,
    page: () => OnBoardingPage(),
  ),
  GetPage(
    name: Routes.login,
    page: () => LoginPage(),
    binding: LoginBinding(),
  ),
  GetPage(
      name: Routes.register,
      page: () => RegisterPage(),
      binding: RegisterBinding()),
  GetPage(
    name: Routes.base,
    page: () => BasePage(),
  ),
];
