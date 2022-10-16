import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kss/core/utils/size_config.dart';
import 'package:kss/model/api/appConstants.dart';
import 'package:kss/model/api/login/loginResponseModule.dart';

import '../../core/const.dart';
import '../../core/widgets/Custom_Text_Field.dart';
import '../../core/widgets/custom_Text_field_phone.dart';
import '../../core/widgets/custom_buttom.dart';
import '../../core/widgets/custom_flatbuttom.dart';
import '../../model/api/login/loginAPI.dart';
import '../user/Drower/profile/widgets/checkForUserData.dart';
import 'checkForLogin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController password = new TextEditingController();

  TextEditingController phone = new TextEditingController();

  GlobalKey<FormState> formStatelogin = new GlobalKey<FormState>();
  bool _isObscure = false;


  @override
  Widget build(BuildContext context) {
    SizeConfig();
    return WillPopScope(
        onWillPop: () async {
      final shouldPop = await showDialog<bool>(
        context: context,
        builder: (context) {
          return exit(0);
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
            child: Form(
              key: formStatelogin,
              child: ListView(children: [
                Container(
                  padding: EdgeInsets.all(70),
                  height: SizeConfig.screenheight! / 2.5,
                  child: Image.asset("lib/assets/images/logo-01.png"),
                ),
                CustomTextFieldPhone(
                  myController: phone,
                ),
                CustomTextField(
                    label: "كلمة المرور",
                    myController: password,
                    hint: "أدخل كلمة المرور",
                    suffexIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Primarycolor,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                    obscureText: !_isObscure),
                CustomfaltlButtom(
                  text1: "نسيت كلمة المرور؟",
                  press: () {
                    Navigator.of(context).pushNamed('Forgot Password Screen');
                  },
                ),
                CustomMaterialButtom(
                    text: "دخول",
                    press: () {
                      loginUser(phone.text, password.text, context);

                      // setState(() {
                      //
                      // });
                      //loginResult = loginUser(phone.text, password.text);
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CheckForLogin(
                      //   phone: phone.text,
                      //   passWord: password.text
                      //
                      //
                      // )));

                    }),
                CustomfaltlButtom(
                  text: "ليس لديك حساب؟",
                  text1: "إنشاء حساب جديد",
                  press: () {
                    Navigator.of(context).pushNamed('Registeration Screen');
                  },
                )
              ]),
            ),
          ),
        )));
  }

}
