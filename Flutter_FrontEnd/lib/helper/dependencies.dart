import 'package:food_delivery_app/data/controllers/sign_in_controller.dart';
import 'package:food_delivery_app/data/controllers/sign_up_controller.dart';
import 'package:food_delivery_app/data/repository/sign_in_repo.dart';
import 'package:food_delivery_app/data/repository/sign_up_repo.dart';
import 'package:food_delivery_app/models/User.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/app_constants.dart';
import '../data/API/API_Client.dart';
import '../data/controllers/cart_product_controller.dart';
import '../data/controllers/location_controller.dart';
import '../data/controllers/popular_product_controller.dart';
import '../data/controllers/recommended_product_controller.dart';
import '../data/repository/cart_product_repo.dart';
import '../data/repository/location_repo.dart';
import '../data/repository/popular_product_repo.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init() async {

  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(()=> sharedPreferences);
  //api client
  Get.lazyPut(()=> ApiClient(appBaseUrl: AppConstant.baseUrl));


  //repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartProductRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() => SignInRepo(apiClient: Get.find()));
  Get.lazyPut(() => SignUpRepo(apiClient: Get.find()));
  Get.lazyPut(()=> LocationRepo(apiClient: Get.find(), sharedPreference: Get.find()));

  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartProductController(cartRepo: Get.find()));
  Get.lazyPut(() => SignInController(signInRepo: Get.find()));
  Get.lazyPut(() => SignUpController(signUpRepo: Get.find()));
  Get.lazyPut(() => LocationController());

}