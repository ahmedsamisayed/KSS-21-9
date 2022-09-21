import 'dart:async';

import 'package:flutter/material.dart';

import 'package:kss/view/user/order_validation/widgets/Custom_Card_validation.dart';

import '../../../core/utils/size_config.dart';

class OrderValidiaationTrueScreen extends StatefulWidget {
  const OrderValidiaationTrueScreen({Key? key}) : super(key: key);

  @override
  State<OrderValidiaationTrueScreen> createState() =>
      _OrderValidiaationTrueScreenState();
}

class _OrderValidiaationTrueScreenState
    extends State<OrderValidiaationTrueScreen> {
  void initState() {
    super.initState();
    StartTimer();
  }

  StartTimer() async {
    var duration = Duration(seconds: 1);
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
                  icon: Icons.check_rounded,
                  text1: "تم إستلام طلبك",
                ),
              ])),
        )));
  }
}
