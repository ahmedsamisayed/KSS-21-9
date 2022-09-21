import 'dart:async';

import 'package:flutter/material.dart';

import 'package:kss/view/user/order_validation/widgets/Custom_Card_validation.dart';

import '../../../core/utils/size_config.dart';

class OrderValidiaationfolseScreen extends StatefulWidget {
  const OrderValidiaationfolseScreen({Key? key}) : super(key: key);

  @override
  State<OrderValidiaationfolseScreen> createState() =>
      _OrderValidiaationfolseScreenState();
}

class _OrderValidiaationfolseScreenState
    extends State<OrderValidiaationfolseScreen> {
  void initState() {
    super.initState();
    StartTimer();
  }

  StartTimer() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, home);
  }

  home() {
    Navigator.of(context).pushNamed('Home Navigation User Screen');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 200),
              child: ListView(children: [
                CustomCardVaildation(
                  icon: Icons.clear_rounded,
                  text1: "عفواً",
                  text: "لا يمكن قبول طلبك الأن",
                ),
              ])),
        )));
  }
}
