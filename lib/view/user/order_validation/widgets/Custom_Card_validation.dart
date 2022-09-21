import 'package:flutter/material.dart';
import 'package:kss/core/const.dart';
import 'package:kss/core/utils/size_config.dart';
import 'package:kss/core/widgets/custom_text.dart';

import '../../../../../core/widgets/custom_listTile.dart';

class CustomCardVaildation extends StatelessWidget {
  final String text;
  final String text1;
  final IconData? icon;

  // ignore: prefer_const_constructors_in_immutables
  CustomCardVaildation({
    Key? key,
    this.text = "",
    this.icon,
    this.text1 = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20,
      ),
      height: SizeConfig.screenheight! / 3,
      child: Material(
          color: Colors.white,
          elevation: 5,
          borderRadius: BorderRadius.circular(10.0),
          shadowColor: Color(0x802196F3),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenheight! * .05),
              Material(
                  color: Primarycolor,
                  elevation: 5,
                  borderRadius: BorderRadius.circular(100.0),
                  shadowColor: Color(0x802196F3),
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 80,
                      ))),
              SizedBox(height: SizeConfig.screenheight! * .02),
              CustomText(
                text: text1,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                alignment: Alignment.center,
              ),
              CustomText(
                text: text,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                alignment: Alignment.center,
              ),
            ],
          )),
    );
  }
}
