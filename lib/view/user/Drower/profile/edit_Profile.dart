import 'package:flutter/material.dart';
import 'package:kss/core/utils/size_config.dart';
import 'package:kss/model/api/appConstants.dart';
import 'package:kss/view/user/Drower/profile/widgets/checkForUserData.dart';
import 'package:kss/view/user/Drower/profile/widgets/profilePic.dart';

import '../../../../core/widgets/Custom_FloatingActionButton.dart';
import '../../../../core/widgets/Custom_Text_Field.dart';
import '../../../../core/widgets/custom_buttom.dart';

class EditProdileScreen extends StatefulWidget {
  const EditProdileScreen({Key? key}) : super(key: key);

  @override
  State<EditProdileScreen> createState() => _EditProdileScreenState();
}

class _EditProdileScreenState extends State<EditProdileScreen> {
  TextEditingController name = new TextEditingController(text: '${AppConstants.userName} ');
  TextEditingController phone = new TextEditingController();
  TextEditingController email = new TextEditingController(text: AppConstants.userEmail);

  GlobalKey<FormState> formStatelogin = new GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ListView(children: [
              CustomFloatingActionButton(
                press: () => Navigator.pop(context, true),
                icon: Icon(Icons.chevron_left_rounded, color: Colors.black),
              ),
              SizedBox(height: SizeConfig.screenheight! * .05),
              SizedBox(height: SizeConfig.screenheight! * .05),
              CustomTextField(
                label: "اسم المستخدم",
                myController: name,
                hint: AppConstants.userName == null
                    ? "لم تقم بتعديل اسمك"
                    : AppConstants.userName!,
              ),
              SizedBox(height: SizeConfig.screenheight! * .05),
              // CustomTextField(
              //   label: "رقم الهاتف",
              //   myController: phone,
              //   keyboardType: TextInputType.phone,
              //   hint: "رقم الهاتف",
              // ),
              CustomTextField(
                label: "البريد الإلكتروني",
                myController: email,
                keyboardType: TextInputType.emailAddress,
                hint: AppConstants.userEmail == null
                    ? "لم تقم بتعديل بريدك الالكتروني"
                    : AppConstants.userEmail!,
              ),
              SizedBox(height: SizeConfig.screenheight! * .05),
              CustomMaterialButtom(
                  text: "حفظ",
                  press: () {
                    if ([name.text,email.text
                    ].any((x) => x == '')
                    ){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
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
                            content: Text('لم تقم بملء كل الخانات المطلوبة' ,
                              style: TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ));
                    }
                    else {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckerForUpdateUserData(
                        name: name.text,
                        email: email.text,
                      )
                      ));
                    }



                  }),
            ]),
          ),
        ));
  }
}
