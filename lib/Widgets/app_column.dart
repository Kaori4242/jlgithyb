import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jl/Widgets/small_text.dart';



import '../home/dimensions.dart';
import 'big_text.dart';
import 'icon_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key , required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        bigText(text: text, size: Dimensions.font20,),
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
        SizedBox(height: Dimensions.height10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(icon: Icons.location_on, text: "Павлодар", color: Colors.black54, iconColor: Color.fromRGBO(238, 104, 74, 1)),
            SizedBox(width: Dimensions.width60,),
            Row(
              children: [
                IconAndTextWidget(icon: Icons.camera_alt, text: "AR", color: Colors.black54, iconColor: Colors.black54),
                SizedBox(width: Dimensions.width10,),
                IconAndTextWidget(icon: Icons.panorama_horizontal, text: "360", color: Colors.black54, iconColor: Colors.orange)

              ],
            ),
          ],
        ),
      ],
    );
  }
}
