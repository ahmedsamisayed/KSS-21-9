import 'package:flutter/material.dart';
import 'package:kss/view/auth/OTP/widgets/Text_Form_Filed.dart';

import '../../../../core/const.dart';

import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_buttom.dart';
import '../../../../core/widgets/custom_text.dart';
import 'biiuld_Timer.dart';

FocusNode myFocusNode = new FocusNode();

class OtpForm extends StatefulWidget {
  @override
  State<OtpForm> createState() => _OtpFormState();
  var mj = buildTimer();
}

class _OtpFormState extends State<OtpForm> {
  // ignore: prefer_const_constructors_in_immutables
  FocusNode? pin2FocusNode;

  FocusNode? pin3FocusNode;

  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildTimer(),
          SizedBox(height: SizeConfig.screenheight! * .05),
          Container(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextFormField(
                  otp: true,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                  autofocus: true,
                ),
                CustomTextFormField(
                  otp: true,
                  onChanged: (value) => nextField(value, pin3FocusNode),
                  focusNode: pin2FocusNode,
                ),
                CustomTextFormField(
                  otp: true,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                  focusNode: pin3FocusNode,
                ),
                CustomTextFormField(
                  otp: true,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin4FocusNode!.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                  focusNode: pin4FocusNode,
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.screenheight! * .05),
          GestureDetector(
            onTap: () {
              // OTP code resend
              Navigator.pushNamed(context, "OTP Screen");
            },
            // child: CustomMaterialButtom(
            //     text: "إعادة إرسال",
            //     press: () {
            //       Navigator.of(context).pushNamed('OTP Screen');
            //
            //     }),
            child: CustomText(
              text: "إعادة إرسال",
              fontSize: 15,
              color: Primarycolor,
              alignment: Alignment.center,
            ),
          ),
          SizedBox(height: SizeConfig.screenheight! * .05),
          CustomMaterialButtom(
              text: "تأكيد",
              press: () {
                Navigator.of(context).pushNamed('New Pass Screen');
              }),
        ],
      ),
    );
  }
}
