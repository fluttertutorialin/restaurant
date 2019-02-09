import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:restaurant/ui/page/dashboard/card_more_shape.dart';

class CardMoreWidget extends StatefulWidget {
  final String image;
  final String foodName;
  final String foodDetail;
  final String foodTime;
  final String status;
  final Color statusColor;
  final double vote;
  final Widget heartIcon;
  CardMoreWidget(
      {this.image,
        this.foodDetail,
        this.foodName,
        this.vote,
        this.foodTime,
        this.status,
        this.heartIcon,
        this.statusColor});

  @override
  CardMoreWidgetState createState() {
    return new CardMoreWidgetState();
  }
}

class CardMoreWidgetState extends State<CardMoreWidget> {
  bool _isSolid = false;

  void _toggleHeart() {
    setState(() {
      _isSolid = !_isSolid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
      ),
      child: Material(
        elevation: 4,
        shadowColor: Colors.white54,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: MediaQuery.of(context).size.width - 40, //- 20
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: TransitionToImage(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      image: AdvancedNetworkImage(
                        widget.image,
                        useDiskCache: true,
                      ),
                      fit: BoxFit.cover,
                      placeholder: const Icon(Icons.refresh),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.2),
                      ),
                      child: widget.heartIcon,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black87,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 18,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                  child: Text(
                                    widget.vote.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "(11)",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.clock,
                                  size: 12,
                                  color: Colors.white,
                                ),
                                Text(
                                  widget.foodTime,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: ClipPath(
                      clipper: CardMoreClipper(),
                      child: Container(
                        padding: EdgeInsets.only(top: 5, left: 12),
                        decoration: BoxDecoration(
                          color: widget.statusColor,
                          borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(10)),
                        ),
                        height: 60,
                        width: 60,
                        child: Transform.rotate(
                          child: Text(widget.status,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "KoHo")),
                          angle: pi * 1.75,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 8.0, bottom: 1.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.foodName,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.dollarSign,
                            size: 12,
                            color: Colors.black54,
                          ),
                          Text('100',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "KoHo",
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 0.0, bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.foodDetail,
                              style:
                              TextStyle(fontSize: 14, color: Colors.grey)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text('ORDER',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "KoHo",
                                  color: Colors.green))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
