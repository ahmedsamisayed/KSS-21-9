import 'package:flutter/material.dart';

import 'package:kss/core/utils/size_config.dart';
import 'package:kss/core/widgets/custom_text.dart';
import 'package:kss/model/api/fullCowDetails.dart';
import 'package:kss/view/user/Catogries/widges/subCatogres_Card.dart';

import '../../../../core/widgets/Custom_FloatingActionButton.dart';
import '../BottomNavigationBarUser.dart';

class SubCategoriesCow extends StatefulWidget {
  var allProducts;

  SubCategoriesCow({Key? key, this.allProducts}) : super(key: key);

  @override
  State<SubCategoriesCow> createState() => _SubCategoriesCowState();


}
var cowsProducts = [];
class _SubCategoriesCowState extends State<SubCategoriesCow> {
  final snackBar = SnackBar(
    content: const Text('غير متوفر حالياً'),
  );
  SplitProducts () {
    List list = widget.allProducts;
    cowsProducts.clear();
    list.forEach((n) => {
      if (n.mainCategory == "one") {

        cowsProducts.add(n),
        print('${cowsProducts[0].productImage.data.runtimeType}')
      }
    });}

//  const SubCategoriesCow({Key? key}) : super(key: key);
  //var My_CowSubCategories = [
  // {
  //   'Sub_Categories_Id': "1",
  //   'Sub_Categories_press': () {
  //     // Navigator.of(context).pushNamed('Details Screen');
  //   },
  //   'Sub_Categories_Image': "lib/assets/images/download (7).jpg",
  //   'Sub_Categories_Name': "عجل كامل",
  //   'isVisible': false,
  // },
  // {
  //   'Sub_Categories_Id': "2",
  //   'Sub_Categories_press': () {
  //     //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //   },
  //   'Sub_Categories_Image': "lib/assets/images/ضلوع بقر.jpg",
  //   'Sub_Categories_Name': "ضلوع",
  //   'isVisible': true,
  // }
  //];
  @override
  void initState() {
    // TODO: implement initState
    SplitProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig();
    return WillPopScope(
        onWillPop: () async {
      final shouldPop = await showDialog<bool>(
        context: context,
        builder: (context) {
          return HomeNavigationUserPage();
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
            child: ListView(children: [
              Row(
                children: [
                  CustomFloatingActionButton(
                    press: () => Navigator.of(context).pushNamed('Home Navigation User Screen'),
                    icon: Icon(Icons.chevron_left_rounded, color: Colors.black),
                  ),
                  SizedBox(
                    width: SizeConfig.screenwidth! * .2,
                  ),
                  CustomText(
                    text: "بقر",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenheight! * .02,
              ),
              Container(
                  height: SizeConfig.screenheight! / 1,
                  child: GridView.extent(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    maxCrossAxisExtent: 200.0,
                    children: cowsProducts.length == 0 ? <Widget>[
                      Container(
                          height: SizeConfig.screenheight! / 2.2,
                          child:  Center(
                              child: Text(
                                'لم تقم بإضافة شيْ   إلى السلة بعد',
                                style: TextStyle(
                                  fontFamily: "Tajawal",
                                  fontSize: 20,
                                ),
                              ))
                      ),

                    ]: getListProduct(cowsProducts),
                  )),
            ]),
          ),
        )));
  }


  getListProduct(cowProducts){
    List<Widget> arr= [];
    cowProducts.forEach((cowsProduct) {
      arr.add(SubCatogresCard(
        Sub_Categories_Id: cowsProduct.sId,
        Sub_Categories_press: () {

          Navigator.of(context).pushNamed('Details Screen');
        },
        Sub_Categories_Image: cowsProduct.productImage.data,
        Sub_Categories_Name: cowsProduct.name,
        Sub_Categories_weight1Price: cowsProduct.smallPrice.toDouble(),
        Sub_Categories_weight2Price: cowsProduct.mediumPrice.toDouble(),
        Sub_Categories_weight3Price: cowsProduct.largPrice.toDouble(),
        Sub_Categories_weight1: cowsProduct.smallWeight.toDouble(),
        Sub_Categories_weight2: cowsProduct.mediumWeight.toDouble(),
        Sub_Categories_weight3: cowsProduct.largWeight.toDouble(),
        Sub_Categories_Head_Price: cowsProduct.headPrice.toDouble(),
        Sub_Categories_Bowel_Price: cowsProduct.bowelsPrice.toDouble(),
        isVisible: false,
      ));
    });
    return arr;
  }
}
