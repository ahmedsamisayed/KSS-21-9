import 'package:flutter/material.dart';
import 'package:kss/core/const.dart';

import 'package:kss/core/utils/size_config.dart';
import 'package:kss/core/widgets/custom_text.dart';

import 'package:kss/view/user/basket/widgets/myBasket.dart';

import '../../../../core/widgets/Custom_FloatingActionButton.dart';
import '../../../core/widgets/custom_buttom.dart';
import 'package:kss/view/user/basket/widgets/basketlist.dart';

import '../BottomNavigationBarUser.dart';
import '../Drower/offers/checkerForInfos.dart';
import '../order information/OrderData.dart';



class BasketScreen extends StatefulWidget {
  dynamic BasketTotalPrice;

  BasketScreen({Key? key, this.BasketTotalPrice});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  BTPF() {
    setState(() {
      if (widget.BasketTotalPrice == null) {
        widget.BasketTotalPrice = 0.0;
      } else {
        widget.BasketTotalPrice = widget.BasketTotalPrice;
      }
    });
    return widget.BasketTotalPrice;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig();
    return WillPopScope(
        onWillPop: () async {
      final shouldPop = await showDialog<bool>(
        context: context,
        builder: (context) {
          return HomeNavigationUserPage();
        },
      );
      return shouldPop!;
    },
    child:
      Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ListView(children: [
              Row(
                children: [
                  CustomFloatingActionButton(
                    press: () => Navigator.of(context).pushNamed('Home Navigation User Screen'),
                    icon: Icon(Icons.chevron_left_rounded, color: Colors.black),
                  ),
                  SizedBox(
                    width: SizeConfig.screenwidth! * .2,
                  ),
                  CustomText(
                    text: "السلة",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenheight! * .02,
              ),
              Container(
                height: SizeConfig.screenheight! / 2.2,
                child: MyListBasket.basketItems.length == 0
                    ? Center(
                        child: Text(
                        'لم تقم بإضافة شيْ   إلى السلة بعد',
                        style: TextStyle(
                          fontFamily: "Tajawal",
                          fontSize: 20,
                        ),
                      ))
                    : ListView.builder(
                        itemCount: MyListBasket.basketItems.length,
                        itemBuilder: (context, index) {
                          return MyBasket(
                            bImage: MyListBasket.basketItems[index].bImageO,
                            bname: MyListBasket.basketItems[index].bnameO,
                            price: MyListBasket.basketItems[index].bpriceO,
                            quantity: MyListBasket.basketItems[index].bQuantity,
                            bHeadStatus:
                                MyListBasket.basketItems[index].bheadStatus,
                            bBowelStatus:
                                MyListBasket.basketItems[index].bbowelStatus,
                            bWeight:
                                MyListBasket.basketItems[index].bSelectedWeight,
                            bindex: MyListBasket.basketItems[index],
                          );
                        }),
              ),
              SizedBox(height: SizeConfig.screenheight! * .001),
              Text('ملحوظة : ستقوم بدفع 15% من قيمة إجمالي السعر قبل تأكيد الطلب'),
              SizedBox(height: SizeConfig.screenheight! * .05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "إجمالي السعر",
                    color: Primarycolor,
                    fontSize: 20,
                  ),
                  CustomText(
                    color: Primarycolor,
                    text: MyListBasket.totalPrice.toString(),
                    fontSize: 20,
                  )
                ],
              ),
              SizedBox(height: SizeConfig.screenheight! * .02),
              Container(
                alignment: Alignment.centerRight,
                 child: Row(
                    children: [
                      CustomFloatingActionButton(
                        press: () {
                          Navigator.of(context)
                              .pushNamed('Home Navigation User Screen');
                        },
                        icon: Icon(Icons.add, color: Primarycolor),
                      ),
                      SizedBox(width: SizeConfig.screenwidth! * .02),
                      Text("إضافة منتج جديد إلى السلة", style: TextStyle(color: Colors.black54,fontSize: 15.0),),

                    ],
                  ),
                ),


              SizedBox(height: SizeConfig.screenheight! * .02),
              CustomMaterialButtom(
                  text: "إكمال الشراء",
                  press: () {
                    if (MyListBasket.basketItems.length == 0){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(milliseconds: 2000),
                            backgroundColor: Color(0xffd0c9c0),
                            margin: const EdgeInsets.all(100.0),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            content: Text('لا يمكنك إكمال الشراء وأنت لم تضف شيئا إلى السلة' ,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ));
                    }
                    else {
                      OrderData.phone = '';
                      OrderData.alterPhone = '';
                      OrderData.name = '';
                      OrderData.position = null;
                      OrderData.image = null;
                      Navigator.of(context).push( MaterialPageRoute(
                          builder: (context) => CheckerForInfoScreen(
                            selectedPage: 3,

                          )));

                    }

                  }),
            ]),
          ),
        )));
  }
}
