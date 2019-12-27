import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweepstakes/models/result.dart';
import 'package:sweepstakes/providers/sweepstakes.dart';

class ResultScreen extends StatelessWidget {
  //giving page route name
  static const routeName = '/results';
  @override
  Widget build(BuildContext context) {
    final resultItems = Provider.of<Result>(context);
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            Center(
              child: Text(
                'Your Number is: ',
                style: TextStyle(fontSize: 34),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
