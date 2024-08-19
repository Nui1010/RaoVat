import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:nhom4_appraovat/CategoriesWidget.dart';
import 'package:nhom4_appraovat/ItemsWidget.dart';
import 'package:nhom4_appraovat/Search_product.dart';
import 'package:nhom4_appraovat/account_page.dart';
import 'package:nhom4_appraovat/ad_detail_page.dart';
import 'package:nhom4_appraovat/main_nav.dart';
import 'package:nhom4_appraovat/shopping_cart_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  bool isLogin = await checkLoginStatus();
  runApp(MyApp(isLogin:isLogin));
}
Future<bool> checkLoginStatus() async {
  final logindata = await SharedPreferences.getInstance();
  bool isLogin = logindata.getBool('login') ?? false;
  return isLogin;
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  const MyApp({super.key, required this.isLogin});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rao vặt",
      routes: {
        '/': (context) => isLogin ?const main_nav():LoginPage(),
      },
      builder: FlutterSmartDialog.init(),
    );
  }
}

