import 'dart:io';

import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: Colors.white,
            width: 10,
          )),
      child: Material(
        color: Colors.white,
        elevation: 10,
        borderRadius: BorderRadius.circular(50.0),
        shadowColor: Color(0x802196F3),
        child: Icon(
            Icons.account_circle_outlined,
          size: 100,
        )
        // CircleAvatar(
        //   radius: 50.0,
        //   backgroundColor: Colors.black12,
        //   backgroundImage: NetworkImage(
        //     "https://images.unsplash.com/photo-1594616838951-c155f8d978a0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
        //   ),
        // ),
      ),
    );
  }
}
