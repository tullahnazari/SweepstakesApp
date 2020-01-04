import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:sweepstakes/models/result.dart';
import 'package:sweepstakes/models/sweepstake.dart';

class Results with ChangeNotifier {
  List<ResultItem> _items = [];

  Map<String, ResultItem> get items {
    return {...items};
  }

  ResultItem findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  //ADD entry to contest
  Future<void> enterSweepstake(ResultItem result, Sweepstake sweepstake) async {
    //send https request
    final url = 'https://sweepsteaks-31629.firebaseio.com/results.json';
    var title = sweepstake.title;
    final randomNumber = generateRandomNumber;
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'id': result.id,
          'title': title,
          'randomNumber': randomNumber,
        }),
      );
      final newContest = ResultItem(
        title: title,
        randomNumber: randomNumber,
        id: json.decode(response.body)['name'],
      );
      _items.add(newContest);
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
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

//   void addItem(
//     String sweepstakeId,
//     int randomNumber,
//     String title,
//   ) {
//     if (_items.containsKey(sweepstakeId)) {
//       //change quantity
//       _items.update(
//           sweepstakeId,
//           (existingCartItem) => ResultItem(
//               id: existingCartItem.id,
//               title: existingCartItem.title,
//               randomNumber: existingCartItem.randomNumber));
//     } else {
//       //addd item to cart
//       _items.putIfAbsent(
//         sweepstakeId,
//         () => ResultItem(
//           id: DateTime.now().toString(),
//           title: title,
//           randomNumber: randomNumber,
//         ),
//       );
//     }
//     notifyListeners();
//   }
}
