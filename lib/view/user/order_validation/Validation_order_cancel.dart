import 'dart:async';

import 'package:flutter/material.dart';

import 'package:kss/view/user/order_validation/widgets/Custom_Card_validation.dart';

import '../../../core/utils/size_config.dart';

class ValidationOrderCancelScreen extends StatefulWidget {
  const ValidationOrderCancelScreen({Key? key}) : super(key: key);

  @override
  State<ValidationOrderCancelScreen> createState() =>
      _ValidationOrderCancelScreenState();
}

class _ValidationOrderCancelScreenState
    extends State<ValidationOrderCancelScreen> {
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
                  icon: Icons.check_rounded,
                  text1: "تم إلغاء الطلب بنجاح",
                ),
              ])),
        )));
  }
}
