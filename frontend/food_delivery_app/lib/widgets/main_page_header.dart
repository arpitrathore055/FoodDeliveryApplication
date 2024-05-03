
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/dimentions.dart';

import '../Utils/bigText.dart';
import '../Utils/color_utils.dart';
import '../Utils/small_text.dart';

class MainPageHeader extends StatelessWidget {
  const MainPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("India",style: TextStyle(
                fontFamily: "cursive",
                fontSize: Dimensions.font26,
                fontWeight: FontWeight.bold,
                color:AppColors.mainContainerColor,
              ),
            ),
            //BigText(text: "India",color: AppColors.mainContainerColor),
            Row(
              children: [
                SmallText(text:"Rajasthan",color: AppColors.mainSecondaryColor,),
                const Icon(Icons.arrow_drop_down,color: AppColors.mainSecondaryColor,),
              ],
            )
          ],
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              color: AppColors.mainContainerColor,
              borderRadius: BorderRadius.circular(15)
          ),
          child: const Icon(Icons.search,color: Colors.white),
        )
      ],
    );
  }
}
