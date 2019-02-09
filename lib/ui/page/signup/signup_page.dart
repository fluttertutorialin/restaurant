import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/model/signup/gender.dart';
import 'package:restaurant/ui/widgets/backgroundclipper.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  TextEditingController name = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();

  Gender selectedUser;
  List<Gender> genders = <Gender>[
    const Gender(1, 'Male'),
    const Gender(2, 'Female')
  ];

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext context;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    //selectedUser = genders[0];
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return new Scaffold(
      key: scaffoldKey,
      body: new ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[forgotPasswordHeader(), formUI()],
      ),
    );
  }

  @override
  void dispose() {
    if (this.mounted) super.dispose();
  }

  forgotPasswordHeader() => Column(
    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      SizedBox(
        height: 60.0,
      ),
      Text(
        "Create New Account",
        style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.orange,
            fontSize: 22.0),
      ),
      SizedBox(
        height: 10.0,
      ),
      Text(
        "Free",
        style: TextStyle(color: Colors.grey, fontSize: 16.0),
      ),
      SizedBox(
        height: 20.0,
      ),
    ],
  );

  Widget formUI() {
    return new Container(
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: BackgroundClipper(),
            child: Container(
              height: 560,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new SizedBox(
                    height: 60.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        hintText: 'Name',
                        labelText: "Name",
                      ),
                      keyboardType: TextInputType.text,
                      controller: name,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        hintText: 'Email',
                        labelText: "Email",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: email,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                    child: TextFormField(
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
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            semanticLabel: _obscureText
                                ? 'show password'
                                : 'hide password',
                          ),
                        ),
                      ),
                      obscureText: _obscureText,
                      controller: password,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        hintText: 'Confirm password',
                        labelText: "Confirm password",
                      ),
                      obscureText: _obscureText,
                      controller: confirmPassword,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        hintText: 'Mobile',
                        labelText: "Mobile",
                      ),
                      keyboardType: TextInputType.phone,
                      /*inputFormatters: [
                        MaskedTextInputFormatterShifter(
                            maskONE:"XXX XXX XXXX",
                            maskTWO:"XXX XXX XXXX"
                        ),
                      ],*/
                      controller: phoneNumber,
                    ),
                  ),
                  new SizedBox(height: 10.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                    child: DropdownButtonHideUnderline(
                      child: new DropdownButton<Gender>(
                        hint: new Text("Select gender"),
                        value: selectedUser == null ? null : selectedUser,
                        onChanged: (Gender newValue) {
                          setState(() {
                            selectedUser = newValue;
                          });
                        },
                        items: genders.map((Gender user) {
                          return new DropdownMenuItem<Gender>(
                            value: user,
                            child: selectedUser == null
                                ? new Text(
                                    user.name,
                                    style: new TextStyle(color: Colors.grey),
                                  )
                                : selectedUser.name == user.name
                                    ? new Text(
                                        user.name,
                                        style:
                                            new TextStyle(color: Colors.black),
                                      )
                                    : new Text(
                                        user.name,
                                        style:
                                            new TextStyle(color: Colors.grey),
                                      ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  //new Text("selected user name is ${selectedUser.name} : and Id is : ${selectedUser.id}"),
                  new SizedBox(height: 15.0),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.grey.withOpacity(0.2),
                child: Icon(Icons.person_add, color: Colors.black),
              ),
            ],
          ),
          Container(
              height:590,
              child: Align(
                alignment: Alignment.bottomCenter,
                /*child: RaisedButton(
                    elevation: 0.0,
                    splashColor: Colors.orangeAccent,
                    padding: EdgeInsets.all(12.0),
                    shape: StadiumBorder(),
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: 'Raleway'),
                    ),
                    color: Colors.orange,*/

                child: FloatingActionButton(
                    elevation: 10.0,
                    shape: StadiumBorder(),
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.navigate_next, color: Colors.white),
                    onPressed: () {
                      verifyDetails();
                    }),
              ))
        ],
      ),
    );
  }

  verifyDetails() async {
    if (name.text == "") {
      //UIData.toast(context, "Name cannot be empty");
      return;
    }

    if (phoneNumber.text == "") {
      //UIData.toast(context, "Phone cannot be empty");
      return;
    }

    if (email.text == "") {
      //UIData.toast(context, "Email cannot be empty");
      return;
    }

    if (password.text == "") {
      //UIData.toast(context, "Password cannot be empty");
      return;
    }

    if (confirmPassword.text == "") {
      //UIData.toast(context, "Re-Password cannot be empty");
      return;
    }

    if (password.text != confirmPassword.text) {
      //UIData.toast(context, "Passwords don't match");
      return;
    }
  }
}
