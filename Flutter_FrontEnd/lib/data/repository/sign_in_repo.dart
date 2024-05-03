import 'dart:developer';

import 'package:get/get_connect/http/src/response/response.dart';

import '../../Utils/app_constants.dart';
import '../API/API_Client.dart';

class SignInRepo{

  final ApiClient apiClient;

  SignInRepo({required this.apiClient});
  
  Future<Response> userPresent(String userEmail,String userPassword) async{
    return await apiClient.isUserPresent(AppConstant.authenticationBaseUrl+AppConstant.signInUrl,userEmail,userPassword);
  }
  
  
}