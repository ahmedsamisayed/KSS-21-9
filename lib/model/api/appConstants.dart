import 'package:image_picker/image_picker.dart';

class AppConstants{
  static String? userAccessToken;
  static String? userId;
  static String? userName;
  static String? userEmail;
  static String? userPhone;
  static late XFile uplodedImage;
  static String generalUrl = "http://212.0.148.6:4000/api/v1";
  static String productImageurl = "http://212.0.148.6:4000/assets/productImages";
  static String? bokNumber;
  static String? userPhoneForForgetPassword;
  static String? OTP;
  static String? currentRegisterNumberForOTP;
  static bool reSendOTP = false;

}