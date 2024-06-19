import 'package:adawal/constants/color.dart';
import 'package:adawal/screens/address/address_screen_widgets.dart';
import 'package:adawal/screens/address_detail/address_detail_screen.dart';
import 'package:adawal/view_models/address_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../config/utils.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AddressProvider>(builder: (context, addVm, _) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                title(),
                Utils.verticalPadding(space: 16.h),
                message(),
                Utils.verticalPadding(space: 40.h),
                addressField(addressController, onChanged: (value) {
                  addVm.setAddress(value);
                }, validator: (value) {
                  if (value!.isEmpty) {
                    return "The address must not be empty";
                  }
                  return null;
                }),
                Utils.verticalPadding(space: 40.h),
                button("Submit",
                    isLoading: addVm.isLoading,
                    onTap: () {
                  if (key.currentState!.validate()) {
                    addVm.fetchSpecificAddressDetails(context);
                  }
                })
              ],
            ),
          ),
        ),
      );
    });
  }
}
