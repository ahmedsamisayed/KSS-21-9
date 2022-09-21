import 'package:flutter/material.dart';
import 'package:kss/core/utils/size_config.dart';
import 'package:kss/core/widgets/custom_text.dart';

import '../../core/widgets/Custom_Text_Field.dart';

import '../../core/widgets/custom_buttom.dart';

class NewPassScreen extends StatefulWidget {
  const NewPassScreen({Key? key}) : super(key: key);

  @override
  State<NewPassScreen> createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> {
  TextEditingController password = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();

  GlobalKey<FormState> formStateNewPassword = new GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: formStateNewPassword,
              child: ListView(children: [
                Container(
                  height: SizeConfig.screenheight! / 2.5,
                  child: Image.asset("lib/assets/images/new_Password.jpg"),
                ),
                CustomText(
                  text: "أدخل كلمة المرور الجديدة",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.center,
                ),
                SizedBox(height: SizeConfig.screenheight! * .05),
                CustomTextField(
                  label: "كلمة المرور الجديدة",
                  myController: password,
                  hint: "أدخل كلمة المرور",
                ),
                CustomTextField(
                  label: "إعادة كلمة المرور",
                  myController: confirmpassword,
                  hint: "إعادة كلمة المرور",
                ),
                SizedBox(height: SizeConfig.screenheight! * .05),
                CustomMaterialButtom(
                    text: "تعيين",
                    press: () {
                      Navigator.of(context).pushNamed('Login Screen');
                    }),
              ]),
            ),
          ),
        ));
  }
}
