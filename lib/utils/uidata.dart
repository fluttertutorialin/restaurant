import 'dart:ui';
import 'package:flutter/material.dart';

class UIData {
  //routes
  static const String SplashScreenRoute = "/splash_screen";
  static const String loginRoute = "/login";
  static const String signUpRoute = "/signup";
  static const String forgotPasswordRoute = "/forgot_password";
  static const String pinRoute = "/pinRoute";
  static const String dashboardRoute = "/dashboardRoute";
  static const String contactRoute = "/contact";

  static const String postPonReasonRoute = "/postpon_reason";
  static const String dashBoardRoute = "/dashboard";
  static const String profileRoute = "/profile";

  static const String webSiteRoute = "/website";

  //strings
  static const String appName = "Restaurant";

  //NETWORK
  static const String msgLogin404 = "Invalid mobile or password";
  static const String msgNoData = "Data not available";
  static const String msg500 = "Internal server error";

  static const int resCode404 = 404;
  static const int resCode200 = 200;
  static const int resCode400 = 400;
  static const int resCode300 = 300;
  static const int resCode500 = 500;

  static const String forgot_password = "Forgot Password?";
  static const String something_went_wrong = "Something went wrong";
  static const String coming_soon = "Coming Soon";

  //login
  static const String enter_code_label = "Phone Number";
  static const String enter_code_hint = "10 Digit Phone Number";
  static const String enter_otp_label = "OTP";
  static const String enter_otp_hint = "4 Digit OTP";
  static const String get_otp = "Get OTP";
  static const String resend_otp = "Resend OTP";
  static const String login = "Login";
  static const String enter_valid_number = "Enter 10 digit phone number";
  static const String enter_valid_otp = "Enter 4 digit otp";

  //fonts
  static const String quickFont = "Quicksand";
  static const String ralewayFont = "Raleway";

  //images
  static const String imageDir = "assets/images";
  static const String pkImage = "$imageDir/pk.jpg";

  static const String profileImage = "$imageDir/profile.jpg";
  static const String blankImage = "$imageDir/blank.jpg";
  static const String dashboardImage = "$imageDir/dashboard.jpg";
  static const String loginImage = "$imageDir/login.jpg";
  static const String paymentImage = "$imageDir/payment.jpg";
  static const String settingsImage = "$imageDir/setting.jpeg";
  static const String shoppingImage = "$imageDir/shopping.jpeg";
  static const String timelineImage = "$imageDir/timeline.jpeg";
  static const String verifyImage = "$imageDir/verification.jpg";

  //colors
  static List<Color> kitGradients = [
    Colors.orangeAccent,
    Colors.black26,
  ];

  static List<Color> kitGradientsBackground = [
    Colors.orangeAccent,
    Colors.black26,
  ];

  static List<Color> kitGradients2 = [Colors.white, Colors.white];

  static String validateMobile(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.replaceAll(" ", "").isEmpty) {
      return "Mobile is required";
    } else if (value.replaceAll(" ", "").length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value.replaceAll(" ", ""))) {
      return "Mobile number must be digits";
    }
    return null;
  }

  static String validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "Name is required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  static String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "Email is required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid email";
    } else {
      return null;
    }
  }

  static String validatePassword(String value) {
    if (value.isEmpty) {
      return "Password is required";
    } else if (value.length < 4) {
      return 'Password must be at least 4 characters.';
    }
    return null;
  }
}
