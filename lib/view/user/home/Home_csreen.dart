import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kss/core/widgets/custom_text.dart';
import 'package:kss/model/api/fullCowDetails.dart';
import 'package:kss/model/api/products/productAPI.dart';

import 'package:kss/view/user/Drower/MyDrower.dart';
import 'package:kss/core/widgets/Custom_FloatingActionButton.dart';
import 'package:kss/view/user/home/widgets/Categories_Card.dart';

import '../../../core/const.dart';
import '../../../core/utils/size_config.dart';
import '../../../model/api/products/productResponse.dart';
import 'checkerForProducts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<ProductResponse>? productResult;

  @override
  Widget build(BuildContext context) {
    SizeConfig();
    return WillPopScope(
        onWillPop: () async {
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return exit(0);
            },
          );
          return shouldPop!;
        },
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                //drawer: Container(color: Colors.amber, child: MyDrawer()),
                //    appBar: AppBar(),
                body: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: ListView(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomFloatingActionButton(
                            press: () {
                              Navigator.of(context).pushNamed('MyDrawer');
                            },
                            icon:
                                Icon(Icons.dehaze_rounded, color: Colors.grey),
                          ),
                          CustomText(
                            text: "الأقسام",
                            fontSize: 20,
                            alignment: Alignment.center,
                          ),
                          Material(
                            color: Colors.white,
                            elevation: 10,
                            borderRadius: BorderRadius.circular(50.0),
                            shadowColor: Color(0x802196F3),
                            child: IconButton(
                              color: Colors.black,
                              icon: Icon(
                                Icons.account_circle_outlined,
                                size: 30,
                              ),
                              // CircleAvatar(
                              //   radius: 50.0,
                              //   backgroundImage: NetworkImage(
                              //     "https://images.unsplash.com/photo-1594616838951-c155f8d978a0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
                              //   ),
                              // ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('Profile Screen');
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.screenheight! * .02),
                      CategoriesCard(
                        Categories_Id: "1",
                        Categories_Image: "lib/assets/images/cow.png",
                        Categories_Name: "أبقار",
                        Categories_Press: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CheckerForProductScreen(
                                    selectedCategory: '1',
                                  )));

                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(
                          //       duration: const Duration(milliseconds: 2000),
                          //       backgroundColor: Color(0xffd0c9c0),
                          //       margin: const EdgeInsets.all(100.0),
                          //       padding: const EdgeInsets.all(10),
                          //       behavior: SnackBarBehavior.floating,
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(150.0),
                          //       ),
                          //       content: buildProductFutureBuilder(),
                          //     ));
                          // Navigator.of(context).pushNamed('Sub Categories Cow');
                        },
                      ),
                      SizedBox(height: SizeConfig.screenheight! * .02),
                      CategoriesCard(
                        Categories_Id: "2",
                        Categories_Image: "lib/assets/images/sheep.png",
                        Categories_Name: "خراف",
                        Categories_Press: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CheckerForProductScreen(
                                    selectedCategory: '2',
                                  )));
                          // Navigator.of(context).pushNamed('Sub Categories Sheep');
                        },
                      ),
                      SizedBox(height: SizeConfig.screenheight! * .02),
                      CategoriesCard(
                        Categories_Id: "3",
                        Categories_Image: "lib/assets/images/camel-04.png",
                        Categories_Name: "أبل",
                        Categories_Press: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CheckerForProductScreen(
                                    selectedCategory: '3',
                                  )));
                          // Navigator.of(context).pushNamed('Sub Categories Camel');
                        },
                      )
                    ])))));
  }
}
