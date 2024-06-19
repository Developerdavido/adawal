

import 'dart:developer';

import 'package:adawal/services/address_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../config/utils.dart';

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
    } on DioException catch(e) {
      Utils.showSnackBar(context, message: e.message);
      setUiState(UIState.done);
    }
}
}