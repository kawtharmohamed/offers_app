import 'package:flutter/material.dart';
import 'package:offersapp/burger.dart';
import 'package:offersapp/drink.dart';
import 'package:offersapp/offerburger.dart';
import 'package:offersapp/offerpizza.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as Badges;
import 'cart_provider.dart';
import 'offerdessert.dart';
import 'offerpasta.dart';
import 'pizza.dart';
import 'main.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void onEnd() {
    print('onEnd');
  }

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
        leading: Icon(Icons.menu),
        backgroundColor: purple,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              size: 35,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Center(
              child: Badges.Badge(
                badgeContent: Consumer<CartProvider>(
                  builder: (context, value, child) {
                    return Text(
                      value.getCounter().toString(),
                      style: const TextStyle(color: Colors.white),
                    );
                  },
                ),
               // animationDuration: const Duration(milliseconds: 300),
                child: const Icon(Icons.shopping_cart),
              ),
            ),
          ),
        ],
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
            padding: const EdgeInsets.all(15.0),
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
                              icon: Icon(Icons.fastfood_rounded,
                                  size: 50, color: purple1),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Burger()));
                              },
                            ),
                          ),
                          Text(
                            "BURGER",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 25, right: 25),
                    child: Container(
                      height: 100,
                      width: 80,
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 70,
                            child: IconButton(
                              icon: Icon(Icons.local_pizza_sharp,
                                  size: 50, color: purple1),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Pizza()));
                              },
                            ),
                          ),
                          Text(
                            "PIZZA",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          )
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
                              icon: Icon(Icons.local_drink,
                                  size: 50, color: purple1),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Drink()));
                              },
                            ),
                          ),
                          Text(
                            "Drinks",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          )
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
                child: Center(child: Text("Dessert Offers" , style: TextStyle(fontWeight: FontWeight.w700 ,
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
