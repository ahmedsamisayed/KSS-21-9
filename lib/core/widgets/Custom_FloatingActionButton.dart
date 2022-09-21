import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback press;
  //final IconData? icon;
  final Widget? icon;

  // ignore: prefer_const_constructors_in_immutables
  CustomFloatingActionButton({
    Key? key,
    required this.press,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: FloatingActionButton(
        heroTag: null,
          backgroundColor: Colors.white, onPressed: press, child: icon),
    );
  }
}
