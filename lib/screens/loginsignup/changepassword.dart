import 'dart:io';

import 'package:flutter/material.dart';
import 'package:supersonicapp/screens/loginsignup/components/change_password_form.dart';
import 'package:supersonicapp/utils/appstyle.dart';
import 'package:supersonicapp/utils/mainbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 4.h, right: 2.h, left: 2.h),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                ],
              ),
              const MainBar(
                text: "Change Password",
              ),
              SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ChangePasswordForm(),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
