import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/connect.dart';

import '../../Utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService{

  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;


  ApiClient({required this.appBaseUrl}){
    baseUrl=appBaseUrl;
    token=AppConstant.token;
    timeout=const Duration(seconds: 30);
    _mainHeaders={
      'Content-type':'application/json; charset=UTF-8',
      'Authorization':'Bearer $token',
    };
  }

  Future<Response> getData(String uri) async{
    try{
      Response response = await get(uri);
      return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

  Future<Response> postData(String uri,dynamic body)async{
    try{
      Response response = await post(uri, body,headers: _mainHeaders);
      log(response.body.toString());
      return response;
    }catch(e){
      print(e);
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

  //authentication
  Future<Response> isUserPresent(String uri,String userEmail,String userPassword) async{
    var dioClient=dio.Dio();
    try{
      dio.Response response=await dioClient.get(uri,queryParameters:{
        'email':userEmail,
        'password':userPassword
      });
      return Response(statusCode: response.statusCode,body: response.data);
    }
    catch(e){
      print(e);
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

  Future<Response> registerUser(String uri,dynamic body) async{
    var dioClient=dio.Dio();
    try{
      dio.Response response=await dioClient.post(uri,data: body);
      return Response(statusCode: response.statusCode,body: response.data,statusText: response.statusMessage);
    }catch(e){
      print(e);
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

}