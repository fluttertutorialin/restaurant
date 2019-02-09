import 'package:flutter/material.dart';
import 'package:restaurant/ui/page/contact/contact_page.dart';
import 'package:restaurant/ui/page/dashboard/dashboard_page.dart';
import 'package:restaurant/ui/page/forgotpassword/forgot_password_page.dart';
import 'package:restaurant/ui/page/login/login_page.dart';
import 'package:restaurant/ui/page/pin/pin_page.dart';
import 'package:restaurant/ui/page/signup/signup_page.dart';
import 'package:restaurant/ui/page/splashscreen/splash_screen_page.dart';
import 'package:restaurant/utils/uidata.dart';

class RestaurantApp extends StatelessWidget {
  final materialApp = MaterialApp(
      title: UIData.appName,
      theme: ThemeData(
          //buttonColor: Colors.white,
          brightness: Brightness.light,
          accentColor: Colors.orange,
          primaryColor: Colors.orangeAccent,
          primarySwatch: Colors.orange,
          fontFamily: UIData.quickFont),
      initialRoute: '/',

      //routes
      routes: <String, WidgetBuilder>{
        '/': (context) => SplashScreenPage(),
        UIData.SplashScreenRoute: (BuildContext context) => SplashScreenPage(),
        UIData.loginRoute: (BuildContext context) => LoginPage(),
        UIData.signUpRoute: (BuildContext context) => SignUpPage(),
        UIData.forgotPasswordRoute: (BuildContext context) =>
            ForgotPasswordPage(),
        UIData.pinRoute: (BuildContext context) => PinPage(),
        UIData.dashboardRoute: (BuildContext context) => DashboardPage(),
        UIData.contactRoute: (BuildContext context) => ContactPage(),
      });

  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}
