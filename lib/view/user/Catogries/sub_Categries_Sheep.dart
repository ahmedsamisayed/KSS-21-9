import 'package:flutter/material.dart';

import 'package:kss/core/utils/size_config.dart';
import 'package:kss/core/widgets/custom_text.dart';
import 'package:kss/view/user/Catogries/widges/subCatogres_Card.dart';

import '../../../../core/widgets/Custom_FloatingActionButton.dart';
import '../BottomNavigationBarUser.dart';

class SubCategoriesSheep extends StatefulWidget {
  var allProducts;
  SubCategoriesSheep({Key? key, this.allProducts}) : super(key: key);
  @override
  State<SubCategoriesSheep> createState() => _SubCategoriesSheepState();
}
var sheepProducts = [];
class _SubCategoriesSheepState extends State<SubCategoriesSheep> {
  // const SubCategoriesSheep({Key? key}) : super(key: key);
  final snackBar = SnackBar(
    content: const Text('غير متوفر حالياً'),
  );
  SplitProducts () {
    List list = widget.allProducts;
    sheepProducts.clear();
    list.forEach((n) => {
      if (n.mainCategory == "two") {

        sheepProducts.add(n),
        print('${sheepProducts[0].productImage.data.runtimeType}')
      }
    });}
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
                    text: "خراف",
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
                    children: sheepProducts.length == 0 ? <Widget>[
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

                    ]: getListProduct(sheepProducts),
                  )),
            ]),
          ),
        )));
  }
  getListProduct(sheepProducts){
    List<Widget> arr= [];
    sheepProducts.forEach((cowsProduct) {
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
