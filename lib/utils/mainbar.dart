import 'package:flutter/cupertino.dart';
import 'package:supersonicapp/utils/appcolors.dart';
import 'package:supersonicapp/utils/appimages.dart';
import 'package:supersonicapp/utils/appstyle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainBar extends StatelessWidget {
  final String? image;
  final String? text;
  const MainBar({
    Key? key,
    this.image,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1.h,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     Column(
        //       children: [
        //         Image.asset(
        //           AppImages.logo,
        //           height: 12.h,
        //         )
        //       ],
        //     ),
        //   ],
        // ),
        // SizedBox(
        //   height: 3.5.h,
        // ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            text!,
            style: AppStyle.mytexttitle
                .copyWith(color: AppColors.primarycolor, fontSize: 3.h),
          ),
        ]),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}
