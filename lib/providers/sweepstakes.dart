import 'package:flutter/material.dart';
import 'package:sweepstakes/models/sweepstake.dart';

class Sweepstakes with ChangeNotifier {
  List<Sweepstake> _items = [
    Sweepstake(
        id: '1',
        title: 'Jordan 1s',
        imageUrl:
            'https://sneakernews.com/wp-content/uploads/2019/10/Air-Jordan-1-High-Fearless-Les-Twins-CK5666_100-1.jpg',
        price: 299.99,
        dateTime: '12/26/2020'),
    Sweepstake(
        id: '2',
        title: '60 inch OLED',
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/81Nu4cpJ9JL._SL1500_.jpg',
        price: 299.99,
        dateTime: '12/26/2020'),
    Sweepstake(
        id: '3',
        title: 'iPhone 11 Pro',
        imageUrl:
            'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-11-pro-space-select-2019?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1566954989577',
        price: 999.99,
        dateTime: '12/27/2020'),
    Sweepstake(
        id: '4',
        title: 'PS4 PRO',
        imageUrl:
            'https://media.kohlsimg.com/is/image/kohls/3355334?wid=500&hei=500&op_sharpen=1',
        price: 349.99,
        dateTime: '12/27/2020'),
    Sweepstake(
        id: '5',
        title: 'Nintendo Switch',
        imageUrl:
            'https://target.scene7.com/is/image/Target/GUEST_5561e25a-a986-4b57-bba4-ee339796ae89?fmt=webp&wid=1400&qlt=80',
        price: 299.99,
        dateTime: '12/28/2020'),
  ];

  //MAKING IT SO ONLY DATA INSIDE HERE IS CHANGED FOR PRODUCT DATA
  List<Sweepstake> get items {
    return [..._items];
  }

  Sweepstake findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void updateProduct(String id, Sweepstake newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('Sweepstake does not exist');
    }
  }

  void addProduct(Sweepstake product) {
    final newProduct = Sweepstake(
      title: product.title,
      dateTime: product.dateTime,
      price: product.price,
      imageUrl: product.imageUrl,
      id: product.dateTime,
    );
    _items.add(newProduct);
    notifyListeners();
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
