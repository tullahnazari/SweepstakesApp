import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweepstakes/models/result.dart';
import 'package:sweepstakes/providers/auth.dart';
import 'package:sweepstakes/providers/results.dart';
import 'package:sweepstakes/providers/sweepstakes.dart';
import 'package:sweepstakes/screens/adding_sweepstakes.dart';
import 'package:sweepstakes/screens/auth-screen.dart';
import 'package:sweepstakes/screens/results_screen.dart';
import 'package:sweepstakes/screens/sweepstake_management.dart';
import 'package:sweepstakes/screens/sweepstakes_detail.dart';
import 'package:sweepstakes/screens/sweepstakes_overview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //ability to add multiple providers at root of app
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Sweepstakes>(
          update: (ctx, auth, previousProducts) => Sweepstakes(
            auth.token,
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
        ChangeNotifierProvider.value(
          value: Results(),
        ),
        ChangeNotifierProvider.value(
          value: ResultItem(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Sweepstakes',
          theme: ThemeData(
            primaryColor: Colors.amber,
            accentColor: Colors.white,
            fontFamily: 'Lato',
          ),
          home: auth.isAuth ? SweepstakesOverview() : AuthScreen(),
          routes: {
            SweepstakesDetail.routeName: (ctx) => SweepstakesDetail(),
            ResultScreen.routeName: (ctx) => ResultScreen(),
            AddingSweepstake.routeName: (ctx) => AddingSweepstake(),
            SweepstakeManagement.routeName: (ctx) => SweepstakeManagement(),
            SweepstakesOverview.routeName: (ctx) => SweepstakesOverview(),
          },
        ),
      ),
    );
  }
}
