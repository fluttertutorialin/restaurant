import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/ui/page/dashboard/card_more_widget.dart';
import 'package:restaurant/ui/page/dashboard/card_widget.dart';
import 'package:restaurant/ui/widgets/like_button.dart';
import 'package:restaurant/ui/widgets/custom_shape_clipper.dart';
import 'package:restaurant/ui/widgets/scaffold.dart';
import 'package:restaurant/utils/uidata.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State<DashboardPage> {
  List<String> _menuType = ["VEG PIZZA", "NON-VEG PIZZA", "PIZZA MANIA", "BURGER PIZZA", "SIDES & BEVERAGES", "SPECIALITY CHICKEN"];
  String _selectedMenu = "All";

  PageController _pageController;
  bool selectedColor = true;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _scaffold();
  }

  Stack buildHeaderStack() {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: Platform.isIOS ? 200 : 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.grey,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Padding(
          padding: Platform.isAndroid
              ? EdgeInsets.only(left: 20, top: 8, right: 10)
              : EdgeInsets.only(left: 20, top: 50, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Menu Type",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        child: Icon(
                          FontAwesomeIcons.caretDown,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ],
                  ),
                  iconSize: 0,
                  items: _menuType.map((location) {
                    return DropdownMenuItem<String>(
                        value: location,
                        child: Text(
                          location,
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ));
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedMenu = newValue;
                      print(_selectedMenu);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        buildPositionedButtons(),
      ],
    );
  }

  Positioned buildPositionedButtons() {
    return Positioned(
      bottom: 10,
      left: 40,
      right: 40,
      child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 8,
                spreadRadius: 1,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  if (_pageController.page.abs() != 0) {
                    _pageController.jumpToPage(0);
                    setState(() {
                      selectedColor = true;
                    });
                  } else {
                    selectedColor = false;
                  }
                },
                child: Text(
                  "Limited",
                  style: TextStyle(
                      color: selectedColor ? Colors.orange : Colors.black,
                      fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: VerticalDivider(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_pageController.page.abs() != 1) {
                    _pageController.jumpToPage(1);
                    setState(() {
                      selectedColor = false;
                    });
                  } else {
                    selectedColor = true;
                  }
                },
                child: Text(
                  "Unlimited",
                  style: TextStyle(
                    color: selectedColor ? Colors.orange : Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  dashBoard() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        buildHeaderStack(),
                        buildHomeMainContainer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildHomeMainContainer() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 22.0, bottom: 10),
            child: Text(
              "Special offer",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: Container(
              height: 275,
              child: ListView.builder(
                  padding: EdgeInsets.only(right: 20),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: AppImages.image1.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardListWidget(
                      heartIcon: LikeButton(
                        key: ObjectKey(index.toString()),
                        width: 70,
                      ),
                      image: AppImages.image1[index],
                      foodDetail: "Desert - Fast Food - Alcohol",
                      foodName: "Cafe De Perks",
                      vote: 4.5,
                      foodTime: "15-30 min",
                    );
                  },
                ),
            ),
          ),
          Container(
            color: Colors.grey,
            height: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 22.0, bottom: 10),
            child: Text(
              "Menu type",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CardMoreWidget(
            image: AppImages.image1[1],
            foodDetail: "A hugely popular margherita, with a deliciously tangy single cheese topping",
            foodName: "Margherita",
            vote: 4.5,
            foodTime: "15-30 min",
            status: "CLOSE",
            statusColor: Colors.pinkAccent,
            heartIcon: LikeButton(
              width: 70,
            ),
          ),
          CardMoreWidget(
            heartIcon: LikeButton(
              width: 70,
            ),
            image: AppImages.image1[0],
            foodDetail: "The ever-popular Margherita - loaded with extra cheese... oodies of it!",
            foodName: "Double Cheese Margherita",
            vote: 4.5,
            foodTime: "15-30 min",
            status: "OPEN",
            statusColor: Colors.green,
          ),
          CardMoreWidget(
            heartIcon: LikeButton(
              width: 70,
            ),
            image: AppImages.image1[0],
            foodDetail: "A pizza that goes ballistic on veggies! Check out this mouth watering overload of crunchy, crisp capsicum, succulent mushrooms and fresh tomatoes",
            foodName: "Farm House",
            vote: 4.5,
            foodTime: "15-30 min",
            status: "OPEN",
            statusColor: Colors.green,
          ),
          CardMoreWidget(
            heartIcon: LikeButton(
              width: 70,
            ),
            image: AppImages.image1[0],
            foodDetail: "Chunky paneer with crisp capsicum and spicy red pepper - quite a mouthful!",
            foodName: "Peppy Paneer",
            vote: 4.5,
            foodTime: "15-30 min",
            status: "OPEN",
            statusColor: Colors.green,
          ),
          CardMoreWidget(
            heartIcon: LikeButton(
              width: 70,
            ),
            image: AppImages.image1[0],
            foodDetail: "A pizza loaded with crunchy onions, crisp capsicum, juicy tomatoes and jalapeno with a liberal sprinkling of exotic Mexican herbs.",
            foodName: "Mexican Green Wave",
            vote: 4.5,
            foodTime: "15-30 min",
            status: "OPEN",
            statusColor: Colors.green,
          ),
          CardMoreWidget(
            heartIcon: LikeButton(
              width: 70,
            ),
            image: AppImages.image1[0],
            foodDetail: "For a vegetarian looking for a BIG treat that goes easy on the spices, this one's got it all.. The onions, the capsicum, those delectable mushrooms - with paneer and golden corn to top it all.",
            foodName: "Deluxe Veggie",
            vote: 4.5,
            foodTime: "15-30 min",
            status: "OPEN",
            statusColor: Colors.green,
          ),
        ],
      ),
    );
  }

  _scaffold() => CommonScaffold(
      appTitle: UIData.appName,
      bodyData: dashBoard(),
      showDrawer: true,
      mobile: '',
      userName: '',
      loginDateTime: '');

  @override
  void dispose() {
    super.dispose();
  }
}

class AppImages {
  static const image1 = [
    "https://3c1703fe8d.site.internapcdn.net/newman/gfx/news/hires/2016/howcuttingdo.jpg",
    "https://asset2.cxnmarksandspencer.com/is/image/mands/44e79d5a6007d11fd420b6c302d0f2fc0ef404da",
  ];
}
