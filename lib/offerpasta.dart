import 'package:badges/badges.dart' as Badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:provider/provider.dart';
import 'SharedPref.dart';
import 'cart_model.dart';
import 'cart_provider.dart';
import 'db.dart';
import 'main.dart';

class Offerpasta extends StatefulWidget {
  @override
  State<Offerpasta> createState() => _OfferpastaState();
}

class _OfferpastaState extends State<Offerpasta> {
  //MyBloc test = new MyBloc();
  bool time = true;
  bool time1 = true;
  DBHelper dbhelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pasta offers"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)),
        ),
        elevation: 0.00,
        backgroundColor: purple,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Center(
                child: Badges.Badge(
                  badgeContent:
                  Consumer<CartProvider>(builder: (context, value, child) {
                    return Text(
                      value.getCounter().toString(),
                      style: TextStyle(color: Colors.white),
                    );
                  }),
                //  animationDuration: Duration(milliseconds: 300),
                  child: Icon(Icons.shopping_cart),
                )),
          ),
        ],
      ),
      body: ListView(
        children: [
          time
              ? Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              height: 240,
              width: 500,
              child: FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection("offers")
                      .where('name', isEqualTo: "3 pasta")
                      .get(),
                  builder: (context, AsyncSnapshot SnapShot) {
                    if (SnapShot.hasData == false)
                      return Text("no data");
                    else {
                      return ListView.builder(
                          itemCount: SnapShot.data.docs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20, left: 7, right: 7),
                              child: Container(
                                width: 320,
                                height: 220,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.3),
                                      width: 2.0,
                                      style: BorderStyle.solid),
                                ),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 110,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        // shape: BoxShape.circle,
                                          color: Colors.transparent,
                                          image: DecorationImage(
                                            image: NetworkImage(SnapShot
                                                .data
                                                .docs[index]["image"]),
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 25, right: 10, left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                              bottom: 15.0,
                                            ),
                                            child: Text(
                                              SnapShot.data.docs[index]
                                              ["name"],
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.w600,
                                                  fontSize: 17),
                                            ),
                                          ),
                                          Text(
                                            SnapShot.data.docs[index]
                                            ["price"],
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.w600,
                                                fontSize: 17),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                top: 10.0),
                                            child: Container(
                                              height: 50,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(25),
                                                  color: Colors.grey
                                                      .withOpacity(0.3)),
                                              child: Center(
                                                child: CountdownTimer(
                                                  endTime: SharedPref
                                                      .shard
                                                      .getInt(
                                                    'endtime2',
                                                  ),
                                                  onEnd: () {
                                                    setState(() {
                                                      time = false;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          MaterialButton(
                                              shape:
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      25.0)),
                                              child: Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.w600,
                                                  fontSize: 17,
                                                ),
                                              ),
                                              color: purple,
                                              onPressed: () {
                                                dbhelper
                                                    .insertToFirebase(
                                                    Cart(
                                                      //      id: SnapShot.data.docs[index]["id"],
                                                      name: SnapShot.data
                                                          .docs[index]
                                                      ["name"],
                                                      quntity: 1,
                                                      image: SnapShot.data
                                                          .docs[index]
                                                      ["image"],
                                                      price: SnapShot
                                                          .data
                                                          .docs[index]
                                                      ["price"]
                                                          .toString(),
                                                    ))
                                                    .then((value) {
                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar (
                                                      content:Text("offer added to cart"),
                                                      backgroundColor: purple,
                                                      shape:const RoundedRectangleBorder(
                                                          borderRadius:  BorderRadius.only(
                                                            topLeft:  Radius.circular(10),
                                                            topRight: Radius.circular(10),
                                                          )
                                                      ),
                                                      duration:Duration(seconds: 3)));
                                                  print(
                                                      'offer added to cart');
                                                  // cart.addTotalPrice(SnapShot.data.docs[index]["price"]);
                                                  cart.addCounter();
                                                }).onError((error,
                                                    stackTrace) {
                                                  print(error.toString());
                                                });
                                              })
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                    ;
                  }),
            ),
          )
              : Padding(
            padding: const EdgeInsets.only(
                top: 40, bottom: 20, left: 7, right: 7),
            child: Container(
              width: 320,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                    width: 2.0,
                    style: BorderStyle.solid),
              ),
              child: Center(
                  child: Text(
                    "OFFER IS NOT AVAILABLE",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                    ),
                  )),
            ),
          ),
          time1
              ? Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              height: 240,
              width: 500,
              child: FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection("offers")
                      .where('name', isEqualTo: "2 pasta")
                      .get(),
                  builder: (context, AsyncSnapshot SnapShot) {
                    if (SnapShot.hasData == false)
                      return Text("no data");
                    else {
                      return ListView.builder(
                          itemCount: SnapShot.data.docs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20, left: 7, right: 7),
                              child: Container(
                                width: 320,
                                height: 220,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.3),
                                      width: 2.0,
                                      style: BorderStyle.solid),
                                ),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 110,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        // shape: BoxShape.circle,
                                          color: Colors.transparent,
                                          image: DecorationImage(
                                            image: NetworkImage(SnapShot
                                                .data
                                                .docs[index]["image"]),
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 25, right: 10, left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                              bottom: 15.0,
                                            ),
                                            child: Text(
                                              SnapShot.data.docs[index]
                                              ["name"],
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.w600,
                                                  fontSize: 17),
                                            ),
                                          ),
                                          Text(
                                            SnapShot.data.docs[index]
                                            ["price"],
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.w600,
                                                fontSize: 17),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                top: 10.0),
                                            child: Container(
                                              height: 50,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(25),
                                                  color: Colors.grey
                                                      .withOpacity(0.3)),
                                              child: Center(
                                                child: CountdownTimer(
                                                  endTime: SharedPref
                                                      .shard
                                                      .getInt(
                                                    'endtime2',
                                                  ),
                                                  onEnd: () {
                                                    setState(() {
                                                      time1 = false;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          MaterialButton(
                                              shape:
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      25.0)),
                                              child: Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.w600,
                                                  fontSize: 17,
                                                ),
                                              ),
                                              color: purple,
                                              onPressed: () {
                                                dbhelper
                                                    .insertToFirebase(
                                                    Cart(
                                                      //  id: SnapShot.data.docs[index]["id"],
                                                      name: SnapShot.data
                                                          .docs[index]
                                                      ["name"],
                                                      quntity: 1,
                                                      image: SnapShot.data
                                                          .docs[index]
                                                      ["image"],
                                                      price: SnapShot.data
                                                          .docs[index]
                                                      ["price"],
                                                    ))
                                                    .then((value) {
                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar (
                                                      content:Text("offer added to cart"),
                                                      backgroundColor: purple,
                                                      shape:const RoundedRectangleBorder(
                                                          borderRadius:  BorderRadius.only(
                                                            topLeft:  Radius.circular(10),
                                                            topRight: Radius.circular(10),
                                                          )
                                                      ),
                                                      duration:Duration(seconds: 3)));
                                                  print(
                                                      'offer added to cart');
                                                  // cart.addTotalPrice(SnapShot.data.docs[index]["price"]);
                                                  cart.addCounter();
                                                }).onError((error,
                                                    stackTrace) {
                                                  print(error.toString());
                                                });
                                              })
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                    ;
                  }),
            ),
          )
              : Padding(
              padding: const EdgeInsets.only(
                  top: 40, left: 7, right: 7),
              child: Container(
                width: 320,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                      width: 2.0,
                      style: BorderStyle.solid),
                ),
                child: Center(
                    child: Text(
                      "OFFER IS NOT AVAILABLE",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                      ),
                    )),
              )),
        ],
      ),
    );
  }
}
