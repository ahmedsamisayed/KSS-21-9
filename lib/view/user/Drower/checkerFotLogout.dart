
import 'package:flutter/material.dart';
import 'package:kss/model/api/appConstants.dart';
import 'package:kss/model/api/getOrders/getOrdersAPI.dart';
import 'package:kss/view/user/order/order.dart';

import '../../../model/api/getOrders/getOrdersResponse.dart';
import '../../../model/api/getOrders/orderModule.dart';
import '../../../model/api/logOut/logOutAPI.dart';
import '../../../model/api/logOut/logOutModule.dart';

class CheckerForLogout extends StatefulWidget {
  CheckerForLogout({Key? key}) : super(key: key);

  @override
  State<CheckerForLogout> createState() => _CheckerForLogoutState();
}

class _CheckerForLogoutState extends State<CheckerForLogout> {
  Future<LogOutResponse> getLogOutResult = logOut();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
          child: buildLogOutFutureBuilder()
      ),
    );}

  FutureBuilder<LogOutResponse> buildLogOutFutureBuilder() {
    return FutureBuilder<LogOutResponse>(
        future: getLogOutResult,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AppConstants.userAccessToken = null;
              AppConstants.userId = null;
              Navigator.of(context).pushNamed('Login Screen');
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
