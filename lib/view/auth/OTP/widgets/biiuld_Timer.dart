import 'package:flutter/material.dart';

import '../../../../core/const.dart';

buildTimer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TweenAnimationBuilder(
        tween: Tween(begin: 60.0, end: 0.0),
        duration: Duration(seconds: 60),
        builder: (_, dynamic value, child) => Text(
          "00:${value.toInt()}",
          style: TextStyle(color: Primarycolor),
        ),
      ),
    ],
  );
}
