import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweepstakes/providers/sweepstakes.dart';
import 'package:sweepstakes/widgets/app_drawer.dart';
import 'package:sweepstakes/widgets/sweepstake_items.dart';

class SweepstakesOverview extends StatelessWidget {
  static const routeName = '/sweepstakeoverview';
  @override
  Widget build(BuildContext context) {
    final loadedSweepstakeData = Provider.of<Sweepstakes>(context);
    final loadedSweepstake = loadedSweepstakeData.items;

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        actions: <Widget>[
          Icon(Icons.notifications),
        ],
        title: Text(
          'Active Sweeps',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: loadedSweepstake.length,
        itemBuilder: (ctx, i) => SweepstakeItems(
          id: loadedSweepstake[i].id,
          title: loadedSweepstake[i].title,
          imageUrl: loadedSweepstake[i].imageUrl,
          price: loadedSweepstake[i].price,
          dateTime: loadedSweepstake[i].dateTime,
        ),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
