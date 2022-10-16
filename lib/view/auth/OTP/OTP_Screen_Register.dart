import 'package:flutter/material.dart';
import 'package:kss/core/utils/size_config.dart';
import 'package:kss/core/widgets/custom_text.dart';
import 'package:kss/view/auth/OTP/widgets/OTP_Form.dart';
import 'package:kss/view/auth/OTP/widgets/OTP_Form_Register.dart';

import '../../../core/widgets/custom_buttom.dart';

class OTPScreenRegister extends StatefulWidget {
  const OTPScreenRegister({Key? key}) : super(key: key);

  @override
  State<OTPScreenRegister> createState() => _OTPScreenRegisterState();
}

class _OTPScreenRegisterState extends State<OTPScreenRegister> {
  TextEditingController password = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();
  TextEditingController phone = new TextEditingController();

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
              Container(
                height: SizeConfig.screenheight! / 2.5,
                child: Image.asset("lib/assets/images/new_Password.jpg"),
              ),
              CustomText(
                text: "أدخل رمز التحقق الذي تم إرساله لك",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                alignment: Alignment.center,
              ),
              SizedBox(height: SizeConfig.screenheight! * .05),
              Directionality(
                  textDirection: TextDirection.ltr,
                  child: OtpFormRegister()),
              // OtpForm()
            ]),
          ),
        ));
  }
}
