import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/Pages/Home/home_page.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/color_utils.dart';
import '../repository/sign_in_repo.dart';

class SignInController extends GetxController{

  final SignInRepo signInRepo;
  final isLoading=false.obs;
  var sharedPreferences=Get.find<SharedPreferences>();

  SignInController({required this.signInRepo});

  void checkCredentials(String userEmail,String userPassword) async{
    if(userEmail.length!=0 && userPassword.length!=0){
      isLoading.value=true;
      Response response=await signInRepo.userPresent(userEmail, userPassword);
      log(response.body.toString());
      if(response.statusCode==200 && response.body!=""){
        isLoading.value=false;
        sharedPreferences.setBool("isUserLoggedIn", true);
        sharedPreferences.setString("username", response.body["name"]);
        sharedPreferences.setString("useremail", response.body["email"]);
        sharedPreferences.setString("userpassword", response.body["password"]);
        sharedPreferences.setString("userphonenumber", response.body["phoneNumber"]);
        sharedPreferences.setInt("userid", response.body["id"]);
        log(response.body["phoneNumber"]);
        Get.offAndToNamed(RouteHelper.homePage);
      }
      else{
        isLoading.value=false;
        Get.snackbar("SignIn Failed", "User doesn't exists!",
            backgroundColor: AppColors.mainContainerColor, colorText: Colors.white);
      }
    }
    else{
      Get.snackbar("SignIn Failed", "Email and Password Required",
          backgroundColor: AppColors.mainContainerColor, colorText: Colors.white);
    }

  }

}