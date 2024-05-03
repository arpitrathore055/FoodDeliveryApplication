

import 'package:flutter/material.dart';
import 'package:food_delivery_app/Pages/Home/home_page.dart';
import 'package:get/get.dart';

import '../../Utils/app_constants.dart';
import '../../Utils/bigText.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/dimentions.dart';
import '../../Utils/icon_style.dart';
import '../../Utils/small_text.dart';
import '../../data/controllers/cart_product_controller.dart';
import '../../data/controllers/popular_product_controller.dart';
import '../../data/controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';
import '../Home/main_food_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height30*2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    },
                      icon:Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.mainColor,
                        size: Dimensions.iconSize24,
                      ),
                      alignment: Alignment.center,
                    ),
                    SizedBox(width: Dimensions.width20*5),
                    GestureDetector(
                      onTap: () {
                        Get.to(()=> const HomePage());
                      },
                      child: AppIcon(
                        icon: Icons.home_outlined,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize24,
                      ),
                    ),
                    AppIcon(
                      icon: Icons.shopping_cart,
                      backgroundColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ],
                )
            ),
            Positioned(
                top: Dimensions.height20*5,
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.only(top: Dimensions.height15),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GetBuilder<CartProductController>(builder: (cartProduct) {
                      print(cartProduct.getItems.length);
                      return (cartProduct.getItems.length==0)?Center(
                        child: BigText(text: "No Items Added",color: AppColors.mainSecondaryColor,),
                      ):ListView.builder(
                          itemCount: cartProduct.getItems.length,
                          itemBuilder: (_, index) {
                            return SizedBox(
                              height: Dimensions.height20 * 5,
                              width: double.maxFinite,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      var popularIndex = Get.find<PopularProductController>().popularProductList.indexOf(cartProduct.getItems[index].product);
                                      if(popularIndex>=0){
                                        Get.toNamed(RouteHelper.getPopularFood(popularIndex)
                                        );
                                      }else{
                                        var recommendedIndex = Get.find<RecommendedProductController>().recommendedProductList.indexOf(cartProduct.getItems[index].product);
                                        Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex));
                                      }
                                    },
                                    child: Container(
                                      width: Dimensions.height20 * 5,
                                      height: Dimensions.height20 * 5,
                                      margin: EdgeInsets.only(
                                        bottom: Dimensions.height10,),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius20),
                                          color: Colors.white,
                                          image: DecorationImage(
                                            image: NetworkImage(cartProduct.getItems[index].img/*AppConstant.imageLoadingUrl+AppConstant.uploadUrl+cartProduct.getItems[index].img*/!),
                                            fit: BoxFit.cover,
                                          )
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: Dimensions.width10),
                                  Expanded(
                                    child: SizedBox(
                                      height: Dimensions.height20 * 5,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          BigText(text: cartProduct.getItems[index].name!,
                                            color: Colors.black,size: Dimensions.font16,),
                                          SmallText(text: "Spicy"),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              BigText(text: "\$ ${cartProduct.getItems[index].price!}",
                                                color: Colors.redAccent,),
                                              Container(
                                                padding: EdgeInsets.only(
                                                  //top: Dimensions.height10,
                                                    bottom: Dimensions.height10,
                                                    left: Dimensions.width10,
                                                    right: Dimensions.width10),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(
                                                      Dimensions.radius30),
                                                  color: Colors.white,
                                                ),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                        onTap: () {
                                                          cartProduct.addItem(cartProduct.getItems[index].product!, -1);
                                                        },
                                                        child: const Icon(
                                                            Icons.remove)),
                                                    SizedBox(width: Dimensions
                                                        .width10 / 2),
                                                    BigText(text: cartProduct.getItems[index].quantity.toString(),
                                                        size: Dimensions
                                                            .font26),
                                                    SizedBox(width: Dimensions
                                                        .width10 / 2),
                                                    GestureDetector(
                                                        onTap: () {
                                                          cartProduct.addItem(cartProduct.getItems[index].product!,1);
                                                        },
                                                        child: const Icon(
                                                            Icons.add)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    }
                    ),
                  ),
                )
            )
          ],
        ),
        bottomNavigationBar: GetBuilder<CartProductController>(builder: (cartProduct){
          return Container(
            height: 70,
            padding: EdgeInsets.only(right: Dimensions.width20,left: Dimensions.width20),
            margin: EdgeInsets.only(left: Dimensions.width10,right:Dimensions.width10,bottom: Dimensions.height10,),
            decoration: BoxDecoration(
                color: AppColors.mainContainerColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20*1),
                  topRight: Radius.circular(Dimensions.radius20*1),
                  bottomLeft: Radius.circular(Dimensions.radius20*1),
                  bottomRight: Radius.circular(Dimensions.radius20*1),
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height10,bottom: Dimensions.height10,left: Dimensions.width20,right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: Dimensions.width10/2),
                      BigText(text: "\$ "+cartProduct.totalAmount.toString(),size: Dimensions.font26,color: Colors.red,),
                      SizedBox(width: Dimensions.width10/2),
                    ],
                  ),
                ),
                SizedBox(width: Dimensions.width10,),
                GestureDetector(
                  onTap: (){
                    print("tapped");
                    cartProduct.addToHistory();
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height10*1.5,bottom: Dimensions.height10*1.5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white
                    ),
                    child: BigText(text: "Checkout",color: AppColors.mainSecondaryColor,),
                  ),
                ),
              ],
            ),
          );
        })
    );
  }
}
