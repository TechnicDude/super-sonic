// ignore_for_file:

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:supersonicapp/api/productapi.dart';
import 'package:supersonicapp/model/getproductlistdatamodel.dart';

import 'package:supersonicapp/utils/appcolors.dart';
import 'package:supersonicapp/utils/apphelper.dart';
import 'package:supersonicapp/utils/appstyle.dart';
import 'package:supersonicapp/utils/dialoghelper.dart';
import 'package:supersonicapp/utils/title_text_style.dart';
import 'package:supersonicapp/utils/viewbutton.dart';
import 'package:supersonicapp/utils/widgets/extentions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductshowuiScreen extends StatefulWidget {
  final ValueChanged<GetProductlistDataModel> onSelected;
  final GetProductlistDataModel model;
  const ProductshowuiScreen(
      {Key? key, required this.model, required this.onSelected})
      : super(key: key);

  @override
  State<ProductshowuiScreen> createState() => _ProductshowuiScreenState();
}

class _ProductshowuiScreenState extends State<ProductshowuiScreen> {
  Future addtocard(String productid) async {
    var body = {
      "product_id": productid,
      "user_id": AppHelper.userid.toString(),
      "qty": "1"
    };

    ProductApi productApi = ProductApi(body);
    final response = await productApi.addtocard();
    if (response['status'].toString().toLowerCase() == "success") {
      DialogHelper.showFlutterToast(strMsg: response['msg'].toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.model.id == null
        ? Container(width: 5)
        : Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomRight,
            children: [
              Center(
                child: Container(
                  width: 40.w,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: [
                          Container(
                            height: 30.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      widget.model.imageUrl!,
                                    ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 15.w,
                                  height: 6.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 4.w,
                                      ),
                                      TitleTextStyle(
                                        text: widget.model.avgRating!
                                            .toStringAsFixed(2),
                                        style: AppStyle.cardtitle
                                            .copyWith(fontSize: 14.sp),
                                        maxline: 2,
                                        textAlign: TextAlign.center,
                                        textOverflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 8.w,
                                  height: 8.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.colorWhite,
                                  ),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 5.w,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Center(
                        child: TitleTextStyle(
                          text: widget.model.title!,
                          style: AppStyle.cardtitle,
                          maxline: 2,
                          textAlign: TextAlign.center,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: TitleTextStyle(
                          text: "MPN : ${widget.model.mpn} ",
                          style: AppStyle.cardtitle.copyWith(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp),
                          maxline: 2,
                        ),
                      ),
                      if (widget.model.brandValue != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: TitleTextStyle(
                            text:
                                "Brand : ${widget.model.brandValue!.name ?? ''}",
                            style: AppStyle.cardtitle.copyWith(
                                color: AppColors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp),
                            maxline: 2,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: TitleTextStyle(
                                  text:
                                      "\$ ${double.parse(widget.model.salePrice.toString()).toStringAsFixed(2)}",
                                  style: AppStyle.cardtitle.copyWith(
                                      color: AppColors.primarycolor,
                                      fontSize: 17.sp),
                                  maxline: 2,
                                  textOverflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (widget.model.offers != null)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: Row(
                                    children: [
                                      TitleTextStyle(
                                        text: "MRP:",
                                        style: AppStyle.cardtitle.copyWith(
                                            color: AppColors.grey,
                                            fontSize: 14.sp),
                                      ),
                                      TitleTextStyle(
                                        text:
                                            "\$ ${double.parse(widget.model.regularPrice.toString()).toStringAsFixed(2)}",
                                        style: AppStyle.cardtitle.copyWith(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: AppColors.grey,
                                            fontSize: 14.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              if (widget.model.offers != null)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: TitleTextStyle(
                                    text:
                                        "${widget.model.offers!.discount} % Discount",
                                    style: AppStyle.cardtitle.copyWith(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp),
                                  ),
                                ),
                              SizedBox(
                                height: 1.h,
                              ),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ).ripple(() {
                    widget.onSelected(widget.model);
                  }, borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              Positioned(
                bottom: 15,
                right: 10,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () {
                      addtocard(widget.model.id.toString());
                    },
                    child: Container(
                      width: 10.w,
                      height: 10.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primarycolor.withOpacity(.5),
                      ),
                      child: Icon(
                        Icons.add_shopping_cart_rounded,
                        color: AppColors.primarycolor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
