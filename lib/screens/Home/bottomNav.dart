import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supersonicapp/provider/addtocardProvider.dart';
import 'package:supersonicapp/provider/categoryProvider.dart';

import 'package:supersonicapp/provider/dashboardProvider.dart';
import 'package:supersonicapp/provider/profileProvider.dart';
import 'package:supersonicapp/screens/Home/drawer/menubar.dart';
import 'package:supersonicapp/screens/Home/home_page.dart';
import 'package:supersonicapp/screens/addtocard/addtocard.dart';
import 'package:supersonicapp/screens/categories/categories.dart';
import 'package:supersonicapp/screens/profile/profilescreen.dart';
import 'package:supersonicapp/utils/appcolors.dart';
import 'package:provider/provider.dart';
import 'package:supersonicapp/utils/appstyle.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  bool isHomePageSelected = true;
  GlobalKey<ScaffoldState> _key = GlobalKey();
  List page = [];

  int _selectindex = 0;
  onBottomIconPressed(int index) {
    setState(() {
      _selectindex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetdata();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  fetdata() {
    page = [
      ChangeNotifierProvider<DashBoradProvider>(
          create: (BuildContext context) => DashBoradProvider(),
          child: MyHomePage(
            callback: (value) {
              if (value == "okopen") {
                _key.currentState!.openDrawer();
              }
            },
          )),
      ChangeNotifierProvider<CategoryProvider>(
          create: (BuildContext context) => CategoryProvider(),
          child: CategorisScreenActivity()),
      ChangeNotifierProvider<AddtoCardProductListProvider>(
          create: (BuildContext context) => AddtoCardProductListProvider(),
          child: AddToCardScreenActivity()),
      ChangeNotifierProvider<ProfileProvider>(
          create: (BuildContext context) => ProfileProvider(),
          child: ProfileScreen()),
    ];
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: AppColors.appbakgroundcolor,
      drawer: MenuBarScreens(),
      body: SafeArea(child: page[_selectedIndex]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: AppColors.primarycolor,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  textStyle: AppStyle.textcatsubtitle
                      .copyWith(color: AppColors.primarycolor),
                ),
                GButton(
                    icon: Icons.widgets_rounded,
                    text: "categories",
                    textStyle: AppStyle.textcatsubtitle.copyWith(
                        color: AppColors.primarycolor, fontSize: 13.sp)),
                GButton(
                    icon: Icons.add_shopping_cart_rounded,
                    text: 'Add Cart',
                    textStyle: AppStyle.textcatsubtitle
                        .copyWith(color: AppColors.primarycolor)),
                GButton(
                    icon: Icons.person,
                    text: 'Profile',
                    textStyle: AppStyle.textcatsubtitle
                        .copyWith(color: AppColors.primarycolor)),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
