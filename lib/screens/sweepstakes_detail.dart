import 'package:clippy_flutter/diagonal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweepstakes/providers/sweepstakes.dart';
import 'package:sweepstakes/widgets/animation.dart';

class SweepstakesDetail extends StatelessWidget {
  static const routeName = '/sweepstakedetail';

  static final double containerHeight = 300.0;
  double clipHeight = containerHeight * 0.35;
  DiagonalPosition position = DiagonalPosition.BOTTOM_LEFT;
  @override
  Widget build(BuildContext context) {
    final sweepstakeId = ModalRoute.of(context).settings.arguments as String;
    final loadedSweepstake =
        Provider.of<Sweepstakes>(context).findById(sweepstakeId);

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
                child: Image.network(
                  loadedSweepstake.imageUrl,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.0),
        Text(loadedSweepstake.title),
        SizedBox(
          height: 220,
        ),
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
