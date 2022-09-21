import 'package:flutter/material.dart';
import 'package:kss/core/const.dart';

import '../../../../core/widgets/custom_text.dart';

class CustomListTileOnTap extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData icon;

  CustomListTileOnTap({
    Key? key,
    this.text = "",
    required this.onTap,
    this.icon = Icons.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomText(
        text: text,
        fontSize: 15,
        color: Colors.black,
      ),
      leading: Icon(
        icon,
        size: 20,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }
}
