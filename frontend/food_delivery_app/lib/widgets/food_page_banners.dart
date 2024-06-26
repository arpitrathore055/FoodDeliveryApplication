
import 'package:flutter/material.dart';

import '../Utils/bigText.dart';
import '../Utils/color_utils.dart';
import '../Utils/dimentions.dart';
import '../Utils/small_text.dart';
import 'icon_and_text_widget.dart';

class FoodPageBanner extends StatelessWidget {
  final String text;
  const FoodPageBanner({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimensions.font20,color: AppColors.mainSecondaryColor,),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) => const Icon(Icons.star,color: AppColors.mainColor,size: 15)),
            ),
            SizedBox(width: Dimensions.width10),
            SmallText(text: "4.5"),
            SizedBox(width: Dimensions.width10),
            SmallText(text: "12837 comments"),
          ],
        ),
        SizedBox(height: Dimensions.height10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndTextWidget(icon: Icons.circle, iconColor: Colors.orange, text: "Normal"),
            IconAndTextWidget(icon: Icons.location_on, iconColor: Colors.greenAccent, text: "1.7km"),
            IconAndTextWidget(icon: Icons.access_time, iconColor: Colors.red, text: "32min"),
          ],
        ),

      ],
    );
  }
}
