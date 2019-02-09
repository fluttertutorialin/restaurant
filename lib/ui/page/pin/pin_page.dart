import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/ui/widgets/backgroundclipper.dart';
import 'package:restaurant/ui/widgets/progressdialog.dart';

class PinPage extends StatefulWidget {
  @override
  _PinState createState() => _PinState();
}

class _PinState extends State<PinPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String mobile;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _pinController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var body = new Center(
      child: new Form(
        key: _key,
        autovalidate: _validate,
        child: forgotPasswordBody(),
      ),
    );

    var bodyProgress = new Container(
      child: new Stack(
        children: <Widget>[
          body,
          // _loader(),
        ],
      ),
    );

    return new Scaffold(
      key: scaffoldKey,
      //backgroundColor: Colors.white24,
      /* bottomNavigationBar: new Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            ClipPath(
              clipper: HeartRateClipper(),
              child: Container(
                width: double.infinity,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFFD180),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),*/

      body: new Container(child: bodyProgress),
    );
  }

  forgotPasswordBody() => ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[forgotPasswordHeader(), formUI()],
      );

  forgotPasswordHeader() => Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 60.0,
          ),
          Text(
            "Verification Code",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.orange,
                fontSize: 22.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Please type the verification code \nsent to +91 9586331823",
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
              height: 300,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 90.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        hintText: 'Pincode',
                        labelText: "Pincode",
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      controller: _pinController,
                    ),
                  ),
                  new SizedBox(height: 10.0),

                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    GestureDetector(
                      onTap: () {},
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(right: 27.0),
                              child: FlatButton(
                                child: new Text("Don't received opt?",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold)),
                              ))
                        ],
                      ),
                    )
                  ]),
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
                child: Icon(Icons.sms, color: Colors.black),
              ),
            ],
          ),
          Container(
              height: 330,
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
                      //_onLoading();
                      _sendToServer();
                    }),
              ))
        ],
      ),
    );
  }

  _sendToServer() {}

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
}
