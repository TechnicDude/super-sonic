import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supersonicapp/api/api.dart';
import 'package:supersonicapp/utils/app_validator.dart';
import 'package:supersonicapp/utils/appcolors.dart';
import 'package:supersonicapp/utils/apphelper.dart';
import 'package:supersonicapp/utils/appimages.dart';
import 'package:supersonicapp/utils/buttonwidget.dart';
import 'package:supersonicapp/utils/buttonwidgetloader.dart';
import 'package:supersonicapp/utils/dialoghelper.dart';
import 'package:supersonicapp/utils/textform.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final ImagePicker imgpicker = ImagePicker();
  XFile? imagefiles;

  openImages() async {
    try {
      final XFile? image =
          await imgpicker.pickImage(source: ImageSource.camera);

      if (image != null) {
        setState(() {
          imagefiles = image;
        });
      } else {
        DialogHelper.showFlutterToast(strMsg: 'No image is selected');
      }
    } catch (e) {
      DialogHelper.showFlutterToast(strMsg: 'Error while picking file');
    }
  }

  Future submitupdate() async {
    if (imagefiles != null) {
      var url = Uri.parse(ApiUrl.updateprofile);

      final request = http.MultipartRequest('POST', url);
      // Map<String, String> headers = {
      //   "Authorization": 'Bearer ${MyApp.AUTH_TOKEN_VALUE?.trim()}'
      // };
      // print(imagefiles!.path);
      // request.headers.addAll(headers);
      // print(request.headers);

      final file = await http.MultipartFile.fromPath('photo', imagefiles!.path);

      request.files.add(file);

      request.fields['user_id'] = AppHelper.userInfo!.id.toString();
      request.fields['name'] = firstnameController.text;

      request.fields['email'] = emailController.text;
      // request.fields['id'] = MyApp.userid!;

      try {
        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);
        print(response.body);
        var out = jsonDecode(response.body);
        if (out['status'] == "success") {
          DialogHelper.showFlutterToast(strMsg: out['msg']);
          Navigator.pop(context);
        }
      } catch (e) {
        print(e);
      }
    } else {
      var url = Uri.parse(ApiUrl.updateprofile);

      final request = http.MultipartRequest('POST', url);
      // Map<String, String> headers = {
      //   "Authorization": 'Bearer ${MyApp.AUTH_TOKEN_VALUE?.trim()}'
      // };
      // print(imagefiles!.path);
      // request.headers.addAll(headers);
      // print(request.headers);
      // final file = await http.MultipartFile.fromPath('photo', imagefiles!.path);
      // request.files.add(file);

      request.fields['user_id'] = AppHelper.userInfo!.id.toString();
      request.fields['name'] = firstnameController.text;

      request.fields['email'] = emailController.text;
      // request.fields['id'] = MyApp.userid!;

      try {
        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);
        print(response.body);
        var out = jsonDecode(response.body);
        if (out['status'] == "success") {
          DialogHelper.showFlutterToast(strMsg: out['msg']);
          Navigator.pop(context);
        }
      } catch (e) {
        print(e);
      }
    }
  }

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    firstnameController.text = AppHelper.userInfo!.name!;
    emailController.text = AppHelper.userInfo!.email!;
    mobileController.text = AppHelper.userInfo!.mobile!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Padding(
        padding: EdgeInsets.only(top: 4.h, left: 2.h, right: 2.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // BackButtonscreen(
              //   text: "Edit Profile",
              // ),
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.colorGrey,
                  backgroundImage: imagefiles != null
                      ? FileImage(File(imagefiles!.path))
                      : AssetImage(
                          AppImages.profile,
                        ) as ImageProvider,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        // _editProfileController.showPopupMenu();
                        openImages();
                      },
                      child: CircleAvatar(
                        radius: 2.h,
                        backgroundColor: AppColors.appPrimarycolor,
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Center(
              //   child: CircleAvatar(
              //     radius: 6.h,
              //     backgroundImage: imagefiles != null
              //         ? FileImage(File(imagefiles!.path))
              //         : widget.profileuserdata![0].userAvatar != null
              //             ? NetworkImage(APIURL.imageurl +
              //                 widget.profileuserdata![0].userAvatar.toString())
              //             : AssetImage(ImageFile.profile
              //                 // "assets/images/profile.png",
              //                 ) as ImageProvider,
              //     child: Align(
              //       alignment: Alignment.bottomRight,
              //       child: InkWell(
              //         onTap: () {
              //           //  _editProfileController.showPopupMenu();
              //           openImages();
              //         },
              //         child: CircleAvatar(
              //           radius: 2.h,
              //           backgroundColor: colorSecondry,
              //           child: Icon(
              //             Icons.edit,
              //             color: Colors.white,
              //             size: 2.h,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              SizedBox(
                height: 2.h,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "First Name",
                            // style: Style_File.title.copyWith(color: colorGrey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextFormScreen(
                        hinttext: 'First Name*',
                        icon: Icons.account_circle,
                        textEditingController: firstnameController,
                        validator: AppValidator.nameValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Last Name",
                            // style: Style_File.title.copyWith(color: colorGrey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextFormScreen(
                        hinttext: 'Last Name*',
                        icon: Icons.account_circle,
                        textEditingController: lastnameController,
                        validator: AppValidator.lastnameValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "E-mail",
                            //style: Style_File.title.copyWith(color: colorGrey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextFormScreen(
                        hinttext: 'E-mail*',
                        icon: Icons.mail,
                        textEditingController: emailController,
                        validator: AppValidator.emailValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Phone number",
                            // style: Style_File.title.copyWith(color: colorGrey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextFormScreen(
                        hinttext: 'Phone Number*',
                        icon: Icons.phone_android_rounded,
                        textEditingController: mobileController,
                        validator: AppValidator.mobileValidator,
                      ),
                    ],
                  )),

              SizedBox(
                height: 5.h,
              ),

              !isLoading
                  ? ButtonWidget(
                      text: 'Update',
                      onTap: () {
                        if (isLoading) {
                          return;
                        }
                        submitupdate();

                        // update(
                        //   firstnameController.text,
                        //   lastnameController.text,
                        //   emailController.text,
                        //   mobileController.text,
                        // );

                        // submitupdate();
                      },
                    )
                  : ButtonWidgetLoader(),

              SizedBox(
                height: 4.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
