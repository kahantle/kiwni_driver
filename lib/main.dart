// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:get/get.dart';
import 'package:kiwni_driver/onbording/on_bording.dart';
import 'package:kiwni_driver/screens/auth/mobile_number_screen.dart';
import 'package:kiwni_driver/screens/auth/otp_screen.dart';
import 'package:kiwni_driver/screens/auth/welcome_screen.dart';
import 'package:kiwni_driver/screens/drawer/kiwni_money.dart';
import 'package:kiwni_driver/screens/drawer/performance.dart';
import 'package:kiwni_driver/screens/home/home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => OnBoarding(),
        '/mobileNumberScreen': (context) => MobileNumberScreen(),
        '/verifyOtpScreen': (context) => OTPVerification(),
        '/home': (context) => HomeScreen(),
        '/performance': (context) => Performance(),
        '/kiwniMoney': (context) => const KiwniMoney(),
        '/welcomeScreen':(context)=> WelcomeScreen(),

      },
      title: 'Kiwni User App',
      theme: ThemeData(
        dividerColor: Colors.transparent,
        primaryColor: const Color(0xff1db874),
      ),
    );
  }
}
