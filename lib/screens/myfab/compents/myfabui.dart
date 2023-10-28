// ignore_for_file:

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:supersonicapp/model/Getsaveproductlist.dart';
import 'package:supersonicapp/model/getaddtocartlistmodel.dart';
import 'package:supersonicapp/model/getcategorymodel.dart';
import 'package:supersonicapp/model/getproductlistdatamodel.dart';
import 'package:supersonicapp/screens/addtocard/components/addtocardbutton.dart';

import 'package:supersonicapp/utils/appcolors.dart';
import 'package:supersonicapp/utils/apphelper.dart';
import 'package:supersonicapp/utils/appimages.dart';
import 'package:supersonicapp/utils/appstyle.dart';
import 'package:supersonicapp/utils/loaderscreen.dart';
import 'package:supersonicapp/utils/title_text_style.dart';
import 'package:supersonicapp/utils/viewbutton.dart';
import 'package:supersonicapp/utils/widgets/extentions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl/intl.dart';

class WishListShowUiScreen extends StatefulWidget {
  final ValueChanged<GetsaveproductlistDatas> onSelected;
  final GetsaveproductlistDatas model;
  const WishListShowUiScreen(
      {Key? key, required this.model, required this.onSelected})
      : super(key: key);

  @override
  State<WishListShowUiScreen> createState() => _WishListShowUiScreenState();
}

class _WishListShowUiScreenState extends State<WishListShowUiScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.model.id == null
        ? Container(width: 5)
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 30.w,
                        width: 30.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: widget.model.product!.imageUrl == null
                              ? DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(AppImages.logo),
                                )
                              : DecorationImage(
                                  fit: BoxFit.fill,
                                  image: CachedNetworkImageProvider(
                                    widget.model.product!.imageUrl!,
                                    errorListener: () {},
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleTextStyle(
                              text: widget.model.product!.title!,
                              maxline: 2,
                              textOverflow: TextOverflow.ellipsis,
                              style:
                                  AppStyle.cardtitle.copyWith(fontSize: 14.sp),
                            ),
                            // TitleTextStyle(
                            //   text:
                            //       " \$ ${AppHelper().pricecount(int.parse(widget.model.qty.toString()), widget.model.product!.salePrice.toString())}",
                            //   style: AppStyle.cardtitle.copyWith(
                            //       fontSize: 17.sp,
                            //       color: AppColors.primarycolor),
                            // ),
                            _rowuishow("Part No : ",
                                widget.model.product!.partNumber!),
                            SizedBox(
                              height: 5.h,
                            ),
                          ],
                        ),
                      )
                    ],
                  ).ripple(
                    () {
                      widget.onSelected(widget.model);
                    },
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 30.w,
                      ),
                      // Column(
                      //   children: [
                      //     AddtoCardquantitytiyScreenActivity(
                      //       quantity: widget.model.qty.toString(),
                      //       callback: (value) {
                      //         setState(() {
                      //           widget.model.qty = value;
                      //         });
                      //       },
                      //     ),
                      //   ],
                      // ),
                      Spacer(),
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  Widget _rowuishow(String title, String data) {
    return Row(
      children: [
        TitleTextStyle(
          text: title,
          style: AppStyle.cardssubtitle
              .copyWith(fontSize: 14.sp, color: AppColors.grey),
        ),
        TitleTextStyle(
          text: data,
          style: AppStyle.cardssubtitle
              .copyWith(fontSize: 14.sp, color: AppColors.grey),
        ),
      ],
    );
  }
}
