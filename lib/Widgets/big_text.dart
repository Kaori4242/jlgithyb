import 'package:flutter/cupertino.dart';

import '../home/dimensions.dart';


class bigText extends StatelessWidget {
   Color? color;
  final String text;
  double size;
  FontWeight fontWeight;
  TextOverflow overFlow;

  bigText({Key? key,  this.color = const Color(0xFF332d2b),
    required this.text,
    this.overFlow = TextOverflow.ellipsis ,
    this.size =0,
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        fontSize:size==0?Dimensions.font20:size,
        color: color,
        fontWeight: fontWeight==0?FontWeight.w400:fontWeight,
      ),

    );
  }
}
