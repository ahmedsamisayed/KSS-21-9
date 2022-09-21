import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kss/core/widgets/custom_listTile.dart';
import 'package:kss/core/widgets/custom_text.dart';
import 'package:kss/model/Categories.dart';

import 'package:kss/view/user/Drower/MyDrower.dart';
import 'package:kss/core/widgets/Custom_FloatingActionButton.dart';
import 'package:kss/view/user/basket/basket.dart';
import 'package:kss/view/user/basket/widgets/basketlist.dart';
import 'package:kss/view/user/basket/widgets/myBasket.dart';
import 'package:kss/view/user/basket/widgets/suborder.dart';

import '../../../core/const.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/widgets/custom_buttom.dart';
import '../../../model/api/appConstants.dart';
//import 'dart:convert';

class DetailsScreen extends StatefulWidget {
  final Details_Sub_Categories_Id;
  final Details_Sub_Categories_Name;
  final Details_Sub_Categories_Image;
  final Details_Sub_Categories_weight1Price;
  final Details_Sub_Categories_weight2Price;
  final Details_Sub_Categories_weight3Price;
  var Details_Sub_Categories_Head_Status;
  var Details_Sub_Categories_Bowel_Status;
  var Details_Sub_Categories_Sub_Order_Quantity;
  var Details_Sub_Categories_Final_price;
  var Details_Sub_Categories_Selected_Weight;
  var Details_Sub_Categories_Weight1;
  var Details_Sub_Categories_Weight2;
  var Details_Sub_Categories_Weight3;
  var Details_Sub_Categories_Head_Price;
  var Details_Sub_Categories_Bowel_Price;

  DetailsScreen(
      {Key? key,
      this.Details_Sub_Categories_Id,
      this.Details_Sub_Categories_Name,
      this.Details_Sub_Categories_Image,
      this.Details_Sub_Categories_weight1Price,
      this.Details_Sub_Categories_weight2Price,
      this.Details_Sub_Categories_weight3Price,
      this.Details_Sub_Categories_Bowel_Status,
      this.Details_Sub_Categories_Head_Status,
      this.Details_Sub_Categories_Sub_Order_Quantity,
      this.Details_Sub_Categories_Final_price,
      this.Details_Sub_Categories_Selected_Weight,
      this.Details_Sub_Categories_Weight1,
        this.Details_Sub_Categories_Weight2,
        this.Details_Sub_Categories_Weight3,
        this.Details_Sub_Categories_Head_Price,
        this.Details_Sub_Categories_Bowel_Price
      });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  GlobalKey<FormState> formStateDetails = new GlobalKey<FormState>();
  TextEditingController inputController = new TextEditingController();

  String _selectedHead = ' ';

  String _selectedBowel = ' ';
  String _selectedWeight = ' ';
  double weightPrice = 0.0;
  double _add = 0.0;
  double headprice = 0.0;
  double bowelprice = 0.0;
  String b = '1';
  String valueWeight = '';
  String valueHead = '';
  String valueBowel = '';

  counting() {
    setState(() {
      b = inputController.text;
    });
  }

  int get quan {
    int c = int.parse(b);
    return c;
  }
  get weight1 {
    double a1 = widget.Details_Sub_Categories_Weight1;
    return a1;
  }
  get weight2 {
    double a1 = widget.Details_Sub_Categories_Weight2;
    return a1;
  }
  get weight3 {
    double a1 = widget.Details_Sub_Categories_Weight3;
    return a1;
  }
  get headPrice {
    double a1 = widget.Details_Sub_Categories_Head_Price;
    return a1;
  }
  get BowelPrice {
    double a1 = widget.Details_Sub_Categories_Bowel_Price;
    return a1;
  }

  get weight1Price {
    double a1 = widget.Details_Sub_Categories_weight1Price;
    return a1;
  }

  get weight2Price {
    double a1 = widget.Details_Sub_Categories_weight2Price;
    return a1;
  }

  get weight3Price {
    double a1 = widget.Details_Sub_Categories_weight3Price;
    return a1;
  }

