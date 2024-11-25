import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:imove/utiils/utils.dart';

errorToast(String msg) {
  return Fluttertoast.showToast(
      msg: msg,
      fontAsset: "assets/fonts/sf_pro_display/SFPRODISPLAYBOLD.otf",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.primaryColor,
      textColor: Colors.white,
      fontSize: 16.sp);
}
