
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
import '../../model/api/register/registerAPI.dart';
import '../../model/api/register/registerModule.dart';

class CheckForRegister extends StatefulWidget {

  var phone;
  var passWord;
  var confPassword;

  CheckForRegister({Key? key,
    this.phone,
    this.passWord,
    this.confPassword
  }) : super(key: key);

  @override
  State<CheckForRegister> createState() => _CheckForRegisterState();
}

class _CheckForRegisterState extends State<CheckForRegister> {
  Future<RegisterResponse>? RegisterResult;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RegisterResult = registerUser(widget.phone, widget.passWord, widget.confPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
          child: buildFutureBuilder()
      ),
    );}

  FutureBuilder<RegisterResponse> buildFutureBuilder() {
    return FutureBuilder<RegisterResponse>(
        future: RegisterResult,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                    content: Text('تم التسجيل بنجاح . قم بتسجيل الدخول .' , style: TextStyle(color: Colors.black),),
                  ));
              Navigator.of(context).pushNamed('Login Screen');
            }
            );
            return Text('');
            //Text('تم التسجيل بنجاح . قم بتسجيل الدخول .' , style: TextStyle(color: Colors.black),);
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
                    content: Text('${snapshot.error}',
                      style: TextStyle(color: Colors.black),),
                  ));
              Navigator.of(context).pushNamed('Registeration Screen');
            });


            return Text('');
          }
          return CircularProgressIndicator();
        }
    );
  }
}