  // }
  calculate(valu, valu2, valu3, b) {
    if (valu == '${widget.Details_Sub_Categories_Weight1}  كيلو') {
      weightPrice = widget.Details_Sub_Categories_weight1Price;
      if (valu2 == 'بدون رأس') {
        headprice = (weightPrice * widget.Details_Sub_Categories_Head_Price) / 100;
      } else {
        headprice = 0;
      }
      if (valu3 == 'بدون أحشاء') {
        bowelprice = (weightPrice * widget.Details_Sub_Categories_Bowel_Price) / 100;
      } else {
        bowelprice = 0;
      }
    } else if (valu == '${widget.Details_Sub_Categories_Weight2}  كيلو') {
      weightPrice = widget.Details_Sub_Categories_weight2Price;
      if (valu2 == 'بدون رأس') {
        headprice = (weightPrice * widget.Details_Sub_Categories_Head_Price) / 100;
      } else {
        headprice = 0;
      }
      if (valu3 == 'بدون أحشاء') {
        bowelprice = (weightPrice * widget.Details_Sub_Categories_Bowel_Price) / 100;
      } else {
        bowelprice = 0;
      }
    } else if (valu == '${widget.Details_Sub_Categories_Weight3}  كيلو') {
      weightPrice = widget.Details_Sub_Categories_weight3Price;
      if (valu2 == 'بدون رأس') {
        headprice = (weightPrice * widget.Details_Sub_Categories_Head_Price) / 100;
      } else {
        headprice = 0;
      }
      if (valu3 == 'بدون أحشاء') {
        bowelprice = (weightPrice * widget.Details_Sub_Categories_Bowel_Price) / 100;
      } else {
        bowelprice = 0;
      }
    }
    _add = weightPrice - headprice - bowelprice;
    int x = int.parse(b);
    _add = _add * x.toDouble();
  }
  @override
  void initState() {
    valueWeight = '${widget.Details_Sub_Categories_Weight1}  كيلو';
    valueHead = 'شامل الرأس';
    valueBowel = 'شامل الأحشاء';
    _selectedWeight= valueWeight;
    _selectedHead = valueHead;
    _selectedBowel = valueBowel;
    calculate(
        valueWeight, valueHead, valueBowel, b);


    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    SizeConfig();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            drawer: Container(color: Colors.amber, child: MyDrawer()),
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ListView(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomFloatingActionButton(
                        press: () => Navigator.pop(context, true),
                        icon: Icon(Icons.chevron_left_rounded,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Form(
                    key: formStateDetails,
                    child: Column(
                      children: [
                        Container(
                          height: SizeConfig.screenheight! / 4,
                          child:
                              Image.network("${AppConstants.productImageurl}/${widget.Details_Sub_Categories_Image!}"),
                        ),
                        SizedBox(height: SizeConfig.screenheight! * .02),
                        Material(
                          color: Colors.white,
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(10.0),
                          shadowColor: Color(0x802196F3),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Column(
                              children: [
                                CustomText(
                                  text: widget.Details_Sub_Categories_Name,
                                  //  text: "عجل كامل ",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                    height: SizeConfig.screenheight! * .02),
                                CustomText(
                                  text: "الوزن",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        children: [
                                          Radio<String>(
                                            value: '${widget.Details_Sub_Categories_Weight1}  كيلو',
                                            groupValue: _selectedWeight,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedWeight = value!;
                                                valueWeight = value;
                                                calculate(
                                                    valueWeight, valueHead, valueBowel, b);
                                              });
                                            },
                                            activeColor: Primarycolor,
                                          ),
                                          CustomText(
                                              text:
                                                  ' ${widget.Details_Sub_Categories_Weight1} كيلو($weight1Price جنيه)'),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(children: [
                                        Radio<String>(
                                          value: '${widget.Details_Sub_Categories_Weight2}  كيلو',
                                          groupValue: _selectedWeight,
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedWeight = value!;
                                              valueWeight = value;
                                              calculate(valueWeight, valueHead, valueBowel, b);
                                            });
                                          },
                                          activeColor: Primarycolor,
                                        ),
                                        CustomText(
                                          text: ' ${widget.Details_Sub_Categories_Weight2} كيلو($weight2Price جنيه)',
                                        ),
                                      ]),
                                    ),
                                    Container(
                                      child: Row(children: [
                                        Radio<String>(
                                          value: '${widget.Details_Sub_Categories_Weight3}  كيلو',
                                          groupValue: _selectedWeight,
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedWeight = value!;
                                              valueWeight = value;
                                              calculate(valueWeight, valueHead, valueBowel, b);
                                            });
                                          },
                                          activeColor: Primarycolor,
                                        ),
                                        CustomText(
                                          text: ' ${widget.Details_Sub_Categories_Weight3} كيلو($weight3Price جنيه)',
                                        ),
                                      ]),
                                    )
                                  ],
                                ),

                                ///////////////// الراس //////////////////////
                                SizedBox(
                                    height: SizeConfig.screenheight! * .02),
                                CustomText(
                                  text: "الرأس",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),

                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                          child: Row(children: [
                                        Radio<String>(
                                          value: 'بدون رأس',
                                          groupValue: _selectedHead,
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedHead = value!;
                                              valueHead = value;
                                              calculate(valueWeight, valueHead, valueBowel, b);
                                            });
                                          },
                                          activeColor: Primarycolor,
                                        ),
                                        CustomText(text: 'بدون رأس'),
                                      ])),
                                      Container(
                                        child: Row(children: [
                                          Radio<String>(
                                            value: 'شامل الرأس',
                                            groupValue: _selectedHead,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedHead = value!;
                                                valueHead = value;
                                                calculate(
                                                    valueWeight, valueHead, valueBowel, b);
                                              });
                                            },
                                            activeColor: Primarycolor,
                                          ),
                                          CustomText(
                                            text: 'شامل الرأس',
                                          ),
                                        ]),
                                      )
                                    ]),

                                ////////////////// الاحشاء //////////////////////
                                SizedBox(
                                    height: SizeConfig.screenheight! * .02),
                                CustomText(
                                  text: "الأحشاء",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),

                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                          child: Row(children: [
                                        Radio<String>(
                                          value: 'بدون أحشاء',
                                          groupValue: _selectedBowel,
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedBowel = value!;
                                              valueBowel = value;
                                              calculate(valueWeight, valueHead, valueBowel, b);
                                            });
                                          },
                                          activeColor: Primarycolor,
                                        ),
                                        CustomText(text: 'بدون أحشاء'),
                                      ])),
                                      Container(
                                        child: Row(children: [
                                          Radio<String>(
                                            value: 'شامل الأحشاء',
                                            groupValue: _selectedBowel,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedBowel = value!;
                                                valueBowel = value;
                                                calculate(
                                                    valueWeight, valueHead, valueBowel, b);
                                              });
                                            },
                                            activeColor: Primarycolor,
                                          ),
                                          CustomText(
                                            text: 'شامل الأحشاء',
                                          ),
                                        ]),
                                      )
                                    ]),

                                SizedBox(
                                    height: SizeConfig.screenheight! * .02),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    CustomText(
                                      text: "الكمية",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Primarycolor,
                                          width: 2,
                                        ),
                                      ),
                                      width: 100,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          textAlign: TextAlign.center,
                                          controller: inputController,
                                          keyboardType: TextInputType.number,
                                          onChanged: (text) {
                                            setState(() {
                                              b = text;
                                            });

                                            calculate(valueWeight, valueHead, valueBowel, b);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: SizeConfig.screenheight! * .02),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "السعر",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    CustomText(
                                      text: _add.toString(),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: SizeConfig.screenheight! * .02),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenheight! * .02),
                        Container(
                          //  padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //////////////// counter/////////////
                              Expanded(
                                child: CustomMaterialButtom(
                                    text: "إضافة للسلة",
                                    press: () {
                                      setState(() {
                                        MyListBasket().add(
                                          SubOrder(
                                              widget
                                                  .Details_Sub_Categories_Image,
                                              widget
                                                  .Details_Sub_Categories_Name,
                                              _add,
                                              valueHead,
                                              valueBowel,
                                              b,
                                              valueWeight,
                                          widget.Details_Sub_Categories_Head_Price,
                                          widget.Details_Sub_Categories_Bowel_Price),
                                        );
                                        BasketScreen(
                                          BasketTotalPrice:
                                              MyListBasket.totalPrice,
                                        );
                                      });
                                      Navigator.of(context)
                                          .pushNamed('Basket Screen');
                                    }),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ]))));
  }
}
