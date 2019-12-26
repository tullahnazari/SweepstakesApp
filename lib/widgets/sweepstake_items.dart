import 'package:flutter/material.dart';
import 'package:sweepstakes/screens/sweepstakes_detail.dart';

class SweepstakeItems extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final String dateTime;
  final double price;

  SweepstakeItems(
      {this.id, this.title, this.imageUrl, this.dateTime, this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(SweepstakesDetail.routeName, arguments: id);
          },
          child: Card(
            child: Image.network(
              imageUrl,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            Icon(Icons.timer),
            Text('ends ${dateTime}', style: TextStyle(fontSize: 18)),
            Spacer(),
            Text(
              title,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 4,
            ),
            Text('\$${price.toString()}'),
          ],
        ),
      ],
    );
  }
}
