import 'package:flutter/material.dart';

import '../../constant.dart';
import 'custom_text.dart';

class CustomButten extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final Color? color;
  final Color? textcolor;
  const CustomButten(
      {this.text = 'write text',
      this.onPressed,
      this.color = PrimaryColor,
      this.textcolor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(18),
          backgroundColor: textcolor,
        ),
        onPressed: onPressed,
        child: CustomText(
          text: text,
          color: color,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
