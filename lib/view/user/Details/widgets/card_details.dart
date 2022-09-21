import 'package:flutter/material.dart';
import 'package:kss/core/utils/size_config.dart';

import '../../../../../core/const.dart';
import '../../../../../core/widgets/custom_text.dart';

class SubCatogresCard extends StatelessWidget {
  final String text;
  final String? image;
  final VoidCallback? press;

  // ignore: prefer_const_constructors_in_immutables
  SubCatogresCard({
    Key? key,
    this.text = "",
    this.press,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: InkWell(
        onTap: press!,
        child: Container(
          height: SizeConfig.screenheight! / 3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Primarycolor,
                width: 2,
              )),
          child: Material(
              color: Colors.white,
              elevation: 10.0,
              borderRadius: BorderRadius.circular(10.0),
              shadowColor: Color(0x802196F3),
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Container(
                      height: SizeConfig.screenheight! / 5,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Image.asset(image!),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenheight! * .02),
                    CustomText(
                      text: text,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
