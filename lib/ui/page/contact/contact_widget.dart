import 'package:flutter/material.dart';

class ContactWidget extends StatefulWidget {
  ContactWidget({Key key}) : super(key: key);

  @override
  ContactWidgetState createState() {
    return new ContactWidgetState();
  }
}

class ContactWidgetState extends State<ContactWidget> {
  Size deviceSize;

  Widget headOfficeCard() => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Title",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Address',
                  style: TextStyle(fontSize: 15.0, color: Colors.black38),
                ),
                SizedBox(
                  height: 3.0,
                ),
                Text(
                  'Address description',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Icon(Icons.call, size: 20.0, color: Colors.orange),
                        new Text(" Mobile",
                            style: new TextStyle(
                                fontSize: 15.0, color: Colors.orange)),
                      ]),
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Icon(Icons.email, size: 20.0, color: Colors.orange),
                        new Text(" Email",
                            style: new TextStyle(
                                fontSize: 15.0, color: Colors.orange)),
                      ]),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: deviceSize.height / 3.6,
          ),
          //mainCard(),
          headOfficeCard(),
        ],
      ),
    );
  }
}
