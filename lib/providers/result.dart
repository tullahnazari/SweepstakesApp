import 'dart:math';

import 'package:flutter/widgets.dart';

class ResultItem {
  final String id;
  final String title;
  final int randomNumber;

  ResultItem({this.id, this.title, this.randomNumber});
}

class Result with ChangeNotifier {
  //map with productid for product model and cart model
  Map<String, ResultItem> _items = {};

  Map<String, ResultItem> get items {
    return {...items};
  }

  //generating random number
  int get generateRandomNumber {
    var rnd = new Random();
    var next = rnd.nextDouble() * 1000000;
    while (next < 100000) {
      next *= 10;
    }
    return next.toInt();
  }

  void addItem(
    String sweepstakeId,
    int randomNumber,
    String title,
  ) {
    if (_items.containsKey(sweepstakeId)) {
      //change quantity
      _items.update(
          sweepstakeId,
          (existingCartItem) => ResultItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              randomNumber: existingCartItem.randomNumber));
    } else {
      //addd item to cart
      _items.putIfAbsent(
        sweepstakeId,
        () => ResultItem(
          id: DateTime.now().toString(),
          title: title,
          randomNumber: randomNumber,
        ),
      );
    }
    notifyListeners();
  }
}
