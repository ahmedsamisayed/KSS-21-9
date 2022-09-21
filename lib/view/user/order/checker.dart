
import 'package:flutter/material.dart';
import 'package:kss/model/api/getOrders/getOrdersAPI.dart';
import 'package:kss/view/user/order/order.dart';

import '../../../model/api/getOrders/getOrdersResponse.dart';
import '../../../model/api/getOrders/orderModule.dart';

class CheckerForOrderScreen extends StatefulWidget {
   CheckerForOrderScreen({Key? key}) : super(key: key);

  @override
  State<CheckerForOrderScreen> createState() => _CheckerForOrderScreenState();
}

class _CheckerForOrderScreenState extends State<CheckerForOrderScreen> {
  Future<GetOrdersResponse> getOrdersResult = getOrders();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: buildGetOrdersFutureBuilder()
      ),
    );}

   FutureBuilder<GetOrdersResponse> buildGetOrdersFutureBuilder() {
     return FutureBuilder<GetOrdersResponse>(
         future: getOrdersResult,
         builder: (context, snapshot) {
           if (snapshot.hasData) {
             WidgetsBinding.instance.addPostFrameCallback((_) {

               Navigator.of(context).push( MaterialPageRoute(
                   builder: (context) => OrderScreen(
                     ///pass value
                     OrdersList: snapshot.data!.orders,

                   )));
             }
             );
             return CircularProgressIndicator();
           }
           else if (snapshot.hasError) {
             return Text('${snapshot.error}', style: TextStyle(color: Colors.black), );
           }
           return CircularProgressIndicator();
         }
     );
   }
}
