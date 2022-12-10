import 'package:sandwech/presentation/open_screen/open_screen.dart';
import 'package:sandwech/presentation/open_screen/binding/open_binding.dart';
import 'package:sandwech/presentation/login_screen/login_screen.dart';
import 'package:sandwech/presentation/login_screen/binding/login_binding.dart';
import 'package:sandwech/presentation/signin_screen/signin_screen.dart';
import 'package:sandwech/presentation/signin_screen/binding/signin_binding.dart';
import 'package:sandwech/presentation/category_screen/category_screen.dart';
import 'package:sandwech/presentation/category_screen/binding/category_binding.dart';
import 'package:sandwech/presentation/home_screen/home_screen.dart';
import 'package:sandwech/presentation/home_screen/binding/home_binding.dart';
import 'package:sandwech/presentation/product_screen/product_screen.dart';
import 'package:sandwech/presentation/product_screen/binding/product_binding.dart';
import 'package:sandwech/presentation/cart_screen/cart_screen.dart';
import 'package:sandwech/presentation/cart_screen/binding/cart_binding.dart';
import 'package:sandwech/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:sandwech/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String openScreen = '/open_screen';

  static String loginScreen = '/login_screen';

  static String signinScreen = '/signin_screen';

  static String categoryScreen = '/category_screen';

  static String homeScreen = '/home_screen';

  static String productScreen = '/product_screen';

  static String cartScreen = '/cart_screen';

  static String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: openScreen,
      page: () => OpenScreen(),
      bindings: [
        OpenBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: signinScreen,
      page: () => SigninScreen(),
      bindings: [
        SigninBinding(),
      ],
    ),
    GetPage(
      name: categoryScreen,
      page: () => CategoryScreen(),
      bindings: [
        CategoryBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: productScreen,
      page: () => ProductScreen(),
      bindings: [
        ProductBinding(),
      ],
    ),
    GetPage(
      name: cartScreen,
      page: () => CartScreen(),
      bindings: [
        CartBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => OpenScreen(),
      bindings: [
        OpenBinding(),
      ],
    )
  ];
}
