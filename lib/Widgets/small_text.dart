import 'package:flutter/cupertino.dart';

class smallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  smallText({Key? key,  this.color = const Color(0xff5d5654),
    required this.text,

    this.size =12,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text(
      text,

      style: TextStyle(
          fontSize: size,
          color: color,
          height: height
      ),

    );
  }
}
