import 'package:flutter/material.dart';
import 'package:kss/core/widgets/custom_listTile.dart';
import 'package:kss/core/widgets/custom_text.dart';

import 'package:kss/view/user/Drower/MyDrower.dart';
import 'package:kss/core/widgets/Custom_FloatingActionButton.dart';
import 'package:kss/view/user/home/widgets/Categories_Card.dart';

import '../../../core/const.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/widgets/custom_buttom.dart';

class OrderDetailsScreen extends StatefulWidget {
  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
  var numOfProducts;
  var totalPrice;
  var date;
  var address;
  var listOfItems;
  OrderDetailsScreen({
    this.numOfProducts,
    this.totalPrice,
    this.date,
    this.address,
  this.listOfItems}
      );

}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
//  const DetailsScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> formStateOrderDetails = new GlobalKey<FormState>();

  final String Num_products = "2";

  final String Total_Price = "600";

  final String date = "15/03 12/00 PM";

  final String Adress = "جبرة";

  @override
  Widget build(BuildContext context) {
    SizeConfig();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ListView(children: [
                  CustomFloatingActionButton(
                    press: () => Navigator.pop(context, true),
                    icon: const Icon(Icons.chevron_left_rounded,
                        color: Colors.grey),
                  ),
                  Form(
                    key: formStateOrderDetails,
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.screenheight! * .02),
                        Container(
                            // color: Colors.amber,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: Table(children: [
                                TableRow(children: [
                                  CustomText(
                                    text: 'عدد المنتجات',
                                    fontSize: 20,
                                  ),
                                  CustomText(
                                    text: '${widget.listOfItems.length}',
                                    fontSize: 20,
                                  ),
                                ]),
                                const TableRow(children: [
                                  const Divider(
                                    thickness: 0.3,
                                    color: Primarycolor,
                                  ),
                                  const Divider(
                                    thickness: 0.3,
                                    color: Primarycolor,
                                  ),
                                ]),
                                // for (int i = 0; i < 2; i++)
                                //   new TableRow(children: [
                                //     CustomText(
                                //       text: "خروف",
                                //     ),
                                //     CustomText(
                                //       text: "1",
                                //     ),
                                //   ]),
                                // TableRow(children: [
                                //   CustomText(
                                //     text: "",
                                //   ),
                                //   CustomText(text: ''),
                                // ]),
                                TableRow(children: [
                                  CustomText(
                                    text: 'السعر الإجمالي',
                                  ),
                                  CustomText(text: '${widget.totalPrice}'),
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
                                  CustomText(text: '${widget.date}'),
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
                                  CustomText(text: '${widget.address}'),
                                ]),
                              ]),
                            )),
                        SizedBox(height: SizeConfig.screenheight! * .02),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                             width: double.infinity,
                             padding: const EdgeInsets.symmetric(vertical: 10),
                             margin: const EdgeInsets.symmetric(vertical: 10),
                                         decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                           border: Border.all(color: Colors.grey),
                                              ),
                                               child:
                                          ListView.builder(
                                        itemCount: widget.listOfItems.length,
                                        itemBuilder: (context, i) {
                                           return Column(
                                             children: [
                                               Table(
                                                   children: [
                                                   TableRow(children: [
                                                     CustomText(
                                                       text: 'المنتج(النوع : ${widget.listOfItems[i].name})',
                                                      ),
                                                     CustomText(
                                               text: "،الكمية :${widget.listOfItems[i].quantity}،${widget.listOfItems[i].head}،${widget.listOfItems[i].bowels}،${widget.listOfItems[i].weight}",
                                                  ),

                                       ]),

                                               ]),
                                               SizedBox(height: SizeConfig.screenheight! * .02),
                                             ],
                                           );
                                        })
                                         )

                      ],
                    ),
                  )
                ]))));
  }
}

