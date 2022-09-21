import 'package:flutter/material.dart';

import '../const.dart';

class CustomfaltlButtom extends StatelessWidget {
  final String text;
  final String text1;
  final VoidCallback press;

  final double fontSize;
  final Alignment alignme;

  CustomfaltlButtom({
    Key? key,
    this.text = "",
    this.text1 = "",
    required this.press,
    this.fontSize = 15,
    this.alignme = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignme,
      child: Row(
        children: <Widget>[
          // ignore: deprecated_member_use
          TextButton(
            onPressed: press,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                TextSpan(
                  text: text1,
                  style: TextStyle(
                    color: Primarycolor,
                    fontSize: 15,
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
