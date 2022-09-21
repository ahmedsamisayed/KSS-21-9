
import 'package:flutter/material.dart';
import 'package:kss/model/api/appConstants.dart';
import 'package:kss/model/api/getOrders/getOrdersAPI.dart';
import 'package:kss/view/user/order/order.dart';

import '../../../../model/api/infos/infosAPI.dart';
import '../../../../model/api/infos/infoResponseModule.dart';
import '../../../../model/api/offers/offerAPI.dart';
import '../../../../model/api/offers/offerModule.dart';
import '../../model/api/login/loginAPI.dart';
import '../../model/api/login/loginResponseModule.dart';

class CheckForLogin extends StatefulWidget {

  var phone;
  var passWord;

  CheckForLogin({Key? key,
    this.phone,
    this.passWord
  }) : super(key: key);

  @override
  State<CheckForLogin> createState() => _CheckForLoginState();
}

class _CheckForLoginState extends State<CheckForLogin> {
  Future<LoginResponse>? loginResult;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginResult = loginUser(widget.phone, widget.passWord);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
          child: buildLoginFutureBuilder()
      ),
    );}

  FutureBuilder<LoginResponse> buildLoginFutureBuilder() {
    return FutureBuilder<LoginResponse>(
        future: loginResult,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {

              AppConstants.userAccessToken = snapshot.data!.token;
              AppConstants.userId = snapshot.data!.user!.sId;
              AppConstants.userPhone = snapshot.data!.user!.phone;
              AppConstants.userName = snapshot.data!.user!.name;
              AppConstants.userEmail = snapshot.data!.user!.email;

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
                      content: Text('تم تسجيل الدخول بنجاح .' , style: TextStyle(color: Colors.black),)
                  ));

              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckerForUserData()));
              Navigator.of(context).pushNamed('Home Navigation User Screen');
            }
            );
            return Text('');
          }
          else if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
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
                  content: Text('${snapshot.error}', style: TextStyle(color: Colors.black),)
                ));
            Navigator.of(context).pushNamed('Login Screen');
            }
            );

            return Text('');
          }
          return CircularProgressIndicator();
        }
    );
  }
}
