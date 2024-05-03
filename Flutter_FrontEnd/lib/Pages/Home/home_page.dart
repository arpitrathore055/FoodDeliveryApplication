
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Pages/address/add_address_page.dart';
import 'package:food_delivery_app/Utils/color_utils.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../Cart/cart_history.dart';
import '../account/account_page.dart';
import 'main_food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late PersistentTabController _controller;

  List <Widget> _buildScreen() {
    return [
      const MainFoodPage(),
      AddAddressPage(),
      const CartHistory(),
      AccountPage()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: "Home",
          activeColorPrimary: AppColors.mainContainerColor,
        inactiveColorPrimary: AppColors.mainSecondaryColor,
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.archive),
          title: "History",
          inactiveColorPrimary: AppColors.mainSecondaryColor,
          activeColorPrimary: AppColors.mainContainerColor,
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_cart),
          title: "Cart",
          activeColorPrimary: AppColors.mainContainerColor,
        inactiveColorPrimary: AppColors.mainSecondaryColor,
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: "Me",
          activeColorPrimary: AppColors.mainContainerColor,
        inactiveColorPrimary: AppColors.mainSecondaryColor,
      )
    ];
  }

  @override
  void initState(){
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  void onTapNav(int index){
    setState((){
    });
  }

  @override
  Widget build(BuildContext context){
    return PersistentTabView(
      context,
      screens: _buildScreen(),
      items: _navBarItems(),
      controller: _controller,

      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0.0),
        colorBehindNavBar: Colors.black,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      navBarStyle: NavBarStyle.style9,
    );
  }
}
