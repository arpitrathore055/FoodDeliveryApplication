import 'package:flutter/material.dart';
import 'package:food_delivery_app/Pages/auth/sign_in_page.dart';
import 'package:food_delivery_app/Utils/dimentions.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/Home/home_page.dart';
import 'data/controllers/cart_product_controller.dart';
import 'data/controllers/popular_product_controller.dart';
import 'data/controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var sharedPreferences=Get.find<SharedPreferences>();

    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    Get.find<CartProductController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 194, 203)
              ),
              primaryColor: const Color.fromARGB(255, 0, 194, 203)
          ),
          home:(sharedPreferences.getBool("isUserLoggedIn")==false || sharedPreferences.getBool("isUserLoggedIn")==null)? const SignInPage() : const HomePage(),
          // initialRoute: RouteHelper.initial,
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
