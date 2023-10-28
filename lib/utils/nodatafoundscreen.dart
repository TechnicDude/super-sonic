import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:supersonicapp/utils/appimages.dart';
import 'package:supersonicapp/utils/appstyle.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class NoDataFoundErrorScreens extends StatelessWidget {
  double? height;
  NoDataFoundErrorScreens({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height != null ? height : 75.h,
        width: 100.w,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "No Data Found",
                style: AppStyle.textsubtitle
                    .copyWith(color: Colors.grey.shade600, fontSize: 18.sp),
              ),
              SizedBox(
                height: .1.h,
              ),
              Image.asset(
                AppImages.error,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
