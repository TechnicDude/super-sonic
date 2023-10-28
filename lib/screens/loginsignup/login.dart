// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:supersonicapp/page_routes/routes.dart';
import 'package:supersonicapp/screens/loginsignup/components/sign_in_form.dart';
import 'package:supersonicapp/utils/appcolors.dart';
import 'package:supersonicapp/utils/appimages.dart';
import 'package:supersonicapp/utils/appstyle.dart';
import 'package:supersonicapp/utils/loaderscreen.dart';
import 'package:supersonicapp/utils/mainbar.dart';
import 'package:supersonicapp/utils/socialbutton.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreenActivity extends StatefulWidget {
  const LoginScreenActivity({super.key});

  @override
  State<LoginScreenActivity> createState() => _LoginScreenActivityState();
}

class _LoginScreenActivityState extends State<LoginScreenActivity> {
  bool islooding = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbakgroundcolor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 4.h, right: 2.h, left: 2.h),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Platform.isAndroid
                              ? Icons.arrow_back
                              : Icons.arrow_back_ios,
                        ),
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 100.w - 100,
                        child: Center(
                          child: Image.asset(
                            AppImages.loginimg,
                            height: 26.5.h,
                            width: 55.82.w,
                            // fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  MainBar(text: "Login"),
                  SafeArea(
                      child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignInForm(
                          callback: (value) {
                            if (value) {
                              setState(() {
                                islooding = true;
                              });
                            } else {
                              setState(() {
                                islooding = false;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Don't have account ?",
                            style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: " Signup",
                                  style: TextStyle(
                                    color: AppColors.primarycolor,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.pushNamed(
                                        context, Routes.signupScreen)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: const [
                            Expanded(
                              child: Divider(),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "or login",
                                style: TextStyle(
                                  color: Colors.black26,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialButton(
                                image: AppImages.fb,
                                text: "Facebook",
                                boxcolor: Colors.grey,
                                textcolor: Colors.black,
                                onPressed: () {}),
                            SizedBox(
                              width: 4.w,
                            ),
                            if (Platform.isIOS)
                              SocialButton(
                                  image: AppImages.applewhite,
                                  text: "Apple",
                                  boxcolor: Colors.black,
                                  textcolor: Colors.black,
                                  onPressed: () {}),
                            SizedBox(
                              width: 4.w,
                            ),
                            SocialButton(
                              image: AppImages.google,
                              text: " Google",
                              boxcolor: Colors.grey,
                              textcolor: Colors.black,
                              onPressed: () {},
                            ),
                          ],
                        ),
                       
                        SizedBox(
                          height: 4.h,
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
          if (islooding)
            Container(
              height: 80.h,
              width: 100.w,
              color: Colors.transparent,
              child: LoaderScreen(),
            )
        ],
      ),
    );
  }
}
