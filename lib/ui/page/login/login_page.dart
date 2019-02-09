import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/ui/page/dashboard/dashboard_page.dart';
import 'package:restaurant/ui/widgets/backgroundclipper.dart';
import 'package:restaurant/ui/widgets/progressdialog.dart';
import 'package:restaurant/utils/uidata.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  bool _obscureText = true;
  String email, password;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var body =
        new Form(key: _key, autovalidate: _validate, child: loginBackground());

    return new Scaffold(
      key: scaffoldKey,
      //backgroundColor: Colors.white10,
      bottomNavigationBar: new Container(
          width: MediaQuery.of(context).size.width, child: signUp()),

      body: body,
    );
  }

  @override
  void dispose() {
    if (this.mounted) super.dispose();
  }

  loginBackground() => Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          /*image: DecorationImage(
            image: NetworkImage(
              'https://coloredbrain.com/wp-content/uploads/2016/07/login-background.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
          ),*/
        ),
        padding: EdgeInsets.all(10),
        child: loginBody(),
      );

  loginBody() => ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[loginHeader(), formUI(), socialLogin()],
      );

  loginHeader() => Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 60.0,
          ),
          Text(
            "Welcome to ${UIData.appName}",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.orange,
                fontSize: 22.0),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "Sign in to continue",
            style: TextStyle(color: Colors.grey, fontSize: 20.0),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      );

  emailEnter() => Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
        child: TextFormField(
            controller: _emailController,
            decoration: new InputDecoration(
              hintText: 'Email',
              labelText: "Email",

              /*suffixIcon: GestureDetector(
                            onTap: () {

                            },
                            child: Icon(Icons.keyboard_arrow_right),
                          ),*/
            ),
            keyboardType: TextInputType.emailAddress,
            validator: UIData.validateEmail,
            onSaved: (String val) {
              email = val;
            }),
      );

  passwordEnter() => Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
        child: TextFormField(
            controller: _passwordController,
            decoration: new InputDecoration(
              hintText: 'Password',
              labelText: "Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  semanticLabel:
                      _obscureText ? 'show password' : 'hide password',
                ),
              ),
            ),
            obscureText: _obscureText,
            validator: UIData.validatePassword,
            onSaved: (String val) {
              password = val;
            }),
      );

  forgotPasswordPress() =>
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, UIData.forgotPasswordRoute);
          },
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 27.0),
                child: Text("Forgot Password",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        )
      ]);

  formIcon() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.grey.withOpacity(0.2),
            child: Icon(Icons.person, color: Colors.black),
          ),
        ],
      );

  loginPress() => Container(
      height: 350,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
            elevation: 10.0,
            shape: StadiumBorder(),
            backgroundColor: Colors.orange,
            child: Icon(Icons.navigate_next, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => new DashboardPage()));
            }),
      ));

  socialLogin() => Row(
        children: <Widget>[
          SizedBox(width: 25.0),
          SizedBox(
            height: 120.0,
          ),
          Expanded(
            child: googleSignInButton(),
          ),
          SizedBox(width: 10.0),
          Expanded(child: facebookSignInButton()),
          SizedBox(width: 25.0),
        ],
      );

  signUp() => Padding(
        padding: EdgeInsets.all(3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("You don't have account?",
                style: TextStyle(color: Colors.grey)),
            new FlatButton(
              child: new Text("Sign up",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.pushNamed(context, UIData.signUpRoute);
              },
            ),
          ],
        ),
      );

  formUI() => Container(
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                height: 320,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 50.0,
                    ),
                    emailEnter(),
                    passwordEnter(),
                    new SizedBox(height: 10.0),
                    forgotPasswordPress(),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
            formIcon(),
            loginPress()
          ],
        ),
      );
}

displayProgressDialog(BuildContext context) {
  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return new ProgressDialog();
      }));
}

closeProgressDialog(BuildContext context) {
  Navigator.of(context).pop();
}

googleSignInButton() => RaisedButton(
      child: Text("Google"),
      color: Colors.red.withOpacity(0.7),
      textColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      onPressed: () {
        //TODO: Facebook sign in
      },
    );

facebookSignInButton() => RaisedButton(
      child: Text("Facebook"),
      color: Colors.indigo.withOpacity(0.7),
      textColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      onPressed: () {
        //TODO: Facebook sign in
      },
    );
