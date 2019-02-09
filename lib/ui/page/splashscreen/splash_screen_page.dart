import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/ui/page/login/login_page.dart';
import 'package:restaurant/utils/uidata.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage> {
  Duration five;
  Timer t2;
  String routeName;

  @override
  void initState() {
    super.initState();
    five = const Duration(seconds: 3);
    t2 = new Timer(five, () {
      navigation();
    });
  }

  @override
  void dispose() {
    if (this.mounted) super.dispose();
    t2.cancel();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return new Scaffold(
      body:
      Container(
        decoration: BoxDecoration(
          color: Colors.orange,
        ),
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text("RESTAURANT",  style: TextStyle(
              color: Colors.white,
              fontSize: 45.0,
              fontWeight: FontWeight.bold)),
        ),
      )


    );
  }

  navigation() async {
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (BuildContext context) => new LoginPage()));
  }
}
