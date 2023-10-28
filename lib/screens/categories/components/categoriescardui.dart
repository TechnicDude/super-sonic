// ignore_for_file:

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:supersonicapp/model/getcategorymodel.dart';
import 'package:supersonicapp/model/getproductlistdatamodel.dart';

import 'package:supersonicapp/utils/appcolors.dart';
import 'package:supersonicapp/utils/appimages.dart';
import 'package:supersonicapp/utils/appstyle.dart';
import 'package:supersonicapp/utils/loaderscreen.dart';
import 'package:supersonicapp/utils/title_text_style.dart';
import 'package:supersonicapp/utils/viewbutton.dart';
import 'package:supersonicapp/utils/widgets/extentions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoriesCardShowUiScreen extends StatelessWidget {
  final ValueChanged<CategoryDataModel> onSelected;
  final CategoryDataModel model;
  const CategoriesCardShowUiScreen(
      {Key? key, required this.model, required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return model.id == null
        ? Container(width: 5)
        : Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: model.image == null
                          ? DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(AppImages.logo),
                            )
                          : DecorationImage(
                              fit: BoxFit.fill,
                              image: CachedNetworkImageProvider(
                                model.image!,
                                errorListener: () {},
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: AppColors.primarycolor.withOpacity(.6),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: TitleTextStyle(
                            text: model.name.toString(),
                            style: AppStyle.texttitlemain.copyWith(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                            textOverflow: TextOverflow.ellipsis,
                            maxline: 2,
                          ),
                        ),
                        // TitleTextStyle(
                        //   text:
                        //       "${model.subCategory!.length.toString()} Subcategories",
                        //   style: AppStyle.cardtitle.copyWith(
                        //       color: AppColors.colorWhite, fontSize: 14.sp),
                        // ),
                      ],
                    ),
                  ),
                ],
              ).ripple(
                () {
                  onSelected(model);
                },
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          );
  }
}
