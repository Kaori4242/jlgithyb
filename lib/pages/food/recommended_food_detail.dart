import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../Widgets/big_text.dart';
import '../../home/dimensions.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(preferredSize: Size.fromHeight(20),
              child:Container(

              color: Colors.white,
              child: Center(child: bigText(size: Dimensions.font26,text:"Bayterek")),
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 5 , bottom: 10),
            ) ,),
            pinned: true,
            backgroundColor: Colors.white,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/image/bayterek_2.jpg" , width: double.maxFinite,
              fit: BoxFit.cover,
              ),

            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              "леонтологический природный памятник. Расположен в Павлодарской области, в городской черте Павлодара, на правом берегу реки Иртыш. Является самым крупным известным захоронением неогеновых животных. Было открыто в 1928 году Ю. А. Орловым, изучается с 1929 года "
            ),
          )
        ],
      ),
    );
  }
}
