import 'package:flutter/material.dart';
import 'package:supersonicapp/utils/appcolors.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class TextFormScreen extends StatelessWidget {
  // final TextEditingController textEditingController;
  // final String hinttext;
  // const TextFormScreen({
  //   Key? key,
  //   required this.textEditingController,
  //   required this.hinttext,
  // }) : super(key: key);

  final TextEditingController textEditingController;
  final String hinttext;
  final IconData icon;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool obscure;
  final bool obscure1;
  final bool suffixIcon;
  final Widget? suffixIconWidget;
  final void Function()? onPressed;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;

  TextFormScreen({
    Key? key,
    required this.textEditingController,
    required this.hinttext,
    required this.icon,
    this.obscure = true,
    this.obscure1 = true,
    this.validator,
    this.readOnly = false,
    this.suffixIcon = false,
    this.suffixIconWidget,
    this.onPressed,
    this.keyboardType,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.w),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
            ),
          ]),
      child: TextFormField(
        onChanged: onChanged,
        controller: textEditingController,
        readOnly: readOnly,
        obscureText: suffixIcon ? obscure : false,
        keyboardType: keyboardType,
        cursorColor: AppColors.primarycolor,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hinttext,
            hintStyle: TextStyle(fontSize: 14.sp, fontFamily: 'Roboto'),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.w),
                )),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.w),
                )),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.w),
                )),
            prefixIcon: Icon(
              icon,
              color: AppColors.primarycolor,
              size: 3.h,
              // color: AppColors.appPrimarycolor,
            ),
            suffixIcon: suffixIcon
                ? suffixIconWidget ??
                    IconButton(
                        onPressed: onPressed,
                        icon: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility,
                          //   obscure1 ? Icons.visibility_off : Icons.visibility,
                          // color: colorBlack,
                        ))
                : null),
        validator: validator,
      ),
    );
  }
}
