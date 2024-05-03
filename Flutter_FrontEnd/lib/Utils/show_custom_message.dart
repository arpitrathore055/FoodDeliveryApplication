import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/color_utils.dart';
import 'package:get/get.dart';

import 'bigText.dart';

void showCustomSnackBar(String message, {bool isError = true, String title = 'Error'}){
  Get.snackbar(
    title,
    message,
    titleText: BigText(text: title,color: Colors.white),
    messageText: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    colorText: Colors.white,
    backgroundColor:(isError)?Colors.redAccent:AppColors.mainContainerColor,
    snackPosition: SnackPosition.TOP,
  );
}