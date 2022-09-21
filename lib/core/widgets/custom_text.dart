import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final FontWeight fontWeight;
  final double height;
  final int maxline;

  // ignore: prefer_const_constructors_in_immutables
  CustomText({
    Key? key,
    this.text = '',
    this.fontSize = 14,
    this.color = Colors.black,
    this.alignment = Alignment.topRight,
    this.fontWeight = FontWeight.normal,
    this.height = 1,
    this.maxline = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        maxLines: maxline,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: color,
          height: height,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
