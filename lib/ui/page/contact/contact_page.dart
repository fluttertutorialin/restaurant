import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/ui/page/contact/contact_widget.dart';
import 'package:restaurant/ui/widgets/login_background.dart';
import 'package:restaurant/ui/widgets/scaffold.dart';

class ContactPage extends StatelessWidget {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  Widget bodyData() => Stack(
    fit: StackFit.expand,
    children: <Widget>[
      LoginBackground(
        showIcon: true,
      ),
      ContactWidget(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return _scaffold();
  }

  Widget _scaffold() => CommonScaffold(
    backGroundColor: Colors.grey.shade100,
    actionFirstIcon: null,
    appTitle: "Contact Us",
    scaffoldKey: _scaffoldState,
    bodyData: bodyData(),
  );
}
