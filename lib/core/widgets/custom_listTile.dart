import 'package:flutter/material.dart';

import '../const.dart';
import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  final String text;
  final String subtitel;
  final IconData icon;

  CustomListTile({
    Key? key,
    this.text = """""",
    this.subtitel = "",
    this.icon = Icons.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomText(
        text: text,
        fontSize: 15,
        color: Colors.black,
        height: 2,
      ),
      subtitle: CustomText(
        text: subtitel,
        fontSize: 15,
        color: Colors.grey,
      ),
      leading: Icon(
        icon,
        color: Primarycolor,
        size: 20,
      ),
    );
  }
}
