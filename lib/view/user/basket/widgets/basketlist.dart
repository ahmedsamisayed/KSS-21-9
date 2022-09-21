import 'package:flutter/material.dart';
import 'package:kss/view/user/basket/widgets/myBasket.dart';
import 'package:kss/view/user/basket/widgets/suborder.dart';

class MyListBasket {
  static List<SubOrder> _suborder = [];
  static double _totalPrice = 0.0;
  add(SubOrder suborder) {
    _totalPrice += suborder.bpriceO;
    _suborder.add(suborder);
  }

  remove(SubOrder suborder) {
    _totalPrice -= suborder.bpriceO;
    _suborder.remove(suborder);
  }

  int get count {
    return _suborder.length;
  }
  static set clearTotalPrice(double x){
    _totalPrice = x;
  }

  static double get totalPrice {
    return _totalPrice;
  }

  static List<SubOrder> get basketItems {
    return _suborder;
  }
}
