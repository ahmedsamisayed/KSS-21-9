import 'package:flutter/material.dart';
import 'package:kss/core/widgets/custom_listTile.dart';
import 'package:kss/core/widgets/custom_text.dart';

import 'package:kss/view/user/Drower/MyDrower.dart';
import 'package:kss/core/widgets/Custom_FloatingActionButton.dart';
import 'package:kss/view/user/home/widgets/Categories_Card.dart';

import '../../../core/const.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/widgets/custom_buttom.dart';

class OrderDetailsProgressScreen extends StatelessWidget {
//  const DetailsScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> formStateOrderDetails = new GlobalKey<FormState>();
  final String Num_products = "2";
  final String Total_Price = "600";
  final String date = "15/03 12/00 PM";
  final String Adress = "جبرة";
  var Products_List = [
    {"name": "خروف كامل", "quantity": 1},
    {"name": "إبل كامل", "quantity": 1},
    {"بقرة كاملة", 1}
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            drawer: Container(color: Colors.amber, child: MyDrawer()),
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ListView(children: [
                  CustomFloatingActionButton(
                    press: () => Navigator.pop(context, true),
                    icon: Icon(Icons.chevron_left_rounded, color: Colors.grey),
                  ),
                  Form(
                    key: formStateOrderDetails,
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.screenheight! * .02),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: Table(children: [
                                TableRow(children: [
                                  CustomText(
                                    text: 'عدد النتجات',
                                    fontSize: 20,
                                  ),
                                  CustomText(text: Num_products, fontSize: 20),
                                ]),
                                TableRow(children: [
                                  Divider(
                                    thickness: 0.3,
                                    color: Primarycolor,
                                  ),
                                  Divider(
                                    thickness: 0.3,
                                    color: Primarycolor,
                                  ),
                                ]),
                                for (int i = 0; i < Products_List.length; i++)
                                  new TableRow(children: [
                                    CustomText(
                                      text: "خروف كامل",
                                    ),
                                    CustomText(
                                      text: "1",
                                    ),
                                  ]),
                                TableRow(children: [
                                  CustomText(
                                    text: "",
                                  ),
                                  CustomText(text: ''),
                                ]),
                                TableRow(children: [
                                  CustomText(
                                    text: 'السعر الإجمالي',
                                  ),
                                  CustomText(text: Total_Price),
                                ]),
                                TableRow(children: [
                                  CustomText(
                                    text: "",
                                  ),
                                  CustomText(text: ''),
                                ]),
                                TableRow(children: [
                                  CustomText(
                                    text: 'التاريخ',
                                  ),
                                  CustomText(text: date),
                                ]),
                                TableRow(children: [
                                  CustomText(
                                    text: "",
                                  ),
                                  CustomText(text: ''),
                                ]),
                                TableRow(children: [
                                  CustomText(
                                    text: 'الموقع',
                                  ),
                                  CustomText(text: Adress),
                                ]),
                              ]),
                            )),
                        SizedBox(height: SizeConfig.screenheight! * .02),
                        CustomMaterialButtom(
                            text: "إلغاء الطلب",
                            press: () {
                              Navigator.of(context)
                                  .pushNamed('Validation Order Cancel Screen');
                            }),
                      ],
                    ),
                  )
                ]))));
  }
}
