import 'package:flutter/material.dart';


showScaffoldSnackBar(String data, BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 2000),
        backgroundColor: Color(0xffd0c9c0),
        margin: const EdgeInsets.all(100.0),
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        content: Text('${data}', style: TextStyle(color: Colors.black),),
      ));
}