import 'dart:async';
import 'dart:developer';

import 'package:food_delivery_app/models/User.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:get/get.dart';

import '../../Utils/show_custom_message.dart';
import '../repository/sign_up_repo.dart';

class SignUpController extends GetxController{

  final SignUpRepo signUpRepo;

  SignUpController({required this.signUpRepo});

  void registerUser(String name,String email,String password,String phoneNumber) async{
    name = name.trim();
    phoneNumber = phoneNumber.trim();
    email = email.trim();
    password = password.trim();
    if(name.isEmpty){
      showCustomSnackBar('Type in your name',title: 'name');
    }else if(phoneNumber.isEmpty){
      showCustomSnackBar('Type in your phone number', title: 'Phone Number');
    }else if(email.isEmpty){
      showCustomSnackBar('Type in your email', title: 'Email');
    }else if(!GetUtils.isEmail(email)){
      showCustomSnackBar('Type in a valid email address', title: 'Valid Email Address');
    }else if(password.isEmpty){
      showCustomSnackBar('Type in your password', title: 'Password');
    }else if(password.length<6){
      showCustomSnackBar("Password can't be too short", title: 'Valid Password');
    }else{
      User user=User(name: name,email: email,password: password,phoneNumber: phoneNumber,id: 0);
      Response response = await signUpRepo.registerUser(user.toJson());
      log(response.statusCode.toString());
      if(response.statusCode==201){
        showCustomSnackBar('All went well', title: 'Sign Up Successful',isError: false);
        Timer(const Duration(milliseconds: 3000,), () =>Get.offAndToNamed(RouteHelper.signInPage));
      }
      else{
        showCustomSnackBar('please try again', title: 'Sign Up Failed');
      }
    }
  }

}