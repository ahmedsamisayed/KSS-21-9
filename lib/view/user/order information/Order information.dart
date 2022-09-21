import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kss/core/utils/size_config.dart';
import 'package:kss/model/api/appConstants.dart';
import 'package:kss/model/api/postOrder/postOrderResponse.dart';
import 'package:kss/view/user/basket/widgets/basketlist.dart';
import 'package:kss/view/user/order%20information/widgets/card_information.dart';
import 'package:kss/view/user/userMap.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/const.dart';
import '../../../core/widgets/Custom_FloatingActionButton.dart';
import '../../../core/widgets/Custom_Text_Field.dart';

import '../../../core/widgets/custom_buttom.dart';

import '../../../core/widgets/custom_text.dart';
import 'package:image_picker/image_picker.dart';

import '../../../model/api/postOrder/postOrderAPI.dart';
import '../basket/basket.dart';
import 'OrderData.dart';
import 'checkerForOrder.dart';
// class ahmed {
//   Future<void> _checkPermission() async {
//     final serviceStatus = await Permission.locationWhenInUse.serviceStatus;
//     final isGpsOn = serviceStatus == ServiceStatus.enabled;
//     if (!isGpsOn) {
//       print('Turn on location services before requesting permission.');
//       return;
//     }

//     final status = await Permission.locationWhenInUse.request();
//     if (status == PermissionStatus.granted) {
//       print('Permission granted');
//     } else if (status == PermissionStatus.denied) {
//       print('Permission denied. Show a dialog and again ask for the permission');
//     } else if (status == PermissionStatus.permanentlyDenied) {
//       print('Take the user to the settings page.');
//       await openAppSettings();
//     }
//   }
// }

class OrderInformationScreen extends StatefulWidget {
  var bokNumber;

   OrderInformationScreen({Key? key,
     this.bokNumber
   }

) : super(key: key);




  

  @override
  State<OrderInformationScreen> createState() => _OrderInformationScreenState();
}

class _OrderInformationScreenState extends State<OrderInformationScreen> {

  TextEditingController alternate_phone =  TextEditingController(text: '${OrderData.alterPhone}');

  TextEditingController phone =  TextEditingController(text: '${OrderData.phone}');
  TextEditingController address = new TextEditingController();
  GlobalKey<FormState> formStateOrderInformation = new GlobalKey<FormState>();

  List<String> items = ['الخرطوم', 'بحري', 'امدرمان'];
  String? selectedItem = '${OrderData.selectedItem}';
  Future<PostOrderResponse>? postOrderResult;



    XFile? Image;
    Future pickImage(ImageSource showImageSource) async {
      try {
        final image = await ImagePicker().pickImage(source: showImageSource);

        if (image != null)
          {
            setState(() {
              OrderData.image = image.name;
              AppConstants.uplodedImage = image;

            });

            return image;
          }
        else {
          return;
        }
      } on PlatformException catch (e) {
        print('Faild to pick image: $e');
      }
    }


    @override
    Widget build(BuildContext context) {
      SizeConfig();
      return WillPopScope(
          onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return BasketScreen();
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
                child: Form(
                  key: formStateOrderInformation,
                  child: ListView(children: [
                    Row(
                      children: [
                        CustomFloatingActionButton(
                          press: () => Navigator.of(context).pushNamed('Basket Screen'),
                          icon: Icon(
                              Icons.chevron_left_rounded, color: Colors.black),
                        ),
                        SizedBox(
                          width: SizeConfig.screenwidth! * .2,
                        ),
                        CustomText(
                          text: "إكمال معلومات الطلب",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.screenheight! * .02,
                    ),
                    CustomTextField(
                      label: "رقم هاتف متاح",
                      myController: phone,
                      hint: "رقم هاتف متاح",
                      keyboardType: TextInputType.phone,
                      onChanged: (TexT) {
                        setState(() {
                          OrderData.phone = TexT;
                        });

                      },
                    ),
                    CustomTextField(
                      label: "رقم هاتف بديل",
                      myController: alternate_phone,
                      hint: "رقم هاتف بديل",
                      keyboardType: TextInputType.phone,
                      onChanged: (TexT) {
                        setState(() {
                          OrderData.alterPhone = TexT;
                        });

                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomText(
                          text: "المنطقة",
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          width: 180,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                BorderSide(width: 3, color: Colors.black26),
                              ),
                            ),
                            value: selectedItem,
                            items: items
                                .map(
                                  (item) =>
                                  DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ),
                            )
                                .toList(),
                            onChanged: (item) =>
                            {

                              setState(() => {

                                selectedItem = item,
                                OrderData.selectedItem = selectedItem.toString()
                              }),
                            }
                            ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1.5,
                      color: Colors.black26,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // end of change//////
                    InkWell(


                      onTap: () async{
        final status = await Permission.locationWhenInUse.request();
        if (status == PermissionStatus.granted) {
          print('Permission granted');
          setState(() {
            OrderData.phone = phone.text;
            OrderData.alterPhone = alternate_phone.text;
            OrderData.selectedItem = selectedItem.toString();
          });

          Navigator.of(context).pushNamed('UserMapScreen');
        } else if (status == PermissionStatus.denied) {
          print('Permission denied. Show a dialog and again ask for the permission');
        } else if (status == PermissionStatus.permanentlyDenied) {
          print('Take the user to the settings page.');
          await openAppSettings();
        };},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text:OrderData.position == null
                                ? 'العنوان'
                                : OrderData.position!,
                          ),
                          Icon(
                            Icons.location_pin,
                            color: Primarycolor,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.3,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () => {
                        pickImage(ImageSource.gallery)

                        },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: OrderData.image == null
                                ? 'إرفاق شعار بنكك'
                                : OrderData.image!,
                          ),
                          Icon(
                            Icons.upload_file_outlined,
                            color: Primarycolor,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.3,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomCardInformation(
                      text: "رقم الحساب",
                      text1: AppConstants.bokNumber.toString(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomMaterialButtom(
                        text: "تأكيد الطلب",
                        press: () {
                          if ([OrderData.phone,OrderData.alterPhone,
                          OrderData.position,OrderData.image
                          ].any((x) => x == null)
                              ){
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
                                  content: Text('لم تقم بملء كل الخانات المطلوبة بصورة صحيحة' ,
                                    style: TextStyle(color: Colors.black, fontSize: 15),
                                  ),
                                ));
                          }
                          else {
                            Navigator.of(context).push( MaterialPageRoute(
                                builder: (context) => CheckerForOrderPost(

                                )));
                          }
                        }),
                  ]),
                ),
              ))));
    }

  }