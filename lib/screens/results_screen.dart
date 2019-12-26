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
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'some title',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      'Random Number',
                      style: TextStyle(
                          color:
                              Theme.of(context).primaryTextTheme.title.color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text("Order Now"),
                    onPressed: () {},
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
