import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jl/Widgets/small_text.dart';



import '../home/dimensions.dart';

class Exandable extends StatefulWidget {
  final String text;
  const Exandable({Key? key, required this.text}) : super(key: key);

  @override
  State<Exandable> createState() => _ExandableState();
}

class _ExandableState extends State<Exandable> {
  late  String firstHalf;
  late  String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight/5.63;

  @override
  void initState(){
    super.initState();
    if(widget.text.length> textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() + 1 , widget.text.length);
    }
    else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?smallText(height: 1.5,text: firstHalf, size: Dimensions.font18):Column(
        children: [
          smallText(height: 1.5, text: hiddenText?(firstHalf + "..."):(firstHalf+secondHalf), size: Dimensions.font18,),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              children: [
                smallText(text: hiddenText?"Читать далее":"Скрыть", color: Color.fromARGB(255, 243, 109, 114),),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: Color.fromARGB(255, 243, 109, 114),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
