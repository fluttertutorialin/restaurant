import 'package:flutter/material.dart';
import 'package:restaurant/restaurantapp.dart';
import 'package:restaurant/ui/page/login/login_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  RestaurantApp(),
    );
  }
}