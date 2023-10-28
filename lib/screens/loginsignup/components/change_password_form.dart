import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:supersonicapp/page_routes/routes.dart';
import 'package:supersonicapp/utils/app_validator.dart';
import 'package:supersonicapp/utils/buttonwidget.dart';
import 'package:supersonicapp/utils/buttonwidgetloader.dart';
import 'package:supersonicapp/utils/dialoghelper.dart';
import 'package:supersonicapp/utils/textform.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool _obscureText = true;
  bool _obscureText1 = true;
  String _error = '';
  TextEditingController currentpasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmnewpasswordController = TextEditingController();
  bool isShowLoading = false;
  bool isShowConfetti = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                TextFormScreen(
                  textEditingController: currentpasswordController,
                  hinttext: "Current Password",
                  // suffixIcon: true,
                  icon: Icons.lock,
                  // obscure: _obscureText1,
                  // onPressed: _toggle1,

                  validator: AppValidator.currentpasswordValidator,
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFormScreen(
                  textEditingController: newpasswordController,
                  hinttext: "New Password",
                  suffixIcon: true,
                  icon: Icons.lock,
                  obscure: _obscureText,
                  onPressed: _toggle,
                  validator: AppValidator.passwordValidator,
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFormScreen(
                  textEditingController: confirmnewpasswordController,
                  hinttext: "Confirm New Password",
                  suffixIcon: true,
                  icon: Icons.lock,
                  obscure: _obscureText1,
                  onPressed: _toggle1,
                  validator: AppValidator.confirm_passwordValidator,
                ),
                SizedBox(
                  height: 5.h,
                ),
                // Text(
                //   _error,
                //   style: Style_File.subtitle
                //       .copyWith(color: Colors.red, fontSize: 15.sp),
                // ),

                SizedBox(
                  height: 3.h,
                ),

                !isLoading
                    ? ButtonWidget(
                        text: 'Change Password',
                        onTap: () {
                          setState(() {
                            _error = '';
                          });
                          if (isLoading) {
                            return;
                          }

                          changePassword(
                              currentpasswordController.text,
                              newpasswordController.text,
                              confirmnewpasswordController.text);
                        },
                      )
                    : ButtonWidgetLoader(),
              ],
            )),
      ],
    );
  }

  changePassword(String currentpassword, String newpassword,
      String confirmnewpassword) async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        if (newpasswordController.text == confirmnewpasswordController.text) {
          if (currentpasswordController.text != newpasswordController.text) {
            var data = {
              //'id': widget.id,
              'currentPassword': currentpassword,
              'newPassword': newpassword,
              'confirmnewpassword': confirmnewpassword

              // 'email': widget.email,
            };

            DialogHelper.showFlutterToast(
                strMsg: "User New Password Updated!!");
            Navigator.pushReplacementNamed(context, Routes.loginScreen);
          } else {
            DialogHelper.showFlutterToast(
                strMsg: "Current Password is Incorrect");
          }
        }
      } else {
        setState(() {
          isLoading = false;
        });
      }
    }
  }
}
