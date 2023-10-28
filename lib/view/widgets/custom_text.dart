import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  //ده تيكست بحدد اتجهاته وشكله وكله
  final String? text;
  final double? fontSize;
  final Color? color;
  final Alignment? alignment;
  final FontWeight? fontWaight;
  final String? fontFamily;

  // ignore: use_key_in_widget_constructors
  const CustomText(
      {this.text = '',
      this.fontSize = 16,
      this.color = Colors.black,
      this.alignment,
      this.fontWaight,
      this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text!,
        softWrap: true,
        overflow: TextOverflow.fade,
        style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWaight,
            fontFamily: fontFamily),
      ),
    );
  }
}
