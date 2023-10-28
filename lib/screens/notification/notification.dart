import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:supersonicapp/utils/appbar.dart';

import 'package:supersonicapp/utils/appcolors.dart';
import 'package:supersonicapp/utils/appimages.dart';
import 'package:supersonicapp/utils/appstyle.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            text: "Notifications",
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: 2.h, left: 2.h, right: 2.h, bottom: 0.2.h),
                      child: InkWell(
                        child: Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: "delete",
                              onTap: () {
                                // _dialogBuilder;
                              },
                              iconWidget: Center(
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                          child: Column(
                            children: [
                              Container(
                                height: 9.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(1.h),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 1.5,
                                      blurRadius: 1,
                                      offset: Offset(1, 2),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(0.5.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                          backgroundColor: Colors.black,
                                          radius: 3.h,
                                          backgroundImage: AssetImage(
                                            AppImages.outro3,
                                          )),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 68.w,
                                            child: Text(
                                                'Manaqa: Online Shopping for Men',
                                                style: AppStyle.textcatsubtitle
                                                    .copyWith(fontSize: 15.sp)),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          SizedBox(
                                            width: 68.w,
                                            child: Text(
                                                'Online Shopping Site for Fashion & Lifestyle, API is to build notify',
                                                style:
                                                    AppStyle.textsubsubtitle),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
