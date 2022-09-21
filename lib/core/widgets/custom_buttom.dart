import 'package:flutter/material.dart';
import 'package:kss/core/utils/size_config.dart';

import '../const.dart';
import 'custom_text.dart';

class CustomMaterialButtom extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color;
  final Color colorText;

  // ignore: prefer_const_constructors_in_immutables
  CustomMaterialButtom(
      {Key? key,
      this.text = "",
      required this.press,
      this.color = Primarycolor,
      this.colorText = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: SizeConfig.screenwidth,
      height: 60,
      onPressed: press,
      color: color,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: CustomText(
          text: text,
          fontSize: 20,
          color: colorText,
          fontWeight: FontWeight.normal,
          alignment: Alignment.center),
    );
  }
}
