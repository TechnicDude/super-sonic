import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supersonicapp/provider/profileProvider.dart';
import 'package:supersonicapp/utils/apphelper.dart';
import 'package:supersonicapp/utils/appstringfile.dart';
import 'package:supersonicapp/utils/title_text_style.dart';
import '../../page_routes/routes.dart';
import '../../utils/appcolors.dart';
import '../../utils/appimages.dart';
import '../../utils/appstyle.dart';
import '../../utils/buttonwidgetloader.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileProvider _profileProvider = ProfileProvider();

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    _profileProvider = Provider.of<ProfileProvider>(context, listen: false);

    fetchdata();
    super.initState();
  }

  fetchdata() async {
    await _profileProvider.gettermscondtion();
    await _profileProvider.getprivacyPolicy();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
        builder: (context, dashBoradProvider, child) {
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.colorWhite,
          ),
          backgroundColor: AppColors.background,
          elevation: 0,
          //title: Text("Account Security", style: AppStyle.mytexttitle),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 10.h,
                decoration: BoxDecoration(
                  color: AppColors.background,
                ),
                child: Padding(
                    padding: EdgeInsets.only(
                        top: 1.h, left: 3.h, right: 2.h, bottom: 2.h),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 8.h,
                          child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 6.h,
                                backgroundImage:
                                    AppHelper.userInfo!.profileImage != null
                                        ? NetworkImage(AppHelper.userInfo!
                                            .profileImage!) as ImageProvider
                                        : AssetImage(
                                            AppImages.profile,
                                          )),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleTextStyle(
                              text: AppHelper.userInfo!.name!,
                              textOverflow: TextOverflow.ellipsis,
                              style:
                                  AppStyle.cardtitle.copyWith(fontSize: 18.sp),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TitleTextStyle(
                              text: AppHelper.userInfo!.email!,
                              textOverflow: TextOverflow.ellipsis,
                              style: AppStyle.cardtitle.copyWith(
                                  fontSize: 15.sp, color: AppColors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.editProfile);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit,
                                size: 20,
                                color: AppColors.primarycolor,
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              Container(
                height: 100.h - 10.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Padding(
                  padding: EdgeInsets.only(top: 4.h, left: 1.5.h, right: 1.5.h),
                  child: Column(
                    children: [
                      accountTextUI(context, Icons.lock_outline,
                          "Change password", Icons.arrow_forward_ios, () {
                        Navigator.pushNamed(
                          context,
                          Routes.changePassword,
                        );
                      }),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      accountTextUI(context, Icons.privacy_tip,
                          "Terms Condition", Icons.arrow_forward_ios, () {
                        if (dashBoradProvider.getcategorydatamodelfetch) {
                          Navigator.pushNamed(context, Routes.detailsscreen,
                              arguments: {
                                AppStringFile.apptitle: "Terms Condition",
                                AppStringFile.appdescrition: dashBoradProvider
                                    .gettermsmodel.termsCondition!.description,
                              });
                        }
                      }),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      accountTextUI(context, Icons.lock_outline,
                          "Privacy Policy", Icons.arrow_forward_ios, () {
                        if (dashBoradProvider.getprivacyPolicymodelfetch) {
                          Navigator.pushNamed(context, Routes.detailsscreen,
                              arguments: {
                                AppStringFile.apptitle: "Privacy Policy",
                                AppStringFile.appdescrition: dashBoradProvider
                                    .getprivacyPolicymodel
                                    .privacyPolicy!
                                    .description,
                              });
                        }
                      }),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      accountTextUI(context, Icons.favorite, "Wish List",
                          Icons.arrow_forward_ios, () {
                        Navigator.pushNamed(
                          context,
                          Routes.wishlist,
                        );
                      }),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          !isLoading
                              ? TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.delete,
                                    size: 25.0,
                                    color: AppColors.colorGrey,
                                  ),
                                  label: Text(
                                    "Delete Account",
                                    style: AppStyle.textsubtitle
                                        .copyWith(color: Colors.black),
                                  ))
                              : ButtonWidgetLoader(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.INFO,
                                      btnOkColor: AppColors.appPrimarycolor,
                                      borderSide: BorderSide(
                                          color: AppColors.appPrimarycolor,
                                          width: 0.1.h),
                                      buttonsBorderRadius:
                                          BorderRadius.all(Radius.circular(2)),
                                      headerAnimationLoop: false,
                                      animType: AnimType.BOTTOMSLIDE,
                                      title: 'Delete Account',

                                      desc:
                                          'Are you sure want to delete your account?',
                                      showCloseIcon: true,
                                      // btnCancelOnPress: () {
                                      //   Navigator.pop(context);
                                      // },
                                      btnOkOnPress: () {},
                                    )..show();
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 25.0,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.logout_outlined,
                                size: 25.0,
                                color: AppColors.colorGrey,
                              ),
                              label: Text(
                                "Logout",
                                style: AppStyle.textsubtitle
                                    .copyWith(color: Colors.black),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.INFO,
                                      btnOkColor: AppColors.appPrimarycolor,
                                      borderSide: BorderSide(
                                          color: AppColors.appPrimarycolor,
                                          width: 0.1.h),
                                      buttonsBorderRadius:
                                          BorderRadius.all(Radius.circular(2)),
                                      headerAnimationLoop: false,
                                      animType: AnimType.BOTTOMSLIDE,
                                      title: 'Logout',
                                      desc:
                                          'Are you sure want to Logout Supersonic app?',
                                      showCloseIcon: true,
                                      // btnCancelOnPress: () {
                                      //   Navigator.pop(context);
                                      // },
                                      btnOkOnPress: () {},
                                    )..show();
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 25.0,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

Widget accountTextUI(BuildContext context, IconData icon1, String title,
    IconData icon2, void Function()? onPressed) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextButton.icon(
          onPressed: onPressed,
          icon: Icon(
            icon1,
            size: 25.0,
            color: AppColors.appPrimarycolor,
          ),
          label: Text(title,
              style: AppStyle.textsubtitle.copyWith(color: Colors.black))),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: onPressed,
              //onPressed: () {},
              icon: Icon(
                icon2,
                size: 25.0,
                color: Colors.grey,
              )),
        ],
      ),
    ],
  );
}
