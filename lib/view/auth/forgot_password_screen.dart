import 'package:flutter/material.dart';
import 'package:kss/core/utils/size_config.dart';

import '../../core/widgets/custom_Text_field_phone.dart';
import '../../core/widgets/custom_buttom.dart';
import '../../model/api/forgetPassword/forgetApi.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController phone = new TextEditingController();

  GlobalKey<FormState> formStateforgotPassword = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: formStateforgotPassword,
              child: ListView(children: [
                Container(
                  height: SizeConfig.screenheight! / 2.5,
                  child: Image.asset("lib/assets/images/forgot-password.jpg"),
                ),
                SizedBox(height: SizeConfig.screenheight! * .15),
                CustomTextFieldPhone(
                  myController: phone,
                ),
                SizedBox(height: SizeConfig.screenheight! * .1),
                CustomMaterialButtom(
                    text: "إرسال",
                    press: () {
                      if(phone.text.isNotEmpty) {
                        ForgetPassword(phone.text,context);
                      }else{
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
                                content: Text('الرقم غير صحيح')
                            ));
                      }
                      // Navigator.of(context).pushNamed('OTP Screen');
                    }),
              ]),
            ),
          ),
        ));
  }

}
