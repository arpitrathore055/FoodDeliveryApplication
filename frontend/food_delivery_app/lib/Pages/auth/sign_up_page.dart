

import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Pages/auth/sign_in_page.dart';
import 'package:food_delivery_app/data/controllers/sign_up_controller.dart';
import 'package:get/get.dart';

import '../../Utils/bigText.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/dimentions.dart';
import '../../Utils/show_custom_message.dart';
import '../../widgets/app_text_fill.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var signUpController=Get.find<SignUpController>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneNumberController = TextEditingController();

    return SafeArea(
      top: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Dimensions.height70,),
              const SizedBox(
                child: Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(
                      "lib/assets/images/chawal.jpg",
                    ),
      
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height20,),
              Text("Explore flavor, Sign up now!",style: TextStyle(
                fontFamily: "cursive",
                fontSize: Dimensions.font26,
                fontWeight: FontWeight.bold,
                color:AppColors.mainContainerColor,
              ),),
              SizedBox(height: Dimensions.height30,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10,),
                child: AppTextField(
                  textController: nameController,
                  hintText: 'Enter your name',
                  icon: Icons.email,
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10,),
                child: AppTextField(
                  textController: emailController,
                  hintText: 'Enter your email',
                  icon: Icons.password_sharp,
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10,),
                child: AppTextField(
                  textController: passwordController,
                  hintText: 'Enter your password',
                  icon: Icons.person,
                  isHidden: true,
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10,),
                child: AppTextField(
                  textController: phoneNumberController,
                  hintText: 'Enter your phone number',
                  icon: Icons.phone,
                ),
              ),
              SizedBox(height: Dimensions.height40,),
              GestureDetector(
                onTap: (){
                  log("api called!!!");
                  signUpController.registerUser(nameController.text, emailController.text, passwordController.text, phoneNumberController.text);
                  /*nameController.clear();
                  emailController.clear();
                  passwordController.clear();
                  phoneNumberController.clear();*/
                },
                child: Container(
                  width: Dimensions.screenWidth/2,
                  height: Dimensions.screenHeight/16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.mainColor,
                  ),
                  child: Center(
                    child: BigText(
                      text: 'Sign Up',
                      size: Dimensions.font20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
      
              SizedBox(height: Dimensions.height20,),
              RichText(
                text: TextSpan(
                  text: "Having an account already?",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=> const SignInPage()),
                      text: " Login",
                      style: const TextStyle(
                        color:AppColors.mainContainerColor,
                        fontSize: 16,
                      ),)
                  ],
                ),
              ),
              const SizedBox(height: 70,),
      
            ],
          ),
        ),
      ),
    );

  }
}
