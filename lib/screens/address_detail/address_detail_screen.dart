import 'package:adawal/config/utils.dart';
import 'package:adawal/constants/color.dart';
import 'package:adawal/screens/address_detail/address_detail_widgets.dart';
import 'package:adawal/view_models/address_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddressDetailScreen extends StatefulWidget {
  const AddressDetailScreen({Key? key}) : super(key: key);

  @override
  State<AddressDetailScreen> createState() => _AddressDetailScreenState();
}

class _AddressDetailScreenState extends State<AddressDetailScreen> {
  AddressProvider? addVm;


  bool viewAccountInDollars = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addVm = context.read<AddressProvider>();
  }
  @override
  Widget build(BuildContext context) {
    addVm = context.watch<AddressProvider>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            Utils.verticalPadding(space: 0.02.sh),
            Align(
              alignment: Alignment.center,
              child: topContainer(addVm?.addressModel?.address),
            ),
            Utils.verticalPadding(space: 0.02.sh),
            currentBalance(),
            adaBalance(viewAccountInDollars ? "\$${addVm!.amountInDollars}" : "${addVm!.addressAdaTokens}" , onBtnTap: (){
              setState(() {
                viewAccountInDollars = !viewAccountInDollars;
              });
            }),
            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buttonContainer(btnText: "Send", data: Icons.arrow_outward),
                buttonContainer(btnText: "Buy", data: Icons.add, btnColor: AppColors.mainDarkColor, txtColor: Colors.white),
                buttonContainer(btnText: "Receive", data: Icons.call_received),
              ],
            ),
            Utils.verticalPadding(space: 32.h),
            transactionContainer()
          ],
        ),
      ),
    );
  }
}
