import 'dart:async';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supersonicapp/api/locdb.dart';
import 'package:supersonicapp/page_routes/routes.dart';
import 'package:supersonicapp/utils/appimages.dart';
import 'package:supersonicapp/utils/loaderscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, homePageRoute);
  }

  homePageRoute() async {
    await LocDb().isLoggedIn();
    bool check = LocDb().loginapp;

    if (check) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.bottomNav, (Route<dynamic> route) => false);
    } else {
      Navigator.pushNamed(context, Routes.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.logo,
                  fit: BoxFit.fill,
                ), 
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Center(
                  child: LoaderScreen(),
                ),
                SizedBox(
                  height: 10.h,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
