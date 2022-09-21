import 'package:flutter/material.dart';

import 'package:kss/core/utils/size_config.dart';
import 'package:kss/core/widgets/custom_text.dart';
import 'package:kss/model/api/appConstants.dart';
import 'package:kss/view/user/Drower/profile/widgets/ImageProfile.dart';

import '../../../../core/widgets/Custom_FloatingActionButton.dart';
import 'package:kss/core/const.dart';

import '../../../../core/widgets/custom_buttom.dart';
import '../../BottomNavigationBarUser.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig();
    return WillPopScope(
        onWillPop: () async {
      final shouldPop = await showDialog<bool>(
        context: context,
        builder: (context) {
          return HomeNavigationUserPage();
        },
      );
      return shouldPop!;
    },
    child:
      Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stack(children: [
            Container(
              height: SizeConfig.screenheight! / 2.5,
              //   color: Primarycolor,
              decoration: BoxDecoration(
                color: Primarycolor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomFloatingActionButton(
                          press: () => Navigator.of(context).pushNamed('Home Navigation User Screen'),
                          icon: Icon(Icons.chevron_left_rounded,
                              color: Colors.black),
                        ),
                        CustomText(
                          text: "حسابي",
                          fontSize: 20,
                          color: Colors.white,
                        )
                      ],
                    ),
                    SizedBox(height: SizeConfig.screenheight! * .22),
                    ImageProfile(),
                    SizedBox(height: SizeConfig.screenheight! * .02),
                    CustomText(
                        text: AppConstants.userName == null
                            ? "لم تقم بتعديل اسمك"
                            : AppConstants.userName!,
                        fontSize: 20,
                        color: Colors.black54),
                    SizedBox(height: SizeConfig.screenheight! * .02),
                    CustomText(
                        text: "${AppConstants.userPhone}",
                        fontSize: 20, color: Colors.black54),
                    SizedBox(height: SizeConfig.screenheight! * .02),
                    CustomText(
                        text: AppConstants.userEmail == null
                            ? "لم تقم بتعديل الإيميل"
                            : AppConstants.userEmail!,
                        fontSize: 20,
                        color: Colors.black54),
                    SizedBox(height: SizeConfig.screenheight! * .02),
                    CustomMaterialButtom(
                        color: Colors.grey.withOpacity(.3),
                        colorText: Colors.black,
                        text: "تعديل الملف الشخصي",
                        press: () {
                          Navigator.of(context)
                              .pushNamed('Edit Prodile Screen');
                        }),
                  ]),
            ),
          ]),
        )));
  }
}
