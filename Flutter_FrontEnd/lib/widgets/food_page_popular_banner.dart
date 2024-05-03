
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/color_utils.dart';
import 'package:intl/intl.dart';

import '../Utils/bigText.dart';
import '../Utils/dimentions.dart';
import '../Utils/small_text.dart';
import '../models/popular_products_model.dart';
import 'icon_and_text_widget.dart';

class FoodPagePopularBanner extends StatelessWidget {
  ProductModel itemlist;
  FoodPagePopularBanner({Key? key,required this.itemlist}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5,left: Dimensions.height10,right: Dimensions.height10,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BigText(text: itemlist.name!,size: Dimensions.font16,color: AppColors.mainSecondaryColor,),
          SizedBox(height: Dimensions.height10/1.7),
          SmallText(text: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(itemlist.createdAt!)),),
          SizedBox(height: Dimensions.height10/1.7),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndTextWidget(icon: Icons.circle, iconColor: Colors.orange, text: "Normal"),
              IconAndTextWidget(icon: Icons.location_on, iconColor: Colors.greenAccent, text: "1.7km"),
              IconAndTextWidget(icon: Icons.access_time, iconColor: Colors.red, text: "32min"),
            ],
          ),

        ],
      ),
    );
  }
}
