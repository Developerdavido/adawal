
import 'package:adawal/config/utils.dart';
import 'package:adawal/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/address_transaction.dart';

topContainer(String? walletAddress) {
  String concatenatedAddress =
      "${walletAddress!.substring(0, 8)}...${walletAddress.substring(walletAddress.length - 3)}";
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(32.r),
      color: AppColors.primaryLight,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        adaIcon(),
        Utils.horizontalPadding(space: 6.w),
        Utils.regular(text: concatenatedAddress, fontSize: 14.sp)
      ],
    ),
  );
}

adaIcon() {
  return Container(
    padding: EdgeInsets.all(2.w),
    decoration:
        const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
    child: Image.asset(
      "assets/ada_icon.png",
      height: 16.w,
      width: 16.w,
    ),
  );
}

currentBalance() {
  return Utils.caption(
      text: "Current Balance", fontWeight: FontWeight.w400, fontSize: 12.sp);
}

transactions() {
  return Utils.regular(
      text: "Transactions", fontWeight: FontWeight.w600, fontSize: 12.sp);
}

adaBalance(String balance, {VoidCallback? onBtnTap}) {
  return GestureDetector(
    onTap: onBtnTap,
    child: Utils.title(
        text: balance, fontSize: 54.sp, fontWeight: FontWeight.w800),
  );
}

transactionContainer({List<AddressTransaction>? transactions}) {
  return Container(
    height: 0.5.sh,
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.r), topLeft: Radius.circular(24.r)),
        color: Colors.white),
    child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          //final item = transactions[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(16.r)),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Icon(
                      Icons.handshake_sharp,
                      color: AppColors.mainDarkColor,
                      size: 18.sp,
                    ),
                  ),
                  Utils.horizontalPadding(space: 8.w),
                  Utils.regular(
                      text: "Transaction $index", color: AppColors.black)
                ],
              ),
            ),
          ).animate().slideY(begin: 1, end: 0, delay: 400.ms);
        }).animate().slideY(begin: 1, end: 0, delay: 200.ms),
  );
}

buttonContainer({VoidCallback? onBtnTap, String? btnText, IconData? data, Color? btnColor, Color? txtColor}) {
  return GestureDetector(
    onTap: onBtnTap,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Container(
        width: 0.25.sw,
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color: btnColor ?? Colors.white,
            borderRadius: BorderRadius.circular(16.r)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              data,
              color: txtColor,
              size: 18.sp,
            ),
            Utils.caption(color: txtColor ?? AppColors.black, text: btnText, fontSize: 12.sp)
          ],
        ),
      ),
    ),
  );
}
