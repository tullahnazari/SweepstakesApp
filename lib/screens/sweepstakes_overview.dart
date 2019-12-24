import 'package:flutter/material.dart';
import 'package:sweepstakes/models/sweepstake.dart';
import 'package:sweepstakes/widgets/sweepstake_items.dart';

class SweepstakesOverview extends StatelessWidget {

  final List<Sweepstake> loadedSweepstake = [
    Sweepstake(
      id: '1',
      title: 'Jordan 1s Chi-town',
      imageUrl: 'https://sneakernews.com/wp-content/uploads/2019/10/Air-Jordan-1-High-Fearless-Les-Twins-CK5666_100-1.jpg',
      price: 299.99,

      ),
      Sweepstake(
      id: '2',
      title: '',
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/81Nu4cpJ9JL._SL1500_.jpg',
      price: 299.99,

      ),

  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: loadedSweepstake.length,
        itemBuilder: (ctx, i) => SweepstakeItems(
          id: loadedSweepstake[i].id,
          title: loadedSweepstake[i].title,
          imageUrl: loadedSweepstake[i].imageUrl,



        ),
        scrollDirection: Axis.horizontal,
      ),
      
    );
  }
}