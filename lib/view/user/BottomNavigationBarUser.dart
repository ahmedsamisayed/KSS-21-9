import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:kss/view/user/basket/widgets/basketlist.dart';
import 'package:kss/view/user/order/order.dart';

import '../../core/const.dart';

import '../../core/utils/size_config.dart';
import 'basket/basket.dart';
import 'home/Home_csreen.dart';
import 'order/checker.dart';

class HomeNavigationUserPage extends StatefulWidget {
  @override
  _HomePageUserState createState() => _HomePageUserState();
}

class _HomePageUserState extends State<HomeNavigationUserPage> {
  int _selectedIndex = 1;
  int count = 3;
  //int Num_Order = 2;
  final _widgetOptions = [
    BasketScreen(), HomeScreen(), CheckerForOrderScreen(),
    //page name
  ];
  // get Num_Order => MyListBasket.basketItems.length;
  get Num_Order {
    setState(() {
      MyListBasket.basketItems.length;
    });
    return MyListBasket.basketItems.length;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig();
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ConvexAppBar.badge(
        {0: '$Num_Order'},
        badgeMargin: EdgeInsets.only(bottom: 15, left: 10),
        initialActiveIndex: 1,
        height: MediaQuery.of(context).size.height * 0.07,
        color: Colors.grey,
        backgroundColor: Colors.white,
        activeColor: Primarycolor,
        items: [
          TabItem(
            icon: Icons.shopping_cart_checkout_outlined,
            title: "السلة",
          ),
          TabItem(
            icon: Icons.home_outlined,
            title: "الرئيسية",
          ),
          TabItem(
            icon: Icons.article_outlined,
            title: "طلباتي",
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
