
import 'package:flutter/material.dart';
import 'package:kss/model/api/appConstants.dart';
import 'package:kss/model/api/getOrders/getOrdersAPI.dart';
import 'package:kss/view/user/order/order.dart';

import '../../../../model/api/infos/infosAPI.dart';
import '../../../../model/api/infos/infoResponseModule.dart';
import '../../../../model/api/offers/offerAPI.dart';
import '../../../../model/api/offers/offerModule.dart';
import '../../order information/Order information.dart';
import '../countact_Us/contactUs.dart';
import 'offers_screen.dart';

class CheckerForOfferScreen extends StatefulWidget {

  CheckerForOfferScreen({Key? key
  }) : super(key: key);

  @override
  State<CheckerForOfferScreen> createState() => _CheckerForOfferScreenState();
}

class _CheckerForOfferScreenState extends State<CheckerForOfferScreen> {
  Future<OffersResponse>? offersResult = getOffers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
          child: buildOfferFutureBuilder()
      ),
    );}

  FutureBuilder<OffersResponse> buildOfferFutureBuilder() {
    return FutureBuilder<OffersResponse>(
        future: offersResult,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        OffersScreen(

                          ///pass value
                          OffersList: snapshot.data!.offers,

                        )));

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
