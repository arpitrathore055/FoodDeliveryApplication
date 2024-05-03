import 'package:flutter/material.dart';

import '../Utils/bigText.dart';
import '../Utils/icon_style.dart';

class AccountWidget extends StatelessWidget {

  AppIcon appIcon;
  BigText bigText;
  AccountWidget({required this.appIcon,required this.bigText,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        left: 20,
        top: 10,
        bottom: 10,
      ),
      child: Row(
        children: [
          appIcon,
          const SizedBox(width: 20,),
          bigText,
        ],
      ),

    );
  }
}
