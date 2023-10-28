import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'appcolors.dart';
import 'appimages.dart';
import 'appstyle.dart';

class InternetNotAvailable extends StatelessWidget {
  double? height;
  InternetNotAvailable({Key? key, double? height});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height != null ? height : 55.h,
        width: 50.w,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.nointernet,
                  color: AppColors.colorGrey.withOpacity(0.3)),
              Text(
                'No internet connection!',
                style: AppStyle.texttitle.copyWith(
                    color: AppColors.colorGrey.withOpacity(0.5),
                    fontSize: 16.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
