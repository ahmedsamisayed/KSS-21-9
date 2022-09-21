import 'package:flutter/material.dart';
import 'package:kss/model/api/appConstants.dart';
import 'package:kss/model/api/infos/infosAPI.dart';
import 'package:kss/model/api/infos/infoResponseModule.dart';
import 'package:kss/view/user/Drower/offers/offers_screen.dart';
import 'package:kss/view/user/Drower/widgets/Custom_ListTitel.dart';

import '../../../core/const.dart';
import '../../../core/widgets/custom_text.dart';
import 'package:kss/core/widgets/Custom_FloatingActionButton.dart';

import '../BottomNavigationBarUser.dart';
import 'checkerFotLogout.dart';
import 'offers/checkForOffers.dart';
import 'offers/checkerForInfos.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Future<OfferResponse>? offerResult;

  @override
  Widget build(BuildContext context) {
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
        child: Row(children: [
          Container(
            color: Primarycolor,
            child: Drawer(
              child: ListView(
                children: [
                  Material(
                    color: Colors.white,
                    elevation: 10,
                    shadowColor: Color(0x802196F3),
                    child: UserAccountsDrawerHeader(
                      accountName:
                          CustomText(
                              text: AppConstants.userName == null
                                  ? "لم تقم بتعديل اسمك"
                                  : AppConstants.userName!,

                              fontSize: 20),
                      currentAccountPicture: CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.white,
                        // backgroundImage: NetworkImage(
                        //   "https://images.unsplash.com/photo-1594616838951-c155f8d978a0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
                        // ),
                      ),
                      decoration: BoxDecoration(color: Colors.white),
                      accountEmail: null,
                    ),
                  ),
                  CustomListTileOnTap(
                    text: "الرئيسية",
                    icon: Icons.home_outlined,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('Home Navigation User Screen');
                    },
                  ),
                  CustomListTileOnTap(
                    text: "الملف الشخصي",
                    icon: Icons.person_outline,
                    onTap: () {
                      Navigator.of(context).pushNamed('Profile Screen');
                    },
                  ),
                  CustomListTileOnTap(
                    text: "العروض",
                    icon: Icons.insert_drive_file_outlined,
                    onTap: () {
                      Navigator.of(context).push( MaterialPageRoute(
                          builder: (context) => CheckerForOfferScreen(

                          )));
                    },
                  ),
                  CustomListTileOnTap(
                    text: "تواصل معنا",
                    icon: Icons.phone_missed_outlined,
                    onTap: () {
                      Navigator.of(context).push( MaterialPageRoute(
                          builder: (context) => CheckerForInfoScreen(
                            selectedPage: 2,

                          )));
                    },
                  ),
                  CustomListTileOnTap(
                    text: "تسجيل خروج",
                    icon: Icons.exit_to_app,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CheckerForLogout()));
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            // padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: 40),
              child: CustomFloatingActionButton(
                press: () => Navigator.of(context).pushNamed('Home Navigation User Screen'),
                icon: Icon(Icons.close_rounded, color: Colors.black),
              ),
            ),
          ),
        ])));
  }

}
