
import 'package:adawal/config/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color.dart';

title() {
  return Utils.title(text: "Wallet address");
}

message() {
  return Utils.regular(text: "Enter your wallet address to view information about your account", align: TextAlign.center, color: AppColors.grey, fontWeight: FontWeight.w400);
}

addressField(TextEditingController controller, {String? Function(String?)? validator, Function(String)? onChanged, bool? isLoading = false}) {
  final outlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular( 10.0),
    borderSide: BorderSide(
      color: Colors.grey.withOpacity(0.4),
    ),
  );
  return TextFormField(
    onChanged: onChanged,
    validator: validator,
    controller: controller,
    enabled: isLoading! ? false : true,
    enableInteractiveSelection: true,
    cursorColor: AppColors.mainColor,
    maxLines: 3,
    decoration: InputDecoration(
      isDense: false,
      filled: false,
      errorMaxLines: 4,
      labelStyle:GoogleFonts.roboto(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black
      ),
      hintStyle: GoogleFonts.roboto(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.grey
      ),
      hintText: "Enter wallet address",
      focusedBorder: outlineBorder,
      disabledBorder: outlineBorder ,
      enabledBorder: outlineBorder,
      border: outlineBorder,
      contentPadding:EdgeInsets.symmetric(
        vertical: 18.h,
        horizontal: 24.0.w,
      ),
    ),
  );
}



button(String btnName, {VoidCallback? onTap, Color? color, double? fontSize, bool? isLoading = false}) {
  return InkWell(
    onTap: isLoading! ? null : onTap,
    child: Container(
      width: 1.sw,
      height: 50.h,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: isLoading! ? AppColors.grey : AppColors.mainDarkColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child:  isLoading! ? SizedBox(
          height: 30.w,
          width: 30.w,
          child: CircularProgressIndicator(
            color: AppColors.mainColor,
            strokeWidth: 0.7,
          ),
        ):
        Utils.regular(color: AppColors.primaryLight, fontSize: 16.sp, text: btnName),
      )
    ),
  );
}