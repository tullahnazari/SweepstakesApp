import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweepstakes/providers/result.dart';
import 'package:sweepstakes/providers/sweepstakes.dart';
import 'package:sweepstakes/screens/sweepstakes_overview.dart';

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
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                resultItems.generateRandomNumber.toString(),
                style: TextStyle(fontSize: 34),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: RaisedButton(
                child: Text('Go back to Sweeps'),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(SweepstakesOverview.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
