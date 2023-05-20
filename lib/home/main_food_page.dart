import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Widgets/big_text.dart';
import '../tours.dart';
import 'dimensions.dart';
import 'food_page_body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  int _selectedTab = 0;




  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Scaffold(

      bottomNavigationBar: GNav(
        rippleColor: Colors.grey[300]!,
        hoverColor: Colors.grey[100]!,
        gap: 8,
        activeColor: Colors.black,
        iconSize: 27,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        duration: Duration(milliseconds: 400),
        tabBackgroundColor: Colors.grey[100]!,
        color: Colors.black,
        onTabChange: (index){
          controller.animateToPage(index, duration: Duration(seconds: 1), curve: Curves.easeIn);
          // or this to jump to it without animating
          controller.jumpToPage(index);
        },
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Главная',
          ),
          GButton(
            icon: Icons.add_location_alt_outlined,
            text: 'Туры',
          ),
          GButton(
            icon: Icons.message_outlined,
            text: 'Сообщения',
          ),
          GButton(
            icon: Icons.account_circle_outlined,
            text: 'Профиль',
          ),
        ],

        ),
      backgroundColor: Color.fromRGBO(250, 250, 250, 1.0),
      body:
      PageView(
        controller: controller ,
        children:  <Widget>[
          Column(

            children: [

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 10.0,
                      offset: Offset(0,3),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-3,0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(3,0),
                    ),

                  ],
                ),
                child: Container(
                  margin: EdgeInsets.only(top:Dimensions.height45 , bottom:  Dimensions.height15),
                  padding: EdgeInsets.only(left:Dimensions.width20 , right: Dimensions.width20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              bigText(text: "Павлодар"),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),



                        ],

                      ),
                      Center(
                        child:Container(
                          width: Dimensions.height45,
                          height: Dimensions.height45,
                          child: Icon(Icons.search , color: Colors.white,size: Dimensions.IconSize24,),
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius15),
                            color: Color.fromRGBO(238, 104, 74, 1),
                          ),
                        ) ,
                      ),

                    ],
                  ),
                ),

              ),

              Expanded(child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 20),
                child: FoodPageBody(),
              ),)
              

            ],
            
            
          ),
          ChoosePlaceWidget(),
        ],
      ),
    );
  }
}
