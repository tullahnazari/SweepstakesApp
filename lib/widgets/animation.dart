import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Animation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
                
                crossAxisAlignment: CrossAxisAlignment.center,
                
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                 SizedBox(width: 20.0, height: 100.0),
                  Text(
                  "To Win:",
                     style: TextStyle(fontSize: 43.0, color: Color(0xffFFFFFF)),
                        ),
                  SizedBox(width: 20.0, height: 20.0),
                  RotateAnimatedTextKit(
                    text: ["CLICK TO ENTER BELOW", "DRAWING IS 9PM CST", "         GOOD LUCK!"],
                    textStyle: TextStyle(fontSize: 40.0, fontFamily: "Horizon", color: Color(0xffFFFFFF)),
                    textAlign: TextAlign.center,
                    alignment: Alignment.center // or Alignment.topLeft
                  ),
          ],
              );
  }
}