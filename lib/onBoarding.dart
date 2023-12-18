import 'package:flutter/material.dart';
import 'package:offersapp/home1.dart';
//import 'package:shop_app/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login.dart';
import 'main.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  // const OnBoarding({Key? key}) : super(key: key);
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/onboarding.png',
      title: 'EXPLORE',
      body: 'Variety of food you can eat',
    ),
    BoardingModel(
      image: 'assets/onboarding1.png',
      title: ' CHOOSE',
      body: 'Select your future offer',
    ),
    BoardingModel(
      image: 'assets/onboarding3.png',
      title: 'Sales',
      body: 'Holiday sales , Various choice and categories',
    ),
  ];

  bool isLast = false;

  var boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home1()));
                },
                child: Text(
                  'SKIP',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: purple1,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: boardController,
                  itemBuilder: (context, index) =>
                      BuildBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                  onPageChanged: (index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                      controller: boardController,
                      effect: WormEffect(
                        activeDotColor: purple,
                        dotWidth: 12,
                        dotHeight: 12,
                      ),
                      count: boarding.length),
                  Spacer(),
                  FloatingActionButton(
                    backgroundColor: purple1,
                    onPressed: () {
                      if (isLast) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      } else {
                        boardController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios),
                    //backgroundColor: Colors.cyan,
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget BuildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage('${model.image}'))),
          Text(
            '${model.title}',
            style: TextStyle(
                fontSize: 23, fontWeight: FontWeight.bold, color: purple1),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              '${model.body}',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      );
}
