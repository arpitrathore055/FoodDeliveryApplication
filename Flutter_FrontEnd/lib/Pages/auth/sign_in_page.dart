
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Pages/auth/sign_up_page.dart';
import 'package:food_delivery_app/data/controllers/sign_in_controller.dart';
import 'package:get/get.dart';

import '../../Utils/bigText.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/dimentions.dart';
import '../../widgets/app_text_fill.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var signInController=Get.find<SignInController>();
    //final _auth = FirebaseAuth.instance;

    return SafeArea(
      top: false,
      child: Obx(
          ()=>Scaffold(
            body: (signInController.isLoading.value)?const Center(
              child: CircularProgressIndicator(
                color: AppColors.mainContainerColor,
              ),
            ):SingleChildScrollView(
                child: Form(
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
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          top: 20,
                          right: 20,
                        ),
                        //alignment: Alignment.bottomLeft,
                        child: Column(
                          children: [
                            const Text("Hello",style: TextStyle(
                              fontFamily: "cursive",
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color:AppColors.mainContainerColor,
                            ),
                            ),
                            BigText(
                              text: "Sign into your account",
                              size: 20,
                              color: AppColors.mainSecondaryColor,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      AppTextField(
                        textController: emailController,
                        hintText: 'Enter your email',
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 20,),
                      AppTextField(
                        textController: passwordController,
                        hintText: 'Enter your password',
                        icon: Icons.password_sharp,
                        isHidden: true,
                      ),
                      SizedBox(height: Dimensions.height40,),
                      GestureDetector(

                        onTap: (){
                          print(emailController.text+" "+passwordController.text);
                          signInController.checkCredentials(emailController.text, passwordController.text);
                          // _auth.signInWithEmailAndPassword(
                          //     email: emailController.text, password: passwordController.text)
                          //     .then((value) => {
                          //   Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage())),
                          // });
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
                              text: 'Sign in',
                              size: Dimensions.font20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50,),
                      RichText(
                        text: TextSpan(
                          text: "Don't have an account?",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=> const SignUpPage()),
                              text: " Create one",
                              style: const TextStyle(
                                color:AppColors.mainContainerColor,
                                fontSize: 16,
                              ),)
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),
      ),
    );
  }
}
