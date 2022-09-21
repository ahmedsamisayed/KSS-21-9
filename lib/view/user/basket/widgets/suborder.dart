import 'package:kss/view/user/basket/widgets/basketlist.dart';

class SubOrder {
 late String bnameO ;
 late String bheadStatus;
 late String bbowelStatus;
 late String bImageO;
 late double bpriceO;
 late String bQuantity;
 late String bSelectedWeight;
 late double bheadPrice;
 late double bBowelsPrice;
 SubOrder(
  this.bImageO,
  this.bnameO,
  this.bpriceO,
  this.bheadStatus,
  this.bbowelStatus,
  this.bQuantity,
  this.bSelectedWeight,
     this.bheadPrice,
 this.bBowelsPrice

 );
 Map toJson() => {
  'name': bnameO,
  'head': bheadStatus,
  'bowels': bbowelStatus,
  'weight': bSelectedWeight,
  'headPrice': bheadPrice,
  'weightPrice': bpriceO,
  'bowelsPrice': bBowelsPrice,
  'quantity': bQuantity,
  'totalPrice': MyListBasket.totalPrice,

 };
  }