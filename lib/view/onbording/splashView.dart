import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/utils/size_config.dart';
import '../auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    StartTimer();
  }

  StartTimer() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, onbording);
  }

  onbording() {
    Navigator.of(context).pushNamed('onbording');
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SafeArea(

            child: Container(
              padding: EdgeInsets.all(30.30),
              // decoration: BoxDecoration(
              //  image: DecorationImage(
              // image: AssetImage(
              //   "lib/assets/images/logo-01.png",
              // ),
              // fit: BoxFit.fill)),
              child: Center(

                child: Image.asset("lib/assets/images/logo-01.png"),
              ),
            ),
          ),
        ));
  }
}
