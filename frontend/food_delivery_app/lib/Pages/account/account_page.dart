
import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/bigText.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/dimentions.dart';
import '../../Utils/icon_style.dart';
import '../../widgets/account_widget.dart';

class AccountPage extends StatelessWidget {
  var sharedPreferences=Get.find<SharedPreferences>();
  AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(
          top: Dimensions.height20,
        ),
        child: Column(
          children: [
            const AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: 75,
              size: 150,
            ),
            SizedBox(height: Dimensions.height30,),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    AccountWidget(
                      appIcon: const AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                      bigText: BigText(
                        text:sharedPreferences.getString("username")!,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    AccountWidget(
                      appIcon: const AppIcon(
                        icon: Icons.phone,
                        backgroundColor: Colors.yellow,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                      bigText: BigText(
                        text:sharedPreferences.getString("userphonenumber")!,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    AccountWidget(
                      appIcon: const AppIcon(
                        icon: Icons.email,
                        backgroundColor: Colors.yellow,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                      bigText: BigText(
                        text:sharedPreferences.getString("useremail")!,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    AccountWidget(
                      appIcon: const AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: Colors.yellow,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                      bigText: BigText(
                        text:'Fill in your address',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 60,),
                    ElevatedButton(
                        onPressed: (){
                          sharedPreferences.setBool("isUserLoggedIn", false);
                          sharedPreferences.clear();
                          Get.offAndToNamed(RouteHelper.signInPage);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mainContainerColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Rounded corners
                        ),
                      ),
                        child: const Text("Sign Out"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
