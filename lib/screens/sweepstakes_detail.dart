import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:clippy_flutter/diagonal.dart';
import 'package:flutter/material.dart';
import 'package:sweepstakes/models/sweepstake.dart';
import 'package:sweepstakes/widgets/animation.dart';

class SweepstakesDetail extends StatefulWidget {
  @override
  _SweepstakesDetailState createState() => _SweepstakesDetailState();
}

class _SweepstakesDetailState extends State<SweepstakesDetail> {
  
  static final double containerHeight = 300.0;
  double clipHeight = containerHeight * 0.35;
  DiagonalPosition position = DiagonalPosition.BOTTOM_LEFT;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Diagonal(
              clipShadows: [ClipShadow(color: Colors.black)],
              position: position,
              clipHeight: clipHeight,
              child: Container(
                color: Colors.red,
                height: 500,
              ),
            ),
            Positioned(
                bottom: 0.0,
                right: 0.0,
                left: 0.0,
                top: 0.0,
                child: Center(
                  child: AnimationWidget(),
                )),
            Positioned(
              bottom: -60.0,
              right: 0.0,
              left: 0.0,
              height: 140.0,
              child: AspectRatio(
                aspectRatio: 300 / 145,
                child: Image.asset(
                  'assets/car.png',
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 60.0),
        RaisedButton(
          child: Text('Enter to Win'),
          onPressed: () {
            // setState(() {
            //   if (position == DiagonalPosition.BOTTOM_LEFT) {
            //     position = DiagonalPosition.BOTTOM_RIGHT;
            //   } else {
            //     position = DiagonalPosition.BOTTOM_LEFT;
            //   }
            // });
          },
        ),
        RaisedButton(
          child: Text('View Restrictions'),
          onPressed: () {
            // setState(() {
            //   if (clipHeight == containerHeight * 0.35) {
            //     clipHeight = containerHeight * 0.10;
            //   } else {
            //     clipHeight = containerHeight * 0.35;
            //   }
            // });
          },
        )
      ],
    ));
  }
}