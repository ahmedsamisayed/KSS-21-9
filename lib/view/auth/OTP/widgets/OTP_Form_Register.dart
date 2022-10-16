import 'package:flutter/material.dart';
import 'package:kss/view/auth/OTP/widgets/Text_Form_Filed.dart';

import '../../../../core/const.dart';

import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_buttom.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../model/api/postOTPForForget/postOTPAPI.dart';
import 'biiuld_Timer.dart';
import 'package:telephony/telephony.dart';

final Telephony telephony = Telephony.instance;

FocusNode myFocusNode = new FocusNode();

class OtpFormRegister extends StatefulWidget {
  @override
  State<OtpFormRegister> createState() => _OtpFormRegisterState();
  var mj = buildTimer();
}

class _OtpFormRegisterState extends State<OtpFormRegister> {
  // ignore: prefer_const_constructors_in_immutables
  FocusNode? pin2FocusNode;

  FocusNode? pin3FocusNode;

  FocusNode? pin4FocusNode;
  TextEditingController? otp1 ;
  TextEditingController?  otp2 ;
  TextEditingController?  otp3 ;
  TextEditingController?  otp4;
  @override
  void initState() {
    super.initState();
    telephony.listenIncomingSms(
        onNewMessage: (SmsMessage message) {
          if (message.address == 'KSS') {
            setOTP(message.body ?? '');
          }
          print(message.body);
          print(message.address);
        },
        listenInBackground: false
    );
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    otp1 = TextEditingController(text: '');
    otp2 = TextEditingController(text: '');
    otp3 = TextEditingController(text: '');
    otp4 = TextEditingController(text: '');
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

  setOTP (String message) {
    String OTP  = '';
    int index = message.indexOf('follow:') + 9;
    OTP = message.substring(index,index + 4);
    print('0 ${OTP[0]}');
    print('1 ${OTP[1]}');
    print('2 ${OTP[2]}');
    print('3 ${OTP[3]}');
    setState ((){
      otp1?.text = OTP[0];
      otp2?.text = OTP[1];
      otp3?.text = OTP[2];
      otp4?.text = OTP[3];
    });
    PostOTP( OTP,  context);
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
                  controller: otp1,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                  autofocus: true,
                ),
                CustomTextFormField(
                  otp: true,
                  controller: otp2,
                  onChanged: (value) => nextField(value, pin3FocusNode),
                  focusNode: pin2FocusNode,
                ),
                CustomTextFormField(
                  otp: true,
                  controller: otp3,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                  focusNode: pin3FocusNode,
                ),
                CustomTextFormField(
                  otp: true,
                  controller: otp4,
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
                setState(() {

                });

                String finalOTP = '${otp1?.text}${otp2?.text}${otp3?.text}${otp4?.text}';

                PostOTP( finalOTP,  context);
                //Navigator.of(context).pushNamed('New Pass Screen');


              }),
        ],
      ),
    );
  }
}
