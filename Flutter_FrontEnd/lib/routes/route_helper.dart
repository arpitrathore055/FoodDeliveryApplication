
import 'package:get/get.dart';

import '../Pages/Cart/cart_page.dart';
import '../Pages/Food/popular_food_details.dart';
import '../Pages/Food/recommended_food_page_deatails.dart';
import '../Pages/Home/home_page.dart';
import '../Pages/auth/sign_in_page.dart';

class RouteHelper{
  static const String initial = "/";
  static String getInitial()=>initial;

  static const String signInPage = "/signIn-page";
  static String getSignInPage()=>signInPage;

  static const String homePage = "/home-page";
  static String getHomePage()=>homePage;

  static const String popularFood = "/popular_food";
  static String getPopularFood(int pageId)=> '$popularFood?pageId=$pageId';

  static const String recommendedFood = "/recommended_food";
  static String getRecommendedFood(int pageId)=> '$recommendedFood?pageId=$pageId';

  static const String cartPage = '/cart-page';
  static String getCartPage()=>cartPage;


  static List<GetPage> routes=[
    GetPage(name: initial, page: (){
      return const HomePage();
    }),

    GetPage(name: signInPage, page: (){
      return const SignInPage();
    }),

    GetPage(name: homePage, page: (){
      return const HomePage();
    }),

    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters['pageId'];
      return PopularFoodDetails(pageId: int.parse(pageId!));
    }),

    GetPage(name: recommendedFood, page: (){

      var pageId = Get.parameters['pageId'];
      return RecommendedFoodDetails(pageId: int.parse(pageId!));
    }),

    GetPage(name: cartPage, page: (){
      return const CartPage();
    })
  ];
}