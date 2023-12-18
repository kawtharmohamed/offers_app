import 'package:flutter/material.dart';
import 'package:offersapp/burger.dart';
import 'package:offersapp/drink.dart';

import 'offerburger.dart';
import 'offerdessert.dart';
import 'offerpasta.dart';
import 'offerpizza.dart';
import 'pizza.dart';
import 'resturants.dart';
import 'login.dart';
import 'main.dart';
import 'profile.dart';

class Home1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("OFFERS APP"),
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
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300]),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'What you are searching for?',
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Explore by category",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 80,
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 70,
                            child: IconButton(
                              icon: Icon(
                                  Icons.fastfood_rounded,
                                  size: 50,
                                  color: purple1
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Burger()));
                              },
                            ),
                          ),
                          Text("BURGER")
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0 , left: 25 , right: 25),
                    child: Container(
                      height: 100,
                      width: 80,
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 70,
                            child: IconButton(
                              icon: Icon(
                                  Icons.local_pizza_sharp,
                                  size: 50,
                                  color: purple1
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Pizza()));},
                            ),
                          ),
                          Text("PIZZA")
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 80,
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 70,
                            child: IconButton(
                              icon: Icon(
                                  Icons.local_drink,
                                  size: 50,
                                  color: purple1
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Drink()));
                              },
                            ),
                          ),
                          Text("Drinks")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(  onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Offerpizza()));
          },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.2),
                        width: 2.0,
                        style: BorderStyle.solid),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/pizza.png",
                      ),
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.2), BlendMode.modulate),
                      fit: BoxFit.fill,
                    )),
                child: Center(child: Text("Pizza Offers" , style: TextStyle(fontWeight: FontWeight.w700 ,
                  fontSize: 25 , fontStyle: FontStyle.italic,
                ),)),
              ),
            ),
          ),
          GestureDetector(  onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Offerburger()));
          },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.2),
                        width: 2.0,
                        style: BorderStyle.solid),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/burger.png",
                      ),
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.2), BlendMode.modulate),
                      fit: BoxFit.fill,
                    )),
                child: Center(child: Text("Burger Offers" , style: TextStyle(fontWeight: FontWeight.w700 ,
                  fontSize: 25 , fontStyle: FontStyle.italic,
                ),)),
              ),
            ),
          ),
          GestureDetector(  onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Offerdessert()));
          },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.2),
                        width: 2.0,
                        style: BorderStyle.solid),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/cake.png",
                      ),
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.2), BlendMode.modulate),
                      fit: BoxFit.fill,
                    )),
                child: Center(child: Text("Desserts Offers" , style: TextStyle(fontWeight: FontWeight.w700 ,
                  fontSize: 25 , fontStyle: FontStyle.italic,
                ),)),
              ),
            ),
          ),
          GestureDetector(  onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Offerpasta()));
          },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.2),
                        width: 2.0,
                        style: BorderStyle.solid),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/pasta.png",
                      ),
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.2), BlendMode.modulate),
                      fit: BoxFit.fill,
                    )),
                child: Center(child: Text("pasta Offers" , style: TextStyle(fontWeight: FontWeight.w700 ,
                  fontSize: 25 , fontStyle: FontStyle.italic,
                ),)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
