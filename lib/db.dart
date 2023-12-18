import 'package:cloud_firestore/cloud_firestore.dart';

import 'cart_model.dart';

class DBHelper{
  static FirebaseFirestore ?_db;
  Future <FirebaseFirestore?> get db async {
    if (_db != null) {
      return db;
    }
  }
  Future<Cart> insertToFirebase(Cart cart) async {
    var insert = FirebaseFirestore.instance.collection("add to cart");
    insert.add(cart.getJson());
    return cart ;
  }

}
