// ignore_for_file:

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:supersonicapp/api/loginapi.dart';
import 'package:supersonicapp/page_routes/routes.dart';
import 'package:supersonicapp/utils/app_validator.dart';
import 'package:supersonicapp/utils/appcolors.dart';
import 'package:supersonicapp/utils/apphelper.dart';
import 'package:supersonicapp/utils/appstringfile.dart';
import 'package:supersonicapp/utils/appstyle.dart';
import 'package:supersonicapp/utils/buttonwidget.dart';
import 'package:supersonicapp/utils/buttonwidgetloader.dart';
import 'package:supersonicapp/utils/dialoghelper.dart';
import 'package:supersonicapp/utils/loaderscreen.dart';
import 'package:supersonicapp/utils/textform.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpForm extends StatefulWidget {
  final Function? callback;
  const SignUpForm({
    super.key,
    this.callback,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController firstnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirepasswordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  String error = "";
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text("Languages.of(context)!.rolemessage"), value: ""),
      DropdownMenuItem(
          child: Text("Languages.of(context)!.customers"), value: "3"),
      DropdownMenuItem(
          child: Text("Languages.of(context)!.sellers"), value: "2"),
    ];
    return menuItems;
  }

  bool isLoading = false;
  bool isShowLoading = false;

  bool _obscureText = true;
  bool _obscureTexts = true;
  bool valuedata = false;
  String? selectedValue = "";
  final _dropdownFormKey = GlobalKey<FormState>();
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggles() {
    setState(() {
      _obscureTexts = !_obscureTexts;
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
              TextFormScreen(
                hinttext: "firstname",
                icon: Icons.account_circle,
                textEditingController: firstnameController,
                validator: AppValidator.nameValidator,
              ),
              SizedBox(
                height: 1.5.h,
              ),

              TextFormScreen(
                textEditingController: emailController,
                hinttext: "email",
                icon: Icons.email,
                validator: AppValidator.emailValidator,
              ),
              SizedBox(
                height: 1.5.h,
              ),

              TextFormScreen(
                hinttext: "password",
                icon: Icons.lock,
                textEditingController: passwordController,
                validator: AppValidator.passwordValidator,
                suffixIcon: true,
                obscure: _obscureText,
                onPressed: _toggle,
              ),
              Text(
                "(Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character)",
                style: AppStyle.textcatsubtitle.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 1.h,
              ),
              // Text(
              //   Languages.of(context)!.confirmpassword,
              //   style: AppStyle.texttitle.copyWith(color: Colors.black),
              // ),
              TextFormScreen(
                hinttext: "confirm password",
                textEditingController: confirepasswordController,
                validator: AppValidator.passwordValidator,
                obscure: _obscureTexts,
                onPressed: _toggles,
                icon: Icons.lock,
                suffixIcon: true,
              ),
              SizedBox(
                height: 1.5.h,
              ),

              TextFormScreen(
                hinttext: "mobile",
                icon: Icons.phone_android_rounded,
                textEditingController: mobileController,
                validator: AppValidator.mobileValidator,
              ),
              SizedBox(
                height: 1.h,
              ),
              // Text(
              //   Languages.of(context)!.role,
              //   style: AppStyle.texttitle.copyWith(color: Colors.black),
              // ),

              Row(
                children: [
                  Checkbox(
                    value: this.valuedata,
                    onChanged: (value) {
                      setState(() {
                        this.valuedata = value!;
                      });
                    },
                  ),
                  InkWell(
                    onTap: () {
                      //Navigator.pushNamed(context, Routes.termscondition);
                    },
                    child: Row(
                      children: [
                        Text(
                          "I accept the",
                          style: AppStyle.textcatsubtitle
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          "  Termes and conditions",
                          style: AppStyle.textcatsubtitle
                              .copyWith(color: AppColors.primarycolor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: Text(
                  error,
                  style: AppStyle.textcatsubtitle.copyWith(color: Colors.red),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              ButtonWidget(
                text: "Signup",
                onTap: () {
                  if (isLoading) {
                    return;
                  }
                  setState(() {
                    error = "";
                  });

                  signup(
                    firstnameController.text,
                    emailController.text,
                    passwordController.text,
                    confirepasswordController.text,
                    mobileController.text,
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  signup(name, email, password, confirmpassword, mobile) async {
    setState(() {
      widget.callback!(true);
      isLoading = true;
    });

    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        if (selectedValue != "") {
          if (valuedata) {
            if (confirepasswordController.text == passwordController.text) {
              var data = {
                "name": firstnameController.text.toString().trim(),
                "email": emailController.text.toString().trim(),
                "password": passwordController.text.toString().trim(),
                "psw_repeat": passwordController.text.toString().trim(),
                "mobile": mobileController.text.toString().trim(),
                "address": "",
                "country_code": "",
                "image": "",
                "role_id": selectedValue,
              };
              LoginApi loginApi = LoginApi(data);
              final response = await loginApi.register();

              if (response['status'].toString().toLowerCase() == "success") {
                DialogHelper.showFlutterToast(
                    strMsg: "Languages.of(context)!.labelWelcome");
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                AppHelper.role = selectedValue.toString();
                sharedPreferences.setString(
                    AppStringFile.role, selectedValue.toString());
                Navigator.pushNamed(context, Routes.otpVerify,
                    arguments: {AppStringFile.email: emailController.text});
                setState(() {
                  widget.callback!(false);
                  isLoading = false;
                });
              } else {
                DialogHelper.showFlutterToast(
                    strMsg: response['error'].toString());
                setState(() {
                  error = response['error'].toString();
                  widget.callback!(false);
                  isLoading = false;
                });
              }
            } else {
              AppHelper().dialogBuilder(context, "Languages.of(context)!.alter",
                  "Languages.of(context)!.pleaseaccettermesandcondtions");
              setState(() {
                widget.callback!(false);
                isLoading = false;
              });
            }
          } else {
            AppHelper().dialogBuilder(context, "Languages.of(context)!.alter",
                "Languages.of(context)!.pleaseaccettermesandcondtions");
            setState(() {
              widget.callback!(false);
              isLoading = false;
            });
          }
        } else {
          AppHelper().dialogBuilder(context, "Languages.of(context)!.alter",
              "Languages.of(context)!.rolemessage");
          setState(() {
            widget.callback!(false);
            isLoading = false;
          });
        }
      } else {
        setState(() {
          widget.callback!(false);
          isLoading = false;
        });
      }
    } else {
      AppHelper()
          .dialogBuilder(context, "", "Internet connection not available");
      setState(() {
        widget.callback!(false);
        isLoading = false;
      });
    }
  }
}
