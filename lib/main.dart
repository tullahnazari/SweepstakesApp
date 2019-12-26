import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweepstakes/providers/sweepstakes.dart';
import 'package:sweepstakes/screens/sweepstakes_detail.dart';
import 'package:sweepstakes/screens/sweepstakes_overview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Sweepstakes(),
      child: MaterialApp(
        title: 'Sweepstakes',
        theme: ThemeData(
          primaryColor: Colors.amber,
          accentColor: Colors.white,
          fontFamily: 'Lato',
        ),
        home: SweepstakesOverview(),
        routes: {
          SweepstakesDetail.routeName: (ctx) => SweepstakesDetail(),
        },
      ),
    );
  }
}
