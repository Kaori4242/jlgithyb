import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:jl/home/get_user_data.dart';
import 'package:jl/home/places_lists.dart';
import '../Widgets/app_column.dart';
import '../Widgets/big_text.dart';
import '../Widgets/icon_text_widget.dart';
import '../Widgets/small_text.dart';
import '../pages/food/popular_food_detail.dart';
import 'dimensions.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

class FoodPageBody extends StatefulWidget {

  final int GLindex = 0;
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {

  PageController pageController = PageController(viewportFraction: 0.85);
  int a = 0;
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  List<String> docIDs = [];

  Future getDOCId() async{
    await FirebaseFirestore.instance.collection('Kazakhstan').get().then(
          (snapshot) => snapshot.docs.forEach((element) {
        print(element.reference.id  );
        docIDs.add(element.reference.id);
      }),);
  }



  @override

  void initState(){
    getDOCId();
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });

    });
  }
  @override
  void dispose(){
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {


    return Column(

      children: [

        GestureDetector(

          onTap: (){

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  PopularFoodDetail(ind: this.a + 1)),
            );
          },
          child: Container(

            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: Places.NamesRec.length,
                itemBuilder: (context, position){
                  a = position;
                  return _buildPageItem(position);
                }
            ),
          ),
        ),
        new DotsIndicator(
          dotsCount: Places.NamesRec.length,
          position: _currPageValue,
          decorator: DotsDecorator(
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeColor: Color.fromRGBO(238, 104, 74, 1),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),

    ),

        SizedBox(height: Dimensions.height30,),

        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              bigText(text: "Места Павлодара"),

            ],
          ),
        ),

       ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Places.Names.length,
              itemBuilder: (context, index){
                int a = index;
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  PopularFoodDetail( ind:index)),
                    );
                  },
                  child: Container(

                    margin: EdgeInsets.only(left: Dimensions.width20 , right:Dimensions.width20 , bottom: Dimensions.height30),
                    child: Row(
                      children: [
                        Container(
                          width:Dimensions.listViewImg,
                          height: Dimensions.listViewImg,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color:Colors.white38,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(Places.Images[index]),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: Dimensions.listViewTextContSize,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius20) ,
                                bottomRight: Radius.circular(Dimensions.radius20),

                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: Dimensions.width10 , right: Dimensions.width10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  bigText(text: Places.Names[index]),
                                  SizedBox(height: Dimensions.height10,),
                                  Row(
                                    children: [
                                      Wrap(
                                        children: List.generate(5, (index) => Icon(Icons.star , size: 15, color: Colors.amber,)),
                                      ),
                                      SizedBox(width: 4,),
                                      smallText(text: "4.5"),
                                      SizedBox(width: 10,),
                                      smallText(text: "142 отзывов"),
                                    ],
                                  ),
                                  SizedBox(height: Dimensions.height15,),
                                  Row(crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      IconAndTextWidget(icon: Icons.location_on, text: "Павлодар", color: Colors.black54, iconColor: Color.fromRGBO(238, 104, 74, 1)),
                                      SizedBox(width: Dimensions.width10,),
                                      IconAndTextWidget(icon: Icons.camera_alt, text: "AR", color: Colors.black54, iconColor: Colors.black54),
                                      SizedBox(width: Dimensions.width10,),
                                      IconAndTextWidget(icon: Icons.panorama, text: "360", color: Colors.black54, iconColor: Colors.orange)
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),

      ],
    );

  }
  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPageValue.floor()){
      var currScale = 1 - (_currPageValue - index)*(1-_scaleFactor);
      var currTrans = _height *(1 - currScale )/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);


    }
    else if(index == _currPageValue.floor() + 1){
      var currScale = _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height *(1 - currScale )/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);;
    }
    else if(index == _currPageValue.floor() - 1){
      var currScale = 1 - (_currPageValue - index)*(1-_scaleFactor);
      var currTrans = _height *(1 - currScale )/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }

    //1:53
    return Transform(
      transform: matrix,
      child: Stack(

        children: [
          Container(

            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10 , right: Dimensions.width10),
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven?Color(0xFF69c5df):Color(0xff151e1f),
              image:DecorationImage(

                fit: BoxFit.cover,
                image: AssetImage(Places.ImagesRec[index]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30 , right: Dimensions.width30 , bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0,5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5,0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5,0),
                  ),

                ],
              ),
              padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
              child: AppColumn(text: Places.NamesRec[index]),
            ),
          ),
        ],
      ),
    );
  }
}
