import 'package:flutter/material.dart';

import '../../../../core/const.dart';
import '../../../../core/utils/size_config.dart';

FocusNode myFocusNode = new FocusNode();

class CustomTextFormField extends StatelessWidget {
  final ValueSetter? onChanged;
  final bool autofocus;
  FocusNode? focusNode;
  bool otp;
  TextEditingController? controller;
  // ignore: prefer_const_constructors_in_immutables
  CustomTextFormField({
    Key? key,
    this.onChanged,
    this.controller,
    this.otp = false,
    this.autofocus = false,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: otp ? SizeConfig.screenheight! * .06 : SizeConfig.screenheight! * .08,
      child: TextFormField(
          autofocus: autofocus,
          focusNode: focusNode,
          controller: otp ? controller : TextEditingController(text: ''),
          style: TextStyle(fontSize: 20),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            labelStyle: TextStyle(
                color: myFocusNode.hasFocus ? Primarycolor : Colors.black),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Primarycolor),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Primarycolor)),
          ),
          onChanged: onChanged),
    );
  }
}
