import 'package:flutter/material.dart';

import 'package:kss/core/utils/size_config.dart';
import 'package:kss/core/widgets/custom_text.dart';

import 'package:kss/view/user/Drower/offers/widgets/Custom_Card.dart';

import '../../../../core/widgets/Custom_FloatingActionButton.dart';
import '../MyDrower.dart';

class OffersScreen extends StatelessWidget {
  //const OffersScreen({Key? key}) : super(key: key);
  var OffersList;
  OffersScreen(
      {
     this.OffersList
}
      );
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
    child:
      Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ListView(children: [
              Row(
                children: [
                  CustomFloatingActionButton(
                    press: () =>Navigator.of(context)
                        .pushNamed('MyDrawer'),
                    icon: Icon(Icons.chevron_left_rounded, color: Colors.black),
                  ),
                  SizedBox(
                    width: SizeConfig.screenwidth! * .2,
                  ),
                  CustomText(
                    text: "العروض",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              // SizedBox(
              //   height: SizeConfig.screenheight! * .3,
              // ),
              Container(
                height: SizeConfig.screenheight! / 1,
                child: OffersList.length == 0
                    ? Text(
                      'عفوا لا توجد عروض في الوقت الحالي . الرجاء العودة لاحقا',
                      style: TextStyle(
                        fontFamily: "Tajawal",
                        fontSize: 20,
                      ),
                    )
                    :
                ListView.builder(
                    itemCount: OffersList.length,
                    itemBuilder: (context, i) {
                      return CustomCard(
                        text: """${OffersList[i].off}""",
                      );
                    }),
              ),
            ]),
          ),
        )));
  }
}
