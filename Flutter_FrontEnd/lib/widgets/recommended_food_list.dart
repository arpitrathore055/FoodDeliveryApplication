
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/app_constants.dart';
import '../Utils/dimentions.dart';
import '../data/controllers/popular_product_controller.dart';
import '../models/popular_products_model.dart';
import 'food_page_popular_banner.dart';

class PopularFoodList extends StatelessWidget {
  ProductModel itemList;
  PopularFoodList({required this.itemList,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height10),
      child: Row(
        children: [
          //Image Part
          GetBuilder<PopularProductController>(builder: (popularProduct) {
            return Container(
              width: Dimensions.listViewImage,
              height: Dimensions.listViewImage,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white38,
                image: DecorationImage(
                  image: NetworkImage(itemList.img/*AppConstant.imageLoadingUrl+AppConstant.uploadUrl+itemList.img*/!),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
          //Text Part
          Expanded(
            child: Container(
                height: Dimensions.listViewTextContainer,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    bottomRight: Radius.circular(Dimensions.radius20),

                  ),

                ),
                child: FoodPagePopularBanner(itemlist: itemList)
            ),
          )
        ],
      ),
    );
  }
}
