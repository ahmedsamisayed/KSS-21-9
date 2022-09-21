
import 'package:flutter/material.dart';
import 'package:kss/model/api/getOrders/getOrdersAPI.dart';
import 'package:kss/view/user/order/order.dart';

import '../../../model/api/getOrders/getOrdersResponse.dart';
import '../../../model/api/getOrders/orderModule.dart';
import '../../../model/api/products/productAPI.dart';
import '../../../model/api/products/productResponse.dart';
import 'package:kss/model/api/fullCowDetails.dart';

import '../Catogries/Sub_Categories_Camel.dart';
import '../Catogries/Sub_Categories_cow.dart';
import '../Catogries/sub_Categries_Sheep.dart';

class CheckerForProductScreen extends StatefulWidget {
  
  var selectedCategory;

  CheckerForProductScreen({Key? key, this.selectedCategory }) : super(key: key);

  @override
  State<CheckerForProductScreen> createState() => _CheckerForOrderProductState();
}

class _CheckerForOrderProductState extends State<CheckerForProductScreen> {
  Future<ProductResponse>? productResult = getProduct();
  var products;
  var cowsProducts;
  var sheepProducts;
  var camelProducts;
  clearAll () {
    products.clear();
    cowsProducts.clear();
    sheepProducts.clear();
    camelProducts.clear();
  }
  splitProducts () {
    products.forEach((n) => {
      if (n.mainCategory == "one") {
        cowsProducts.add(n)
      }
      else if (n.mainCategory == "two") {
        sheepProducts.add(n)
      }
      else if (n.mainCategory == "three") {
          camelProducts.add(n)
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
          child: buildProductFutureBuilder()
      ),
    );}

  FutureBuilder<ProductResponse> buildProductFutureBuilder() {
    return FutureBuilder<ProductResponse>(
        future: productResult,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (widget.selectedCategory == "1") {
                Navigator.of(context).push( MaterialPageRoute(
                    builder: (context) => SubCategoriesCow(
                      allProducts: snapshot.data!.products,
                    )));
              }
              else if (widget.selectedCategory == '2') {
                Navigator.of(context).push( MaterialPageRoute(
                    builder: (context) => SubCategoriesSheep(
                      allProducts: snapshot.data!.products,
                    )));
              }
              else if (widget.selectedCategory == '3') {
                Navigator.of(context).push( MaterialPageRoute(
                    builder: (context) => SubCategoriesCamel(
                      allProducts: snapshot.data!.products,
                    )));
              }
            }
            );
            return Text('الرجاء الإنتظار' , style: TextStyle(color: Colors.black),);
          }
          else if (snapshot.hasError) {
            print('${snapshot.error}');
            return Text('${snapshot.error}', style: TextStyle(color: Colors.black), );
          }
          return CircularProgressIndicator();
        }
    );
  }
}
