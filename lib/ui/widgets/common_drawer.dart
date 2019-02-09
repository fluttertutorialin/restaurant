import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restaurant/ui/widgets/profile_tile.dart';
import 'package:restaurant/utils/uidata.dart';

class CommonDrawer extends StatefulWidget {
  final mobile, userName, loginDateTime;

  CommonDrawer({this.mobile, this.userName, this.loginDateTime});

  @override
  CommonDrawerState createState() {
    return new CommonDrawerState();
  }
}

class CommonDrawerState extends State<CommonDrawer> {
  String mobile, userName, profilePath;
  File _image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        ClipPath(
          clipper: CustomDrawerClipper(),
          child: Material(
            child: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      UserAccountsDrawerHeader(
                        accountName: Text("Username: " + widget.userName,
                            style: new TextStyle(
                                fontSize: 14.0, color: Colors.white)),
                        accountEmail: Text("Mobile: " + widget.mobile,
                            style: new TextStyle(
                                fontSize: 14.0, color: Colors.white)),
                        currentAccountPicture: _image == null
                            ? new CircleAvatar(
                                backgroundImage: new ExactAssetImage(
                                    'assets/images/user_profile.png'))
                            : new CircleAvatar(
                                backgroundImage: new FileImage(_image)),
                      ),
                      new ListTile(
                          title: Text(
                            "Home",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18.0),
                          ),
                          leading: Icon(
                            Icons.home,
                            color: Colors.blue,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          }),
                      new ListTile(
                          title: Text(
                            "Your Order",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18.0),
                          ),
                          leading: Icon(
                            Icons.shopping_cart,
                            color: Colors.green,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, UIData.profileRoute);
                          }),
                      new ListTile(
                          title: Text(
                            "Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18.0),
                          ),
                          leading: Icon(
                            Icons.person,
                            color: Colors.red,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, UIData.dashBoardRoute);
                          }),
                      new ListTile(
                          title: Text(
                            "About Us",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18.0),
                          ),
                          leading: Icon(
                            Icons.archive,
                            color: Colors.cyan,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, UIData.contactRoute);
                          }),
                      new ListTile(
                          title: Text(
                            "Contact Us",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18.0),
                          ),
                          leading: Icon(
                            Icons.contacts,
                            color: Colors.orangeAccent,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, UIData.contactRoute);
                          }),
                      Divider(),
                      new ListTile(
                          title: Text(
                            "Logout",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18.0),
                          ),
                          leading: Icon(
                            Icons.vpn_key,
                            color: Colors.red,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            logoutNavigation(context);
                          }),
                      Divider(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        FractionalTranslation(
          translation: Offset(-0.24, 0.0),
         /* child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Material(
                elevation: 5.0,
                type: MaterialType.circle,
                color: Colors.transparent,
                child: Icon(
                  Icons.close,
                  color: Colors.orangeAccent,
                  size: 30.0,
                ),
              ),
            ),
          ),*/
        ),
      ],
    );
  }

  goToLogoutDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    successLogout(),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FloatingActionButton(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.clear,
                              color: Colors.black,
                              size: 30.0,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ]),
                  ],
                ),
              ),
            ));
  }

  successLogout() => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Material(
          clipBehavior: Clip.antiAlias,
          elevation: 2.0,
          borderRadius: BorderRadius.circular(4.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ProfileTile(
                  title: "Logout",
                  textColor: Colors.black,
                  subtitle: "Are you sure want to logout?",
                ),
                ListTile(
                  title: Text(widget.userName,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.normal)),
                  subtitle: Text("Login date time : " + widget.loginDateTime,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.normal)),
                  trailing: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                        "https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg"),
                  ),
                ),
                Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                    width: double.infinity,
                    child: RaisedButton(
                        elevation: 0.0,
                        splashColor: Colors.redAccent,
                        padding: EdgeInsets.all(12.0),
                        shape: StadiumBorder(),
                        child: Text(
                          "Logout",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontFamily: 'Raleway'),
                        ),
                        color: Colors.red,
                        onPressed: () {
                          logoutNavigation(context);
                        }))
              ],
            ),
          ),
        ),
      );
}

logoutNavigation(BuildContext context) async {
  Navigator.of(context).pushNamedAndRemoveUntil(
      UIData.loginRoute, (Route<dynamic> route) => false);
}

class CustomDrawerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height / 2 - 30);

    print(size.width);
    path.arcToPoint(
      Offset(size.width, size.height / 2 + 30),
      radius: Radius.circular(30.0),
      clockwise: false,
    );

    path.lineTo(size.width, size.height / 2 + 10.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
