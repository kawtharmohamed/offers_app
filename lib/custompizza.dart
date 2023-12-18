import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'main.dart';

class Custompizza extends StatelessWidget {
  String isFavorite = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection("pizza").get(),
      builder: (context, AsyncSnapshot SnapShot) {
        if (SnapShot.hasData == false)
          return Text("no data");
        else {
          return GridView.builder(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(  childAspectRatio: 0.7,
                  crossAxisCount: 2),
              itemCount: SnapShot.data.docs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        height: 250,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.3),
                              width: 2.0,
                              style: BorderStyle.solid),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 90.0),
                              child: FavoriteButton(
                                isFavorite: false,
                                valueChanged: (_isFavourite) {
                                  print('Is Favourite $_isFavourite)');
                                },
                              ),
                            ),
                            Image.network(
                              SnapShot.data.docs[index]["image"],
                              width: 140,
                              height: 130,
                            ),
                            Text(
                              SnapShot.data.docs[index]["name"],
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              SnapShot.data.docs[index]["price"],
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        }
      },
    );
  }
}
