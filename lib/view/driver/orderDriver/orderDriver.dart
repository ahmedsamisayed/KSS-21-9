import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/const.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_text.dart';
import 'OldOreder.dart';
import 'newOrer.dart';

class OrderDriverScreen extends StatefulWidget {
  @override
  _OrderDriverScreenState createState() => _OrderDriverScreenState();
}

class _OrderDriverScreenState extends State<OrderDriverScreen> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: CustomText(
                text: "قائمة الطلبات",
                alignment: Alignment.center,
              ),
            ),
            body: TabBarView(children: [
              Center(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Column(children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 1.6,
                      child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, i) {
                            return NewOrderItem("أمنية عبد الحفيظ", "10");
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
                    Container(
                      height: MediaQuery.of(context).size.height / 1.6,
                      child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, i) {
                            return OldOrderItem(
                                "أمنية عبد الحفيظ", "10", "جبرة");
                          }),
                    ),
                  ]),
                ),
              )
            ]),

            //////////////////NavBar//////////////////////////
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(20),
              child: TabBar(
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Primarycolor, width: 5),
                ),
                unselectedLabelColor: Colors.grey,
                labelColor: Primarycolor,
                tabs: [
                  Tab(
                      child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.article_outlined),
                            Text(
                              "طلبات حديثة",
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
                  Tab(
                      child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.article_outlined),
                            Text(
                              "طلبات تم تنفيذها",
                            )
                          ],
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      );
}
