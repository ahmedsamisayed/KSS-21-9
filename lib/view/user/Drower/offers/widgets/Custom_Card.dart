import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_listTile.dart';

class CustomCard extends StatelessWidget {
  final String text;

  // ignore: prefer_const_constructors_in_immutables
  CustomCard({
    Key? key,
    this.text = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 150,
        child: Material(
            color: Colors.white,
            elevation: 5,
            borderRadius: BorderRadius.circular(10.0),
            shadowColor: Color(0x802196F3),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: CustomListTile(
                icon: Icons.circle,
                text: text,
              ),
            )),
      ),
    );
  }
}
