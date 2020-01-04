import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweepstakes/models/result.dart';
import 'package:sweepstakes/providers/results.dart';
import 'package:sweepstakes/providers/sweepstakes.dart';
import 'package:sweepstakes/screens/sweepstakes_overview.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen();
  //giving page route name
  static const routeName = '/results';

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final resultItem = Provider.of<ResultItem>(context);
    final resultId = ModalRoute.of(context).settings.arguments as String;

    final loadedresult = Provider.of<Sweepstakes>(
      context,
      listen: false,
    ).findById(resultId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedresult.title),
      ),
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
                resultItem.randomNumber.toString(),
                style: TextStyle(fontSize: 34),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
