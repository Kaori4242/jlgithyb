import 'package:flutter/cupertino.dart';
import 'package:jl/Widgets/small_text.dart';


import '../home/dimensions.dart';


class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color iconColor;

  const IconAndTextWidget({Key? key, required this.icon, required this.text, required this.color, required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon , color: iconColor, size: Dimensions.IconSize24,),
        SizedBox(width: 5,),
        smallText(text: text , color: color,),
      ],//2:39:49
    );
  }
}
