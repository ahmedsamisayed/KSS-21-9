import 'package:flutter/widgets.dart';

class SizeConfig {
  static double? screenwidth;
  static double? screenheight;
  static double? defaultsize;
  static Orientation? orientation;
  static Padding? padding;
  void init(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;

    orientation = MediaQuery.of(context).orientation;
    defaultsize = orientation == Orientation.landscape
        ? screenheight! * .024
        : screenwidth! * .024;
  }
}
