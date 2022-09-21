import 'package:flutter/material.dart';
import 'package:kss/core/utils/size_config.dart';

import '../../../../../core/const.dart';
import '../../../../../core/widgets/custom_text.dart';

class CustomCardBorder extends StatelessWidget {
  final String text;
  final Widget? icon;
  final VoidCallback press;

  // ignore: prefer_const_constructors_in_immutables
  CustomCardBorder({
    Key? key,
    this.text = "",
    required this.press,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('Information Order');
        },
        child: InkWell(
          onTap: press,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Primarycolor,
                  width: 2,
                )),
            child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(10.0),
                shadowColor: Color(0x802196F3),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: icon,
                      ),
                      CustomText(
                        text: text,
                        color: Primarycolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
