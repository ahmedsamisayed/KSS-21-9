
import 'package:flutter/material.dart';
import 'package:kss/model/api/appConstants.dart';
import 'package:kss/model/api/getOrders/getOrdersAPI.dart';
import 'package:kss/view/user/order/order.dart';

import '../../../../model/api/infos/infosAPI.dart';
import '../../../../model/api/infos/infoResponseModule.dart';
import '../../order information/Order information.dart';
import '../countact_Us/contactUs.dart';
import 'offers_screen.dart';

class CheckerForInfoScreen extends StatefulWidget {
  var selectedPage;
  CheckerForInfoScreen({Key? key,
    this.selectedPage
  }) : super(key: key);

  @override
  State<CheckerForInfoScreen> createState() => _CheckerForInfoScreenState();
}

class _CheckerForInfoScreenState extends State<CheckerForInfoScreen> {
  Future<OfferResponse>? offerResult = getInfos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
          child: buildOfferFutureBuilder()
      ),
    );}

  FutureBuilder<OfferResponse> buildOfferFutureBuilder() {
    return FutureBuilder<OfferResponse>(
        future: offerResult,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            AppConstants.bokNumber = snapshot.data!.infos![0].bokNumber.toString();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (widget.selectedPage == 1) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        OffersScreen(

                          ///pass value
                          OffersList: snapshot.data!.infos,

                        )));
              }
              else if (widget.selectedPage == 2) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ContactUsScreen(
                          contactPhone: snapshot.data!.infos![0].kssPhone.toString(),
                          contactEmail: snapshot.data!.infos![0].kssEmail.toString(),

                          ///pass value


                        )));
              }
              else if (widget.selectedPage == 3) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        OrderInformationScreen(
                          ///pass value
                          bokNumber: snapshot.data!.infos![0].bokNumber,
                        )));
              }
            }

            );
          }
          else if (snapshot.hasError) {

            return Text('${snapshot.error}', style: TextStyle(color: Colors.black), );
          }
          return CircularProgressIndicator();
        }
    );
  }
}
