// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

class TourList extends StatelessWidget {
  TourList(
      {super.key,
      required this.fromPlace,
      required this.toPlace,
      required this.smallInfo,
      required this.DateInfo

      });

  String fromPlace;
  String toPlace;
  String smallInfo;
  String DateInfo;

  List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$fromPlace - $toPlace"),
            Text("$DateInfo"),
          ],
        ),

      ),
      //drawer: Drawer(),
      body: Container(
        child: Column(
      children: [
      Expanded(
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (BuildContext ctx, int index) {
          return Container(
            margin: const EdgeInsets.all(20),
            height: 290,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.only(top: 20),
                          height: 160,
                          width: 350,
                          child: Image.asset(


                                categories[index].imgName,

                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        //height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                //color: Colors.white,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${categories[index].tourName}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Color(0xFFC95546),
                                          size: 14.6,
                                        ),
                                        const Icon(
                                          Icons.star,
                                          color: Color(0xFFC95546),
                                          size: 14.6,
                                        ),
                                        const Icon(
                                          Icons.star,
                                          color: Color(0xFFC95546),
                                          size: 14.6,
                                        ),
                                        const Icon(
                                          Icons.star,
                                          color: Color(0xFFC95546),
                                          size: 14.6,
                                        ),
                                        const Icon(
                                          Icons.star_half,
                                          color: Color(0xFFC95546),
                                          size: 14.6,
                                        ),
                                        Text(
                                          '${categories[index].otsyv}',
                                          style: const TextStyle(
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Color(0xFFC95546),
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 35,
                            child: Divider(
                              color: Color(0xFF6F7789),
                              height: 2,
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text('${categories[index].nights}'),
                                  Text('${categories[index].isFood}'),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                '${categories[index].price}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ),
    ],
    ),
    ),
    );
  }
}

class Category {
  String tourName;
  String imgName;
  String nights;
  String isFood;
  String price;
  String otsyv;

  Category(
      {required this.tourName,
        required this.imgName,
        required this.nights,
        required this.isFood,
        required this.price,
        required this.otsyv});
}

class Utils {
  static List<Category> getMockedCategories() {
    return [
      Category(
        tourName: 'Mix.tour',
        imgName: 'assets/images/bayan.png',
        nights: '4 ночей',
        isFood: 'еда включена',
        price: '156 480 T',
        otsyv: '(170 отзывов)',
      ),
      Category(
        tourName: 'Sapar.tour',
        imgName: 'assets/images/sapar.png',
        nights: '4 ночей',
        isFood: 'еда включена',
        price: '140 780 T',
        otsyv: '(378 отзывов)',
      ),
      Category(
        tourName: 'Mix.tour',
        imgName: 'assets/Places/Evil.png',
        nights: '4 ночей',
        isFood: 'еда включена',
        price: '249 000 T',
        otsyv: '(291 отзывов)',
      ),
    ];
  }
}