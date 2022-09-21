import 'package:flutter/material.dart';
import 'package:kss/core/utils/size_config.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../const.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';

FocusNode myFocusNode = new FocusNode();

class CustomTextFieldPhone extends StatelessWidget {
  final TextInputType keyboardType;
  final Alignment alignment;
  final obscureText;
  final maxline;
  final TextEditingController myController;
  final myValidator;
  final String phoneNumber;

  // ignore: prefer_const_constructors_in_immutables
  CustomTextFieldPhone({
    Key? key,
    this.keyboardType = TextInputType.phone,
    this.alignment = Alignment.topRight,
    this.obscureText = false,
    this.maxline = 9,
    required this.myController,
    this.myValidator,
    this.phoneNumber = "45",
  }) : super(key: key);
  String initialCountry = 'SUD';
  PhoneNumber number = PhoneNumber(isoCode: 'SUD');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InternationalPhoneNumberInput(
            countries: ['SD'],
            maxLength: 9,
            onInputChanged: (PhoneNumber number) {
              print(number.phoneNumber);
            },
            onInputValidated: (bool value) {
              print(value);
            },
            //  selectorConfig: SelectorConfig(
            //    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            //  ),
            spaceBetweenSelectorAndTextField: 10,
            hintText: "رقم الهاتف",
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            // selectorTextStyle: TextStyle(
            //     color: myFocusNode.hasFocus ? Primarycolor : Colors.black),
            initialValue: number,
            textFieldController: myController,
            formatInput: false,
            keyboardType:
                TextInputType.numberWithOptions(signed: true, decimal: true),
            onSaved: (PhoneNumber number) {
              print('On Saved: $number');

            },
          ),

          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
