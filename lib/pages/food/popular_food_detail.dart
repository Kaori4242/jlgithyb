import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:carousel_slider/carousel_slider.dart';
import '../../Widgets/app_column.dart';
import '../../Widgets/big_text.dart';
import '../../Widgets/exandable_text_widget.dart';
import '../../Widgets/icon_text_widget.dart';
import '../../Widgets/small_text.dart';
import '../../firstScreen/first_screen.dart';
import '../../home/dimensions.dart';
import '../../home/places_lists.dart';

import '../panorama.dart';
import 'app_icon.dart';

class PopularFoodDetail extends StatelessWidget {

  final int ind;
  const PopularFoodDetail({Key? key , this.ind = 0}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(

            left: 0,
            right: 0,
            child: Container(
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(

                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(Places.Images[ind]),
                    )
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height45,
              left:Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios)),
                  AppIcon(icon: Icons.bookmark , iconColor: Color.fromRGBO(243, 109, 114, 1),),
                ],
              ),
          ),
          Positioned(
            left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize-10,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20 , right:Dimensions.width20 , top:Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20) ,
                    topLeft: Radius.circular(Dimensions.radius20) ,
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: Places.Names[ind],),
                    SizedBox(height: Dimensions.height20,),
                    
                    Expanded(
                      child: DefaultTabController(
                          length: 4,
                          child: Column(
                              children: [
                                TabBar(
                                    isScrollable: true,
                                    automaticIndicatorColorAdjustment: false ,
                                    indicatorColor: Color.fromARGB(
                                        255, 243, 109, 114),
                                    tabs: [

                                      Container(
                                          width: 70.0,
                                          child: Tab(
                                            child: bigText( text: "Описание" , size: 15, fontWeight: FontWeight.w300,),)),
                                      Container(
                                          width: 70.0,
                                          child: Tab(
                                            child: bigText( text: "Отзыв" , size: 15,fontWeight: FontWeight.w300,),)),
                                      Container(
                                          width: 70.0,
                                          child: Tab(
                                            child: bigText( text: "Гиды" , size: 15,fontWeight: FontWeight.w300,),)),
                                      Container(
                                          width: 70.0,
                                          child: Tab(
                                            child: bigText( text: "Карта" , size: 15,fontWeight: FontWeight.w300,),)),
                                    ]
                                ),
                                Expanded(child: TabBarView(children: [
                                  Container(
                                      margin: EdgeInsets.only(left: Dimensions.width15),
                                      child: Column(

                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        children: [

                                          SizedBox(height: Dimensions.height20,),
                                          bigText(text: "О месте" , fontWeight: FontWeight.w500,),
                                          SizedBox(height: Dimensions.height10,),
                                          Expanded(child: SingleChildScrollView(child: Exandable(text: Places.Dis[ind]))),
                                        ],
                                  )),
                                  Container(),
                                  Container(),
                                  Container(),
                                ],))

                              ],
                            ),

                      ),
                    ),


                  ],

                ),

              ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        height: 90,
        padding: EdgeInsets.only(top: Dimensions.height15, bottom: Dimensions.height15,left: Dimensions.width20 , right: Dimensions.width20,),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
          color: Color.fromRGBO(255, 255, 255, 1.0),
          borderRadius: BorderRadius.only(

            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.only(left: Dimensions.width50, right: Dimensions.width50, top: Dimensions.height15, bottom: Dimensions.height15 ),
              //margin: EdgeInsets.only(left: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    spreadRadius: 1,

                  ),
                ],
                color: Color.fromARGB(255, 243, 109, 114),
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(

                    context,
                    MaterialPageRoute(builder: (context) =>  FirstScreenN()),
                  );
                },
                child: Row(

                  children: [
                    SizedBox(width: Dimensions.width10,),

                    bigText(text: "AR", color: Colors.white,fontWeight: FontWeight.w700, size: Dimensions.font20,),
                    SizedBox(width: Dimensions.width10,),
                  ],
                ),
              ),

            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  FirstScreenN()),
                );
              },
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width50, right: Dimensions.width50, top: Dimensions.height15, bottom: Dimensions.height15 ),

                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Color.fromARGB(255, 243, 109, 114),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      spreadRadius: 1,

                    ),
                  ],
                ),
                child: GestureDetector(

                  child: Row(

                    children: [
                      SizedBox(width: Dimensions.width10,),

                      bigText(text: "360", color: Colors.white, fontWeight: FontWeight.w700, size: Dimensions.font20,),

                      SizedBox(width: Dimensions.width10,),
                    ],
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
