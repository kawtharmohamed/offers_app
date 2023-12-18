import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SharedPref.dart';

class CartProvider with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;
  double  _totalprice= 0.0;
  double get totalprice => _totalprice;

  void _setPrefItems() async {
    SharedPref.shard = await SharedPreferences.getInstance();
    SharedPref.shard.setInt('cart_item', _counter);
    SharedPref.shard.setDouble('total_price',_totalprice);
    notifyListeners();
  }
  void _getPrefItems() async {
    SharedPref.shard = await SharedPreferences.getInstance();
    _counter= SharedPref.shard.getInt('cart_item') ?? 0;
    _totalprice= SharedPref.shard.getDouble('cart_item') ?? 0.0;
    notifyListeners();
  }
  void addCounter () {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }
  void removeCounter () {
    _counter--;
    _setPrefItems();
    notifyListeners();
  }
  int getCounter () {
    _getPrefItems();
    return _counter ;
  }
  void addTotalPrice ( double price) {
    _totalprice= _totalprice + price;
    _setPrefItems();
    notifyListeners();
  }
  void removeTotalPrice ( double price) {
    _totalprice= _totalprice - price;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice () {
    _getPrefItems();
    return _totalprice ;
  }
}