

import 'dart:developer';

import 'package:adawal/dtos/error_class.dart';
import 'package:adawal/models/address_model.dart';
import 'package:adawal/services/address_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/utils.dart';
import '../screens/address_detail/address_detail_screen.dart';

enum UIState {idle, loading, error, done}
class AddressProvider with ChangeNotifier {

  final AddressServices service = AddressServices();

UIState uiState = UIState.idle;

get isLoading => uiState == UIState.loading;

get done => uiState == UIState.done;

get error => uiState == UIState.error;


setUiState(UIState _uiState) {
uiState = _uiState;
notifyListeners();
}


updateUi(func) {
func();
notifyListeners();
}


String? walletAddress;

Address? addressModel;

num? amountInDollars;

num? addressAdaTokens;


  setAddress(String value) {
    walletAddress = value;
    notifyListeners();
  }



  //This code will fetch the data for the specific address
  fetchSpecificAddressDetails(BuildContext context) async {
    if (walletAddress!.isEmpty) {
      Utils.showSnackBar(context, message: "The wallet address must not be empty");
      return;
    }
    try{
      setUiState(UIState.loading);
      var response = await service.getAddressDetails(addressDetails: walletAddress);
      setUiState(UIState.done);
      log(response.toString());
      if (service.successfulResponse(response)) {
        addressModel = Address.fromJson(response.data);
        fetchAmount();
        Navigator.push(context, MaterialPageRoute(builder: (_)=> const AddressDetailScreen()));
      }else {
        ErrorResponse error = ErrorResponse.fromJson(response.data);
        Utils.showSnackBar(context, message: error.message);
      }
    } on DioException catch(e) {
      Utils.showSnackBar(context, message: e.message);
      setUiState(UIState.done);
    }
}


//fetch the amount in the address
  fetchAmount() {
    Amount adaAmountInLovelace;
    adaAmountInLovelace = addressModel!.amount!.firstWhere((amount) => amount.unit == 'lovelace');
    num lovelaceAmountConversion = num.parse(adaAmountInLovelace.quantity!);
    addressAdaTokens =  lovelaceAmountConversion/ 1000000;
    if (addressAdaTokens != null) {
      amountInDollars = addressAdaTokens! * 0.37;
    }

  }


}