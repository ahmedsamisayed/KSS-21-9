import 'package:flutter/material.dart';
import 'package:kss/core/utils/size_config.dart';
import 'package:kss/model/api/appConstants.dart';


import '../../../../../core/const.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../Details/details.dart';

class SubCatogresCard extends StatelessWidget {
  final Sub_Categories_Id;
  final Sub_Categories_Name;
  final Sub_Categories_Image;
  final Sub_Categories_press;
  final Sub_Categories_weight1;
  final Sub_Categories_weight2;
  final Sub_Categories_weight3;
  final Sub_Categories_weight1Price;
  final Sub_Categories_weight2Price;
  final Sub_Categories_weight3Price;
  final Sub_Categories_Head_Price;
  final Sub_Categories_Bowel_Price;
  
  bool? isVisible;
  // ignore: prefer_const_constructors_in_immutables
  SubCatogresCard({
    Key? key,
    this.isVisible,
    this.Sub_Categories_Id,
    this.Sub_Categories_Name,
    this.Sub_Categories_Image,
    this.Sub_Categories_press,
    this.Sub_Categories_weight1Price,
    this.Sub_Categories_weight2Price,
    this.Sub_Categories_weight3Price,
    this.Sub_Categories_weight1,
    this.Sub_Categories_weight2,
    this.Sub_Categories_weight3,
    this.Sub_Categories_Head_Price,
    this.Sub_Categories_Bowel_Price
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: SizeConfig.screenheight! / 4,
      child: Stack(children: [
        Container(
          //   width: SizeConfig.screenwidth! / 4,
          padding: EdgeInsets.symmetric(vertical: 0),
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new DetailsScreen(

                    ///pass value
                    Details_Sub_Categories_weight1Price: Sub_Categories_weight1Price,
                    Details_Sub_Categories_weight2Price: Sub_Categories_weight2Price,
                    Details_Sub_Categories_weight3Price: Sub_Categories_weight3Price,
                    Details_Sub_Categories_Name: Sub_Categories_Name,
                    Details_Sub_Categories_Image: Sub_Categories_Image,
                    Details_Sub_Categories_Weight1: Sub_Categories_weight1,
                    Details_Sub_Categories_Weight2: Sub_Categories_weight2,
                    Details_Sub_Categories_Weight3: Sub_Categories_weight3,
                    Details_Sub_Categories_Head_Price: Sub_Categories_Head_Price,
                    Details_Sub_Categories_Bowel_Price: Sub_Categories_Bowel_Price,
                ))),
            // onTap: Sub_Categories_press!,
            child: Container(
              // height: SizeConfig.screenheight! / ,
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
                          height: SizeConfig.screenheight! / 10,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Image.network("${AppConstants.productImageurl}/${Sub_Categories_Image!}"),
                            //Image.asset(Sub_Categories_Image!),
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenheight! * .02),
                        Container(
                          child: CustomText(
                            text: Sub_Categories_Name!,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            alignment: Alignment.center,
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
        Visibility(
          visible: isVisible!,
          child: Container(
            color: Colors.white.withOpacity(.5),
          ),
        )
      ]),
    );
  }
}
