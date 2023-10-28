import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchTextField extends StatelessWidget {
  final Function? onChanged;
  final TextEditingController? controller;
  String? hint = 'ابحث عن اي مكان';
  Widget? suffixIcon;
  // ignore: use_key_in_widget_constructors
  SearchTextField(
      {this.onChanged, this.controller, this.hint, this.suffixIcon});

//لو عاوز تغير العرض والطول هتستخدم
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        textAlign: TextAlign.right,
        autofocus: false,
        style: const TextStyle(
          color: Color(0xFFbdc6cf),
          fontSize: 18,
        ),
        decoration: InputDecoration(
          // ده علشان نظبط ارتفاع الكلام
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),

          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.0),
          ),
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          filled: true,
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 18.0, color: Color(0xFF75797B)),
          alignLabelWithHint: false,
          fillColor: Colors.white,

          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xff707070),
            size: 30,
          ),
          suffixIcon: suffixIcon,
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
      ),
    );
    // Container(
    //   width: MediaQuery.of(context).size.width,
    //   height: MediaQuery.of(context).size.height * .25,
    //   child: TextField(
    //     style: TextStyle(color: Colors.white),
    //     onChanged: (value) {},
    //     decoration: InputDecoration(
    //       border: OutlineInputBorder(),
    //       prefixIcon: Icon(
    //         Icons.search,
    //         color: Colors.white,
    //       ),
    //       hintText: 'Type To Search...',
    //       hintStyle: TextStyle(color: Colors.black),
    //       fillColor: Colors.green,
    //       // filled: true,
    //     ),
    //     controller: controller,
    //   ),
    // );
  }
}
