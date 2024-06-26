import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Utils/app_constants.dart';
import '../../Utils/bigText.dart';
import '../../Utils/color_utils.dart';
import '../../Utils/dimentions.dart';
import '../../Utils/icon_style.dart';
import '../../Utils/small_text.dart';
import '../../data/controllers/cart_product_controller.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var getCartHistoryList = Get.find<CartProductController>()
        .getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = {};

    for(int i=0;i<getCartHistoryList.length;i++) {
      if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
        cartItemsPerOrder.update(getCartHistoryList[i].time!, (value) => ++value);
      }else{
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartOrderTimeToList(){
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }
    List<int> itemsPerOrder = cartOrderTimeToList();
    var saveCounter = 0;

    return SafeArea(
      top: false,
      child: Scaffold(
        body: (getCartHistoryList.length==0)?Container(
          height: Dimensions.screenHeight,
          width: Dimensions.screenWidth,
          child: Center(
            child: BigText(text:"No Records",color: AppColors.mainContainerColor,),
          ),
        ):Column(
          children: [
            Container(
              color: AppColors.mainContainerColor,
              height: 100,
              width: double.maxFinite,
              padding: const EdgeInsets.only(
                top: 45,
                right: 10,
                left: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: "Cart History",color: Colors.white,),
                  const AppIcon(icon: Icons.shopping_cart_outlined,
                    iconColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    iconSize: 25,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20
                ),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      for(int i=0;i<itemsPerOrder.length;i++)
                        Container(
                            margin: EdgeInsets.only(
                              bottom: Dimensions.height20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ((){
                                  DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[saveCounter].time!);
                                  var outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
                                  var outputDate = outputFormat.format(parseDate);
                                  return Text(outputDate,style: const TextStyle(
                                    color: AppColors.mainSecondaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),);
                                }()),
                                SizedBox(height: Dimensions.height10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                        direction: Axis.horizontal,
                                        children: List.generate(itemsPerOrder[i], (index) {
                                          if(saveCounter<getCartHistoryList.length){
                                            saveCounter++;
                                          }
                                          return index<=2? Container(
                                            height: 80,
                                            width: 80,
                                            margin: EdgeInsets.only(
                                              right: Dimensions.width10/2,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(Dimensions.radius20/3),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(/*AppConstant.imageLoadingUrl + AppConstant.uploadUrl + */getCartHistoryList[saveCounter-1].img!,)
                                                )
                                            ),
                                          ) : Container();
                                        })
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        SmallText(text: "Total",color: AppColors.mainSecondaryColor,),
                                        BigText(text: "${itemsPerOrder[i]} Items",size: 16,color: AppColors.mainSecondaryColor,),
                                        Container(

                                          padding: EdgeInsets.symmetric(horizontal: Dimensions.width10,vertical: Dimensions.height10/2),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(Dimensions.radius20/3),
                                              border: Border.all(width: 1,color: AppColors.mainColor)
                                          ),
                                          child: SmallText(text: "one more",color: AppColors.mainColor,),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )
                        )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
/*
Column(
          children: [
            Container(
              color: AppColors.mainContainerColor,
              height: 100,
              width: double.maxFinite,
              padding: const EdgeInsets.only(
                top: 45,
                right: 10,
                left: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: "Cart History",color: Colors.white,),
                  const AppIcon(icon: Icons.shopping_cart_outlined,
                    iconColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    iconSize: 25,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20
                ),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      for(int i=0;i<itemsPerOrder.length;i++)
                        Container(
                            margin: EdgeInsets.only(
                              bottom: Dimensions.height20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ((){
                                  DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[saveCounter].time!);
                                  var outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
                                  var outputDate = outputFormat.format(parseDate);
                                  return Text(outputDate,style: const TextStyle(
                                    color: AppColors.mainSecondaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),);
                                }()),
                                SizedBox(height: Dimensions.height10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                        direction: Axis.horizontal,
                                        children: List.generate(itemsPerOrder[i], (index) {
                                          if(saveCounter<getCartHistoryList.length){
                                            saveCounter++;
                                          }
                                          return index<=2? Container(
                                            height: 80,
                                            width: 80,
                                            margin: EdgeInsets.only(
                                              right: Dimensions.width10/2,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(Dimensions.radius20/3),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(AppConstant.imageLoadingUrl + AppConstant.uploadUrl + getCartHistoryList[saveCounter-1].img!,)
                                                )
                                            ),
                                          ) : Container();
                                        })
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        SmallText(text: "Total",color: AppColors.mainSecondaryColor,),
                                        BigText(text: "${itemsPerOrder[i]} Items",size: 16,color: AppColors.mainSecondaryColor,),
                                        Container(

                                          padding: EdgeInsets.symmetric(horizontal: Dimensions.width10,vertical: Dimensions.height10/2),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(Dimensions.radius20/3),
                                              border: Border.all(width: 1,color: AppColors.mainColor)
                                          ),
                                          child: SmallText(text: "one more",color: AppColors.mainColor,),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )
                        )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
 */