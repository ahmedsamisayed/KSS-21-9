import 'package:flutter/material.dart';
import 'package:kss/view/user/home/Home_csreen.dart';

import '../../../core/const.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/widgets/custom_text.dart';
import '../BottomNavigationBarUser.dart';
import '../Order details/Order details.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
  var OrdersList;
  OrderScreen(
      {
        this.OrdersList
      }
      );
}
var onProcessingOrders = [];
var completedOrders = [];

class _OrderScreenState extends State<OrderScreen> {

  SplitOrders () {
    List list = widget.OrdersList;
    onProcessingOrders.clear();
    completedOrders.clear();
    list.forEach((n) => {
      if (n.orderStatus == "Processing") {
        onProcessingOrders.add(n)
      }
      else if (n.orderStatus == "Completed") {
        completedOrders.add(n)
      }
    });}
  @override
  void initState() {
    // TODO: implement initState
    SplitOrders();
    super.initState();
  }
  @override
  Widget build(BuildContext context) =>
      WillPopScope(
        onWillPop: () async {
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return HomeNavigationUserPage();
            },
          );
          return shouldPop!;
        },
        child: DefaultTabController(
      length: 2,
          child: Directionality(
            textDirection: TextDirection.rtl,
             child: Scaffold(
            backgroundColor: Colors.white,
                 appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              bottom: TabBar(
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.white),
                ),
                unselectedLabelColor: Colors.grey,
                labelColor: Primarycolor,
                tabs: [
                  Tab(
                    text: "طلبات سابقة",
                  ),
                  Tab(text: "تحت التنفيذ"),
                ],
              ),
            ),
            body: TabBarView(children: [
              Center(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Column(children: [
                    Stack(
                      children: [
                        Divider(
                          color: Colors.black,
                        ),
                        Divider(
                          color: Primarycolor,
                          endIndent: 160,
                          thickness: 5,
                        )
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: completedOrders.length == 0
                          ? Center(
                          child: Text(
                            'لا توجد طلبات سابقة',
                            style: TextStyle(
                              fontFamily: "Tajawal",
                              fontSize: 20,
                            ),
                          ))
                          : ListView.builder(
                          itemCount: completedOrders.length,
                           //shrinkWrap: true,
                          // physics: ScrollPhysics(),
                          itemBuilder: (context, i) {
                            return orderItem(
                                "${completedOrders[i].shippingInfo[0].address}",
                                "${completedOrders[i].createdAt}",
                                "${completedOrders[i].orderItems[0].totalPrice}",
                                    () {
                                      Navigator.of(context).push( MaterialPageRoute(
                                          builder: (context) => OrderDetailsScreen(
                                            ///pass value
                                            listOfItems: completedOrders[i].orderItems,
                                             totalPrice: calcTotalPrice(completedOrders[i].orderItems),
                                             address: completedOrders[i].shippingInfo[0].address,
                                            date: completedOrders[i].createdAt,


                                          )));
                            });
                          }),
                    ),
                  ]),
                ),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(children: [
                    Stack(
                      children: [
                        Divider(
                          color: Colors.black,
                        ),
                        Divider(
                          color: Primarycolor,
                          indent: 160,
                          thickness: 5,
                        )
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: onProcessingOrders.length == 0
                          ? Center(
                          child: Text(
                            'لا توجد طلبات سابقة',
                            style: TextStyle(
                              fontFamily: "Tajawal",
                              fontSize: 20,
                            ),
                          ))
                          :
                      ListView.builder(
                          itemCount: onProcessingOrders.length,
                           //shrinkWrap: true,
                          // physics: ScrollPhysics(),
                          itemBuilder: (context, i) {
                            return orderItem(
                                "${onProcessingOrders[i].shippingInfo[0].address}",
                                "${onProcessingOrders[i].createdAt}",
                                "${onProcessingOrders[i].orderItems[0].totalPrice}",
                                    () {
                                      Navigator.of(context).push( MaterialPageRoute(
                                          builder: (context) => OrderDetailsScreen(
                                            ///pass value
                                            listOfItems: onProcessingOrders[i].orderItems,
                                             totalPrice: calcTotalPrice(onProcessingOrders[i].orderItems),
                                             address: onProcessingOrders[i].shippingInfo[0].address,
                                            date: onProcessingOrders[i].createdAt,


                                          )));
                            });
                          }),
                    ),
                  ]),
                ),
              )
            ])),
      )));
//////////////////widgets orderItem
  Widget orderItem(
    String adress,
    String date,
    String price,
    final VoidCallback press,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      //OrderDetailsProgressScreen
      child: InkWell(
        onTap: press,
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
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Primarycolor,
                          radius: 7,
                        ),
                        IntrinsicWidth(
                          child: VerticalDivider(
                            color: Colors.black,
                            indent: 20,
                            endIndent: 0,
                            width: 20,
                            thickness: 3,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Primarycolor,
                          radius: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: adress,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          VerticalDivider(
                            color: Colors.black,
                            indent: 20,
                            endIndent: 0,
                            width: 20,
                            thickness: 3,
                          ),
                          CustomText(
                            text: date,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CustomText(
                      text: price,
                      alignment: Alignment.topLeft,
                    )
                  ],
                ))),
      ),
    );
  }
}calcTotalPrice (List list) {
  num totalPrice = 0;
  list.forEach((element) {
    totalPrice += element.totalPrice;
  });
  return totalPrice;
}