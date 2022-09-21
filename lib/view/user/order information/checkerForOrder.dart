
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kss/model/api/appConstants.dart';
import 'package:kss/model/api/getOrders/getOrdersAPI.dart';
import 'package:kss/view/user/order/order.dart';

import '../../../model/api/getOrders/getOrdersResponse.dart';
import '../../../model/api/getOrders/orderModule.dart';
import '../../../model/api/postOrder/postOrderAPI.dart';
import '../../../model/api/postOrder/postOrderResponse.dart';
import '../basket/widgets/basketlist.dart';
import 'OrderData.dart';

class CheckerForOrderPost extends StatefulWidget {

  CheckerForOrderPost({Key? key}) : super(key: key);




  @override
  State<CheckerForOrderPost> createState() => _CheckerForOrderPostState();
}

class _CheckerForOrderPostState extends State<CheckerForOrderPost> {

  Future postOrderResult = postOrderAndImage(AppConstants.uplodedImage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
          child: buildPostOrderFutureBuilder()
      ),
      // SnackBar(
      //   duration: const Duration(milliseconds: 2000),
      //   backgroundColor: Color(0xffd0c9c0),
      //   margin: const EdgeInsets.all(100.0),
      //   padding: const EdgeInsets.symmetric(
      //     horizontal: 8.0,
      //   ),
      //   behavior: SnackBarBehavior.floating,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(10.0),
      //   ),
      //   content: buildGetOrdersFutureBuilder(),
      // ));
    );}

  FutureBuilder buildPostOrderFutureBuilder() {
    return FutureBuilder(
        future: postOrderResult,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
              MyListBasket.basketItems.clear();
              MyListBasket.clearTotalPrice = 0.0;
              OrderData.phone = '';
              OrderData.alterPhone = '';
              OrderData.position = null;
              OrderData.image = null;


            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context)
                  .pushNamed('Order Validiaation True Screen');
            }
            );
            return Text('تم الطلب بنجاح .' , style: TextStyle(color: Colors.black),);
          }
          else if (snapshot.hasError) {
            return Text('${snapshot.error}', style: TextStyle(color: Colors.black), );
          }
          return CircularProgressIndicator();
        }
    );
  }
}
