

import 'package:adawal/services/http_service.dart';
import 'package:dio/dio.dart';

import '../constants/api_constants.dart';

class AddressServices extends HttpService{



  //check if it a successful response
  successfulResponse(Response response) {
    return response.statusCode! >= 200 && response.statusCode! < 300;
  }
  
  

  //get the address details
  Future<Response> getAddressDetails({String? addressDetails}) async {
    var response = await get("${Api.address}$addressDetails");
    return response;
  }
}