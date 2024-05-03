import 'dart:developer';

import 'package:food_delivery_app/Utils/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../API/API_Client.dart';

class SignUpRepo{

  final ApiClient apiClient;

  SignUpRepo({required this.apiClient});

  Future<Response> registerUser(dynamic body) async{
    log("repo working");
    return await apiClient.registerUser(AppConstant.authenticationBaseUrl+AppConstant.signUpUrl, body);
  }

}