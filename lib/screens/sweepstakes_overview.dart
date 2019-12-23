import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SweepstakesOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
          child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(height: 110,),
            // Image(
            //   image: NetworkImage('https://www.giveawaymonkey.com/wp-content/uploads/2019/09/scratched-textured-enter-to-win-stamp-seal-vector-21476418.jpg'), 
            //   height: 500, 
            //   width: 300,
            // ),
            
            Container(
              color: Color(0xff027FBF),
              child: Column(
                
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
              ),
            ),
            SizedBox(height: 240,),
            Container(
              height: 180,
              width: 220,
              child: Image(image: NetworkImage('https://www.connemarathon.com/wp-content/uploads/2014/09/click-to-enter-smaller.jpg'),)
            ),


          ],


        ),

        
      ),
    );
  }
}