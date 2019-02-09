import 'package:flutter/material.dart';
import 'package:restaurant/ui/widgets/arc_clipper.dart';
import 'package:restaurant/utils/uidata.dart';

class LoginBackground extends StatelessWidget {
  final showIcon;
  final image;

  LoginBackground({this.showIcon = true, this.image});

  Widget topHalf(BuildContext context) {
    return new Flexible(
      flex: 2,
      child: ClipPath(
        clipper: new ArcClipper(),
        child: Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                colors: UIData.kitGradientsBackground,
              )),
            ),
            showIcon
                ? new Center(
                    child: Text(
                      "Restaurant",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : new Container(
                    width: double.infinity,
                    child: image != null
                        ? Image.network(
                            image,
                            fit: BoxFit.cover,
                          )
                        : new Container())
          ],
        ),
      ),
    );
  }

  final bottomHalf = new Flexible(
    flex: 3,
    child: new Container(),
  );

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[topHalf(context), bottomHalf],
    );
  }
}
