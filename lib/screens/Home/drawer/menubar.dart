import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supersonicapp/page_routes/routes.dart';
import 'package:supersonicapp/utils/appcolors.dart';
import 'package:supersonicapp/utils/appimages.dart';
import 'package:supersonicapp/utils/appstyle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class MenuBarScreens extends StatelessWidget {
  const MenuBarScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.colorWhite,
      child: ListView(
        padding: EdgeInsets.only(left: 1.h, right: 1.h),
        children: [
          Container(
            height: 18.h,
            child: DrawerHeader(
              child: Image.asset(AppImages.logo),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              size: 18,
              color: Colors.black,
            ),
            title: Text('Home', style: AppStyle.textdrawertitle),
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.bottomNav);
            },
          ),
          const Divider(
            color: Colors.black12,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(
              Icons.widgets_rounded,
              size: 18,
              color: Colors.black,
            ),
            title: Text('Category', style: AppStyle.textdrawertitle),
            onTap: () {
              Navigator.pushNamed(context, Routes.categoryScreen);
            },
          ),
          const Divider(
            color: Colors.black12,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(
              Icons.shopping_cart_rounded,
              size: 18,
              color: Colors.black,
            ),
            title: Text('My Cart', style: AppStyle.textdrawertitle),
            onTap: () {
              //  Navigator.pushNamed(context, Routes.shoppingCartPage);
            },
          ),
          const Divider(
            color: Colors.black12,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 18,
              color: Colors.black,
            ),
            title: Text('My Profile', style: AppStyle.textdrawertitle),
            onTap: () {
              Navigator.pushNamed(context, Routes.profileScreen);
            },
          ),
          const Divider(
            color: Colors.black12,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(
              Icons.login,
              size: 18,
              color: Colors.black,
            ),
            title: Text("Logout",
                //  MyApp.userid == null ? 'Logga in' : 'Logga ut',
                style: AppStyle.textdrawertitle),
            onTap: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.INFO,
                btnOkColor: AppColors.appPrimarycolor,
                borderSide:
                    BorderSide(color: AppColors.appPrimarycolor, width: 0.1.h),
                buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
                headerAnimationLoop: false,
                animType: AnimType.BOTTOMSLIDE,
                title: 'Logout',
                desc: 'Are you sure wants to logout Supersonic?',
                showCloseIcon: true,
                // btnCancelOnPress: () {
                //   Navigator.pop(context);
                // },
                btnOkOnPress: () {
                  Navigator.pushNamed(context, Routes.loginScreen);
                  // if (MyApp.userid == null) {
                  //   Navigator.pushNamed(context, Routes.loginScreen);
                  // } else {
                  //   MyApp.logout();
                  //   Navigator.of(context, rootNavigator: true)
                  //       .pushNamedAndRemoveUntil(Routes.loginScreen,
                  //           (Route<dynamic> route) => false);
                  // }
                },
              )..show();
            },
          ),
          const Divider(
            color: Colors.black12,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
