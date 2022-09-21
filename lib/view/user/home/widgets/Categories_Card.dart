import 'package:flutter/material.dart';
import 'package:kss/core/const.dart';
import 'package:kss/core/utils/size_config.dart';
import 'package:kss/core/widgets/custom_text.dart';

import '../../../../../core/widgets/custom_listTile.dart';

class CategoriesCard extends StatelessWidget {
  final String? Categories_Id;
  final String? Categories_Name;
  final VoidCallback? Categories_Press;
  final String? Categories_Image;

  // ignore: prefer_const_constructors_in_immutables
  CategoriesCard({
    Key? key,
    this.Categories_Id,
    this.Categories_Name,
    this.Categories_Press,
    this.Categories_Image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: Categories_Press,
      child: Material(
          color: Colors.white,
          elevation: 5,
          borderRadius: BorderRadius.circular(10.0),
          shadowColor: Color(0x802196F3),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage(Categories_Image!),
                      fit: BoxFit.cover)),
              height: SizeConfig.screenheight! / 4.5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.30),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: CustomText(
                      text: Categories_Name!,
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.center,
                    )),
              ))),
    );
  }
}
