// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

import '../../core/const.dart';
import '../../core/widgets/custom_buttom.dart';
import '../../core/widgets/custom_listTile.dart';

// ignore: non_constant_identifier_names
Widget Details(String name, String Adress) {
  return Positioned(
    bottom: 0,
    left: 2,
    right: 2,
    child: Container(
        width: double.infinity,
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          color: Colors.white,
          // ignore: prefer_const_constructors
          borderRadius: BorderRadius.only(
            // ignore: prefer_const_constructors
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Stack(children: [
          // ignore: prefer_const_constructors
          Padding(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.symmetric(
              horizontal: 28,
            ),
            // ignore: prefer_const_constructors
            child: IntrinsicWidth(
              child: VerticalDivider(
                color: Colors.grey,
                indent: 28,
                endIndent: 120,
                thickness: 1,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(children: [
                    CustomListTile(
                      text: "الاسم",
                      subtitel: name,
                      icon: Icons.person,
                    ),
                    CustomListTile(
                      text: "العنوان",
                      subtitel: Adress,
                      icon: Icons.place,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    CustomMaterialButtom(
                      press: () {
                        //    Navigator.of(context)
                        //      .pushNamed('Payment');
                      },
                      text: "تمت عملية التوصيل ",
                    )
                  ]),
                )
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.white,
              child: Icon(
                Icons.phone_forwarded_sharp,
                color: Primarycolor,
              ),
            ),
          ),
        ])),
  );
}
