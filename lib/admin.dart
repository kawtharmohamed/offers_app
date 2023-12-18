import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:offersapp/main.dart';

import 'profile.dart';

class Admin extends StatefulWidget {
  String c;
  Admin(this.c);

  @override
  State<Admin> createState() {
    return _AdminState(c);
  }
}

class _AdminState extends State<Admin> {
  String collections;
  _AdminState(this.collections);

  dynamic b;

  TextEditingController t1 = new TextEditingController();
  TextEditingController t2 = new TextEditingController();
  TextEditingController t3 = new TextEditingController();
  TextEditingController t4 = new TextEditingController();
  TextEditingController t5 = new TextEditingController();

  dynamic x = CircleAvatar(
      backgroundColor: Colors.indigo,
      radius: 100,
      child: CircleAvatar(
        backgroundImage: NetworkImage(
            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
        radius: 100,
      ));
  @override
  Widget build(BuildContext context) {
    // final documents = FirebaseFirestore.instance.collection(collections).snapshots().length;

    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD NEW OFFER"),
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
        leading: Icon(Icons.menu),
        backgroundColor: purple,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top:10, right: 30, left: 30),
        child: ListView(
          children: [
            x,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: t1,
                decoration: InputDecoration( border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.5), width: 2) ),
                  hintText: "Name",
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.drive_file_rename_outline_sharp,
                    color: purple,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: t2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.5), width: 2) ),
                  hintText: "Price",
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.drive_file_rename_outline_sharp,
                    color: purple,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: t4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.5), width: 2) ),
                  hintText: "End Time",
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.drive_file_rename_outline_sharp,
                    color: purple,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: t5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.5), width: 2) ),
                  hintText: "Quntity",
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.drive_file_rename_outline_sharp,
                    color: purple,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                "Upload photo",
                style: TextStyle(fontSize: 17, color: purple),
              ),
            ),
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(1, 10, 10, 20),
                    child: ElevatedButton(
                        onPressed: () async {
                          ImagePicker a = new ImagePicker();
                          b = await a.getImage(source: ImageSource.camera);

                          setState(() {
                            if (b != null)
                              x = CircleAvatar(
                                  backgroundColor: Colors.indigo,
                                  radius: 144,
                                  child: CircleAvatar(
                                    backgroundImage: FileImage(File(b.path)),
                                    radius: 140,
                                  ));
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Colors.grey.withOpacity(0.5),
                                        width: 2)))),
                        child: Text(
                          "From Camera",
                          style: TextStyle(color: Colors.black),
                        ))),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
                  child: ElevatedButton(
                      onPressed: () async {
                        ImagePicker a = new ImagePicker();
                        b = await a.getImage(source: ImageSource.gallery);

                        setState(() {
                          if (b != null)
                            x = CircleAvatar(
                                backgroundColor: purple,
                                radius: 144,
                                child: CircleAvatar(
                                  backgroundImage: FileImage(File(b.path)),
                                  radius: 140,
                                ));
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.grey.withOpacity(0.5),
                                          width: 2)))),
                      child: Text("From Gallery",
                          style: TextStyle(color: Colors.black))),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          String name = t1.text;
          String price = t2.text;
          String endtime = t4.text;
          String quntity = t5.text;
          dynamic image = b.path;

          FirebaseFirestore.instance
              .collection(collections)
              .add(<String, dynamic>{
            "name": name,
            "price": price,
            "image": image,
            "endtime ": endtime ,
            "quntity" :quntity
          } );
        },
        backgroundColor: purple,
      ),
    );
  }
}
