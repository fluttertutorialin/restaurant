import 'package:flutter/material.dart';
import 'package:restaurant/utils/uidata.dart';

class CustomFloat extends StatelessWidget {
  final IconData icon;
  final Widget builder;
  final VoidCallback qrCallback;
  final isMini;

  CustomFloat({this.icon, this.builder, this.qrCallback, this.isMini = false});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      clipBehavior: Clip.antiAlias,
      mini: isMini,
      onPressed: qrCallback,
      child: Ink(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: UIData.kitGradients2)),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.orange.withOpacity(0.5),
            ),
            builder != null
                ? Positioned(
                    right: 5.0,
                    top: 5.0,
                    child: CircleAvatar(
                      backgroundColor:Colors.orange.withOpacity(0.5),
                      child: builder,
                      radius: 85.0,
                    ),
                  )
                : Container(),
            // builder
          ],
        ),
      ),
    );
  }
}
