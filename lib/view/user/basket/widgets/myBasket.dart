import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kss/view/user/basket/basket.dart';
import 'package:kss/view/user/basket/widgets/basketlist.dart';
import 'package:kss/view/user/basket/widgets/suborder.dart';

import '../../../../core/const.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../model/api/appConstants.dart';

class MyBasket extends StatefulWidget {
  final bname;
  final bWeight;
  final bImage;
  final quantity;
  final price;
  final bHeadStatus;
  final bBowelStatus;
  final bindex;

  MyBasket(
      {Key? key,
      this.bname,
      this.bImage,
      this.quantity,
      this.price,
      this.bHeadStatus,
      this.bBowelStatus,
      this.bWeight,
      this.bindex})
      : super(key: key);

  @override
  State<MyBasket> createState() => _MyBasketState();
}

class _MyBasketState extends State<MyBasket> {
  bool isSaving = false;

  get Quantity {
    return widget.quantity;
  }

  get bindex => widget.bindex;

  //   void _incrementCounter() {
  //   setState(() {
  //     widget.quantity;
  //   });
  //   Quantity++;

  // }

  // void _decreaseCounter() {
  //   setState(() {
  //     widget.quantity;
  //   });

  //   quantity--;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Material(
                color: Colors.white,
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10.0),
                shadowColor: Color(0x802196F3),
                child: Container(
                  padding: const EdgeInsets.all(
                    5,
                  ),
                  width: MediaQuery.of(context).size.width / 6,
                  child: Image.network( "${AppConstants.productImageurl}/${widget.bImage!}",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: const EdgeInsets.only(
                      right: 5,
                    ),
                    child: Text(
                      widget.bname,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(children: [
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Expanded(
                          //   child: Text(
                          //     'الكمية :'
                          //   ),),
                          // IconButton(
                          //     icon: Icon(
                          //       Icons.do_disturb_on_outlined,
                          //       color: Primarycolor,
                          //     ),
                          //     onPressed: _decreaseCounter),
                          Container(
                              margin: EdgeInsets.all(2),
                              padding: EdgeInsets.all(5),
                              child: CustomText(
                                text:
                                    """الكمية : ${widget.quantity} ،${widget.bHeadStatus} ،
${widget.bBowelStatus} ،${widget.bWeight}""",
                                fontSize: 10.5,
                              )),
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
            ]),
            Container(
              padding: const EdgeInsets.only(
                left: 0,
                right: 0,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.close_rounded,
                  color: Primarycolor,
                ),
                onPressed: () {
                  setState(() {
                    MyListBasket().remove(
                      widget.bindex,
                    );
                    Navigator.of(context).pushNamed('Basket Screen');
                  });

                  //delete
                },
              ),
            )
          ],
        ),
        Divider(
          color: Colors.grey,
        ),
      ]),
    );
  }
}
