
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/recommended_food_list.dart';
import 'package:get/get.dart';

import '../Utils/app_constants.dart';
import '../Utils/bigText.dart';
import '../Utils/color_utils.dart';
import '../Utils/dimentions.dart';
import '../Utils/small_text.dart';
import '../data/controllers/popular_product_controller.dart';
import '../data/controllers/recommended_product_controller.dart';
import '../models/popular_products_model.dart';
import '../routes/route_helper.dart';
import 'food_page_banners.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}
class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue=pageController.page!;
      });
    });
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Slider Section
        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return popularProduct.isLoaded? SizedBox(
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: popularProduct.popularProductList.length,
                itemBuilder: (context, index) {
                  return _buildPageItem(index,popularProduct.popularProductList[index]);
                }
            ),
          ):const CircularProgressIndicator(
            color: AppColors.mainContainerColor,
          );
        }),
        //Scrolling Dots
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty? 1:popularProducts.popularProductList.length,
            position: _currPageValue.toInt(),
            decorator: DotsDecorator(
              activeColor: AppColors.mainContainerColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius20)),
            ),

          );
        }),
        //Popular text
        SizedBox(height: Dimensions.height20),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended",color: AppColors.mainSecondaryColor,),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text:".",color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: SmallText(text: "Food pairing")
              ),
            ],
          ),
        ),
        SizedBox(height: Dimensions.height30),
        //Recommended list of food and images
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isLoaded?  MediaQuery.removePadding(
            context: context,
            removeTop: true,

            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recommendedProduct.recommendedProductList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteHelper.getRecommendedFood(index));
                      },
                      child: PopularFoodList(itemList: recommendedProduct.recommendedProductList[index]));
                }),
          ) : const CircularProgressIndicator(color: AppColors.mainColor,);
        })
      ],
    );
  }
  Widget _buildPageItem(int index, ProductModel popularProduct) {

    return Stack(
        children: [
          GestureDetector(

            onTap: ()=>Get.toNamed(RouteHelper.getPopularFood(index)),

            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(right: Dimensions.width10,left: Dimensions.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: index.isEven? const Color(0xff69c5df): const Color(0xff00c2cb),
                  image: DecorationImage(
                    image: NetworkImage(popularProduct.img!/*AppConstant.imageLoadingUrl+AppConstant.uploadUrl+popularProduct.img!*/),
                    fit: BoxFit.cover,
                  )
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(right: Dimensions.width30,left: Dimensions.width30,bottom: Dimensions.height30),
              padding: EdgeInsets.only(top: Dimensions.height15,left: Dimensions.height15,right: Dimensions.height15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      offset: const Offset(5,5),
                      blurRadius: 5
                  )
                ],
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: FoodPageBanner(text: popularProduct.name.toString()),
            ),
          ),

        ]);
  }
}