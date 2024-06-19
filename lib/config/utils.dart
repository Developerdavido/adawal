import 'package:adawal/constants/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Utils {
  static SizedBox horizontalPadding({space = 16}) => SizedBox(width: space);
  static SizedBox verticalPadding({space = 16}) => SizedBox(height: space);

  static header(
      {String? text,
      double? fontSize,
      FontWeight? fontWeight,
      Color? color,
      TextAlign? align}) {
    return Text(
      text ?? "",
      style: GoogleFonts.roboto(
          fontSize: fontSize ?? 32.sp,
          fontWeight: fontWeight ?? FontWeight.bold,
          color: color ?? AppColors.black),
      textAlign: align,
    );
  }

  static regular(
      {String? text,
      double? fontSize,
      FontWeight? fontWeight,
      Color? color,
      TextAlign? align}) {
    return Text(
      text ?? "",
      style: GoogleFonts.roboto(
          fontSize: fontSize ?? 18.sp,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? AppColors.black),
      textAlign: align,
    );
  }

  static caption(
      {String? text,
      double? fontSize,
      FontWeight? fontWeight,
      Color? color,
      TextAlign? align}) {
    return Text(
      text ?? "",
      style: GoogleFonts.roboto(
          fontSize: fontSize ?? 12.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? AppColors.black),
      textAlign: align,
    );
  }

  static title(
      {String? text,
      double? fontSize,
      FontWeight? fontWeight,
      Color? color,
      TextAlign? align}) {
    return Text(
      text ?? "",
      style: GoogleFonts.roboto(
        fontSize: fontSize ?? 24.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? AppColors.black,
      ),
      textAlign: align,
    );
  }

  static showSnackBar(BuildContext context, {String? message}) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
        content: caption(text: message, color: Colors.white),
      padding: EdgeInsets.all(12.w),
      backgroundColor: AppColors.mainDarkColor,
    )
    );
  }

  static formatNumber({num? value}) => NumberFormat("#,##0.00##").format(value);
}
