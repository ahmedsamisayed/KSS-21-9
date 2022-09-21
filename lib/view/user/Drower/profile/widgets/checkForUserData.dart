
import 'package:flutter/material.dart';
import 'package:kss/model/api/getOrders/getOrdersAPI.dart';
import 'package:kss/view/user/order/order.dart';

import '../../../../../model/api/appConstants.dart';
import '../../../../../model/api/getOrders/getOrdersResponse.dart';
import '../../../../../model/api/getOrders/orderModule.dart';
import '../../../../../model/api/updateUserData/udpateUserDataAPI.dart';

class CheckerForUpdateUserData extends StatefulWidget {
  var name;
  var email;
  CheckerForUpdateUserData({Key? key,
    this.name,
    this.email
  }) : super(key: key);

  @override
  State<CheckerForUpdateUserData> createState() => _CheckerForUpdateUserData();
}


class _CheckerForUpdateUserData extends State<CheckerForUpdateUserData> {

  Future? UpdateUserDataResult;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
          child: buildUpdateUserDataFutureBuilder()
      ),
    );}

  FutureBuilder buildUpdateUserDataFutureBuilder() {
    UpdateUserDataResult = updateUserData(widget.name,widget.email);
    return FutureBuilder(
        future: UpdateUserDataResult,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AppConstants.userName = widget.name;
              AppConstants.userEmail = widget.email;
              Navigator.of(context).pushNamed('Profile Screen');
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
