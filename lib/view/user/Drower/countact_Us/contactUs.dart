import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

//import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:kss/core/utils/size_config.dart';
import 'package:kss/model/api/appConstants.dart';
import 'package:kss/view/user/Drower/countact_Us/widgets/Custom_Card_Border.dart';
//import 'package:kss/view/user/Drower/countact_Us/widgets/cUstom_Card_Border.dart';

import '../../../../core/widgets/Custom_FloatingActionButton.dart';
import 'package:kss/core/const.dart';

import '../MyDrower.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  var contactPhone;
  var contactEmail;

  ContactUsScreen({Key? key, this.contactPhone, this.contactEmail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig();
    return WillPopScope(
        onWillPop: () async {
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return MyDrawer();
            },
          );
          return shouldPop!;
        },
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ListView(children: [
                  CustomFloatingActionButton(
                    press: () => Navigator.of(context).pushNamed('MyDrawer'),
                    icon: Icon(Icons.chevron_left_rounded, color: Colors.black),
                  ),
                  Container(
                    height: SizeConfig.screenheight! / 2.5,
                    child: Image.asset(
                        "lib/assets/images/Navigation Icon_CONTACT US.png"),
                  ),
                  SizedBox(height: SizeConfig.screenheight! * .05),
                  CustomCardBorder(
                    press: () async {
                      if (await canLaunchUrl(Uri.parse('tel:${contactPhone}'))) {
                        launchUrl(Uri.parse('tel:${contactPhone}'));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(milliseconds: 2000),
                            backgroundColor: Color(0xffd0c9c0),
                            margin: const EdgeInsets.all(100.0),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            content: Text('can_not_launch ${contactPhone}')));

                        //showCustomSnackBar('${'can_not_launch'.tr} ${Get.find<SplashController>().configModel.phone}');
                      }
                    },
                    text: contactPhone,
                    icon: Icon(
                      Icons.phone,
                      color: Primarycolor,
                      size: 30,
                    ),
                  ),
                  CustomCardBorder(
                    press: () async {
                      if (await canLaunchUrl(Uri.parse('mailto:${contactEmail}'))) {
                        launchUrl(Uri.parse('mailto:${contactEmail}'));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(milliseconds: 2000),
                            backgroundColor: Color(0xffd0c9c0),
                            margin: const EdgeInsets.all(100.0),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            content: Text('can_not_launch ${contactEmail}')));

                        //showCustomSnackBar('${'can_not_launch'.tr} ${Get.find<SplashController>().configModel.phone}');
                      }
                    },
                    text: contactEmail,
                    icon: Icon(
                      Icons.email,
                      color: Primarycolor,
                      size: 30,
                    ),
                  )
                ]),
              ),
            )));
  }
}

_callNumber(int x) async {
  // await launchUrl(Uri.parse("tel:${x}"));
  String number = '${x}'; //set the number here
  // ignore: unused_local_variable
  bool? res = await FlutterPhoneDirectCaller.callNumber('${x}');
}
