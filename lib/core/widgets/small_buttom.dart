import 'package:flutter/material.dart';

import '../const.dart';
import 'custom_text.dart';

class SmallButtom extends StatelessWidget {
  final String text;
  final VoidCallback press;

  // ignore: prefer_const_constructors_in_immutables
  SmallButtom({
    Key? key,
    this.text = "",
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: MaterialButton(
        height: 50,
        onPressed: press,
        color: Primarycolor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: CustomText(
            text: text,
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            alignment: Alignment.center),
      ),
    );
  }
}
