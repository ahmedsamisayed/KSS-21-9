import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/const.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/widgets/custom_text.dart';

class OldOrderItem extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);
  final name;
  final OrderNumber;
  final Adress;
  OldOrderItem(this.name, this.OrderNumber, this.Adress);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
                width: 2,
              )),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "طلب بواسطة :",
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        CustomText(
                          text: "رقم الطلب :",
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        CustomText(
                          text: "العنوان :",
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: name,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        CustomText(
                          text: OrderNumber,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        CustomText(
                          text: Adress,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }
}
