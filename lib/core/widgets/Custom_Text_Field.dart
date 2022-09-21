import 'package:flutter/material.dart';

import '../const.dart';

FocusNode myFocusNode = new FocusNode();

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final Alignment alignment;
  final obscureText;
  final maxline;
  final TextEditingController myController;
  final myValidator;
  final ValueSetter? onSaved;
  final ValueSetter? onChanged;
  final Widget? suffexIcon;

  // ignore: prefer_const_constructors_in_immutables
  CustomTextField({
    Key? key,
    this.label = "",
    this.hint = "",
    this.keyboardType = TextInputType.text,
    this.alignment = Alignment.topRight,
    this.obscureText = false,
    this.maxline = 1,
    required this.myController,
    this.myValidator,
    this.onSaved,
    this.onChanged,
    this.suffexIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        TextFormField(
          //  suffexIcon: suffexIcon,
          onSaved: onSaved,
          controller: myController,
          validator: myValidator,
          keyboardType: keyboardType,
          obscureText: obscureText,
          cursorColor: Primarycolor,
          maxLines: maxline,
          decoration: InputDecoration(
            suffixIcon: suffexIcon,
            labelStyle: TextStyle(
                color: myFocusNode.hasFocus ? Primarycolor : Colors.black),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Primarycolor),
            ),
            labelText: label,
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
