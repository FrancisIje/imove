import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

class AppTypography {
  final String fontFam;

  AppTypography(this.fontFam);
  factory AppTypography.baloo() => AppTypography("Baloo");
  factory AppTypography.avenir() => AppTypography("Avenir");

  TextStyle get h4 => TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 32.sp,
      letterSpacing: -0.2,
      fontFamily: fontFam);
  TextStyle get h5 => TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24.sp,
      letterSpacing: -0.2,
      fontFamily: fontFam);
  TextStyle get h6 => TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20.sp,
      letterSpacing: -0.2,
      fontFamily: fontFam);
  TextStyle get bodyLargeSB => TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 17.sp,
      letterSpacing: 0,
      fontFamily: fontFam);
  TextStyle get bodyLargeM => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 17.sp,
      letterSpacing: 0,
      fontFamily: fontFam);
  TextStyle get bodyLargeR => TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 17.sp,
      letterSpacing: 0,
      fontFamily: fontFam);
  TextStyle get bodyMediumSB => TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 15.sp,
      letterSpacing: 0,
      fontFamily: fontFam);
  TextStyle get bodyMediumM => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 15.sp,
      letterSpacing: 0,
      fontFamily: fontFam);
  TextStyle get bodyMediumR => TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15.sp,
      letterSpacing: 0,
      fontFamily: fontFam);
  TextStyle get bodySmallSB => TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 13.sp,
      letterSpacing: 0,
      fontFamily: fontFam);
  TextStyle get bodySmallM => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 13.sp,
      letterSpacing: 0,
      fontFamily: fontFam);
  TextStyle get bodySmallR => TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 13.sp,
      letterSpacing: 0,
      fontFamily: fontFam);
  TextStyle get captionR => TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 11.sp,
      letterSpacing: 0,
      fontFamily: fontFam);
  TextStyle get captionM => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 11.sp,
      letterSpacing: 0,
      fontFamily: fontFam);
}
