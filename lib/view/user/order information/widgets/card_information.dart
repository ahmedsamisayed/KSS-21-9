import 'package:flutter/material.dart';
import 'package:kss/core/widgets/custom_text.dart';

class CustomCardInformation extends StatelessWidget {
  final String? text;
  final String? text1;

  // ignore: prefer_const_constructors_in_immutables
  CustomCardInformation({
    Key? key,
    this.text,
    this.text1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Material(
          color: Colors.white,
          elevation: 5,
          borderRadius: BorderRadius.circular(10.0),
          shadowColor: Color(0x802196F3),
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: text!,
                  ),
                  CustomText(
                    text: text1!,
                  )
                ],
              ))),
    );
  }
}
