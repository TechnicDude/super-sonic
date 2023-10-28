import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:supersonicapp/api/api.dart';
import 'package:supersonicapp/api/productapi.dart';
import 'package:supersonicapp/model/getproductlistdatamodel.dart';
import 'package:intl/intl.dart';

import 'package:supersonicapp/page_routes/routes.dart';
import 'package:supersonicapp/provider/productdetailsProvider.dart';
import 'package:supersonicapp/screens/Home/components/homecomponents/productshowui.dart';
import 'package:supersonicapp/utils/appcolors.dart';
import 'package:supersonicapp/utils/apphelper.dart';
import 'package:supersonicapp/utils/appimages.dart';
import 'package:supersonicapp/utils/appstringfile.dart';
import 'package:supersonicapp/utils/appstyle.dart';
import 'package:supersonicapp/utils/loaderscreen.dart';
import 'package:supersonicapp/utils/title_text_style.dart';
import 'package:supersonicapp/utils/viewbutton.dart';
import 'package:supersonicapp/utils/widgets/extentions.dart';
import 'package:supersonicapp/utils/widgets/title_text.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailPage extends StatefulWidget {
  final String productid;
  ProductDetailPage({
    Key? key,
    required this.productid,
  }) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  ProductDetailsProvider _productDetails = ProductDetailsProvider();
  late AnimationController controller;
  late Animation<double> animation;
  bool showmoredes = false;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    _productDetails =
        Provider.of<ProductDetailsProvider>(context, listen: false);
    fetchdata();

    controller.forward();
  }

  fetchdata() async {
    await _productDetails.getallproductdata(widget.productid);

    // if(_productDetails.getProductlistDataModel != null){
    //   if(_productDetails.getProductlistDataModel.)
    // }
  }

  Future addfab() async {
    var body = {
      "product_id": widget.productid,
      "user_id": AppHelper.userid,
    };
    ProductApi productApi = ProductApi(body);
    final response = await productApi.favtocard();
    log(response.toString());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isLiked = true;
  Widget _appBar() {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
            size: 15,
            padding: 12,
            isOutLine: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          // SizedBox(
          //   width: 100.w - 200,
          //   child: Center(
          //     child: TitleTextStyle(
          //       textAlign: TextAlign.center,
          //       maxline: 2,
          //       text: widget.productname,
          //       style: AppStyle.texttitlemain,
          //     ),
          //   ),
          // ),
          _icon(isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? AppColors.red : AppColors.appPrimarycolor,
              size: 15,
              padding: 12,
              isOutLine: false, onPressed: () {
            if (!isLiked) {
              addfab();
            }

            setState(() {
              isLiked = !isLiked;
            });
          }),
        ],
      ),
    );
  }

  Widget _icon(
    IconData icon, {
    Color color = AppColors.iconColor,
    double size = 20,
    double padding = 10,
    bool isOutLine = false,
    Function? onPressed,
  }) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(padding),
      // margin: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.iconColor,
            style: isOutLine ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color:
            isOutLine ? Colors.transparent : Theme.of(context).backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0xfff8f8f8),
              blurRadius: 5,
              spreadRadius: 10,
              offset: Offset(5, 5)),
        ],
      ),
      child: Icon(icon, color: color, size: size),
    ).ripple(() {
      if (onPressed != null) {
        onPressed();
      }
    }, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _productImage(List<ProductImages>? gallery) {
    return AnimatedBuilder(
      builder: (context, child) {
        return AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: animation.value,
          child: child,
        );
      },
      animation: animation,
      child: CarouselSlider(
        options: CarouselOptions(
            autoPlay: true,
            // aspectRatio: 2.0,
            // enlargeCenterPage: true,
            viewportFraction: 1),
        items: gallery!
            .map((item) => Image.network(
                  item.image!,
                  fit: BoxFit.fill,
                  width: 100.w,
                ))
            .toList(),
      ),
    );
  }

  // Widget _categoryWidget() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 0),
  //     width: 100,
  //     height: 80,
  //     child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children:
  //             AppData.showThumbnailList.map((x) => _thumbnail(x)).toList()),
  //   );
  // }

  Widget _thumbnail(String image) {
    return AnimatedBuilder(
      animation: animation,
      //  builder: null,
      builder: (context, child) => AnimatedOpacity(
        opacity: animation.value,
        duration: Duration(milliseconds: 500),
        child: child,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 40,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(13)),
            // color: Theme.of(context).backgroundColor,
          ),
          child: Image.asset(image),
        ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13))),
      ),
    );
  }

  Widget _detailWidget(GetProductlistDataModel productdetails,
      List<GetProductlistDataModel> related) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Colors.white),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 5),
              Container(
                alignment: Alignment.center,
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                      color: AppColors.iconColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTextStyle(
                          text: productdetails.title!,
                          style: AppStyle.cardtitle,
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                        TitleTextStyle(
                          text: productdetails.brandValue!.name!,
                          style:
                              AppStyle.cardtitle.copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                        // TitleTextStyle(
                        //   text:
                        //       "{Languages.of(context)!.soldBy} ${productdetails.seller!.name!}",
                        //   style: AppStyle.cardtitle
                        //       .copyWith(color: AppColors.grey),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: productdetails.avgRating!,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 10,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  TitleTextStyle(
                    text: "Review (${productdetails.productReviewCount})",
                    style: AppStyle.cardtitle,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TitleTextStyle(
                text: "Price",
                style: AppStyle.cardtitle,
              ),
              Row(
                children: [
                  TitleTextStyle(
                    text: "\$${productdetails.salePrice!.toString()}",
                    style: AppStyle.cardtitle.copyWith(
                        fontSize: 22.sp, color: AppColors.primarycolor),
                  ),
                  if (productdetails.offers != null)
                    TitleTextStyle(
                      text: " (${productdetails.offers!.discount} % OFF)",
                      style: AppStyle.cardtitle.copyWith(color: Colors.red),
                    ),
                ],
              ),
              if (productdetails.offers != null)
                Row(
                  children: [
                    TitleTextStyle(
                      text: "MRP : ",
                      style: AppStyle.cardtitle
                          .copyWith(color: Colors.grey, fontSize: 14.sp),
                    ),
                    TitleTextStyle(
                      text: "\$ ${productdetails.regularPrice!.toString()}",
                      style: AppStyle.cardtitle.copyWith(
                          color: Colors.grey,
                          fontSize: 14.sp,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 40.w,
                    child: ViewButtonWidget(
                      height: 4.h,
                      onTap: () {},
                      boxcolor: AppColors.primarycolor,
                      text: "Add to Cart",
                    ),
                  ),
                  SizedBox(
                    width: 40.w,
                    child: ViewButtonWidget(
                      height: 4.h,
                      onTap: () {
                        // Navigator.pushNamed(context, Routes.productBuynow,
                        //     arguments: {
                        //       AppStringFile.productid:
                        //           productdetails.id.toString(),
                        //       AppStringFile.price:
                        //           productdetails.salePrice.toString(),
                        //       AppStringFile.productname: productdetails.name!,
                        //       AppStringFile.unity: productdetails.unittype,
                        //       AppStringFile.quantity:
                        //           productdetails.unitvalue.toString(),
                        //     });
                      },
                      textcolor: AppColors.primarycolor,
                      boxcolor: AppColors.colorWhite,
                      bordercolor: AppColors.primarycolor,
                      text: " buy",
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              TitleTextStyle(
                text: "Product Details",
                style: AppStyle.cardtitle,
              ),
              SizedBox(
                height: 1.h,
              ),
              _productdetailsshow("SKU", productdetails.sku!),
              Divider(),
              _productdetailsshow("Brand", productdetails.brandValue!.name!),
              Divider(),
              _productdetailsshow("Package Dimension",
                  "${productdetails.length.toString()} x ${productdetails.width.toString()} x ${productdetails.height.toString()}  ${productdetails.dimensionUnit.toString()}"),
              Divider(),
              _productdetailsshow("Package Weight",
                  "${productdetails.packageWeight.toString()} lbs"),
              Divider(),
              _productdetailsshow("UPC", productdetails.upc!),
              Divider(),
              _productdetailsshow("MPN", productdetails.mpn!),
              Divider(),
              SizedBox(
                height: 2.h,
              ),
              TitleTextStyle(
                text: "Description",
                style: AppStyle.cardtitle,
              ),
              SizedBox(
                height: 1.h,
              ),
              _description(productdetails.content!),
              SizedBox(
                height: 1.h,
              ),
              if (productdetails.productReview!.isNotEmpty)
                _reviewdata(
                    productdetails.productReview!, productdetails.avgRating!),
              SizedBox(
                height: 1.h,
              ),
              _featureproductlistui(related, "Related Product")
            ],
          ),
        ),
      ),
    );
  }

  Widget _reviewdata(List<ProductReview> review, double apprating) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleTextStyle(
              text: "All Review (${review.length})",
              style: AppStyle.cardtitle,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.reviewallscreen,
                    arguments: {
                      AppStringFile.productreviewlist: review,
                      AppStringFile.productid: widget.productid,
                    }).then((value) => fetchdata());
              },
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 5.w,
              ),
            )
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleTextStyle(
              text: apprating.toStringAsFixed(2),
              style: AppStyle.texttitle
                  .copyWith(color: Colors.black, fontSize: 20.sp),
            ),
            RatingBar.builder(
              initialRating: apprating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 40.w,
              child: ViewButtonWidget(
                height: 4.h,
                onTap: () {
                  Navigator.pushNamed(context, Routes.reviewproduct,
                      arguments: {
                        AppStringFile.productid: widget.productid,
                      }).then((value) {
                    fetchdata();
                  });
                },
                boxcolor: AppColors.primarycolor,
                text: "Review Product",
              ),
            ),
          ],
        ),
        ListView.builder(
            itemCount: review.length > 5 ? 5 : review.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10.w,
                          height: 10.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      review[index].userimg.toString()))),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleTextStyle(
                              text: review[index].name!,
                              style: AppStyle.cardtitle,
                            ),
                            TitleTextStyle(
                              text: DateFormat('yyyy-MM-dd').format(
                                DateTime.parse(
                                  review[index].updatedAt.toString(),
                                ),
                              ),
                              style: AppStyle.cardtitle
                                  .copyWith(color: Colors.grey),
                            ),
                            RatingBar.builder(
                              initialRating: review[index].rating!,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 15,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    TitleTextStyle(
                      text: review[index].review.toString(),
                      style: AppStyle.cardtitle.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              );
            })
      ],
    );
  }

  Widget _featureproductlistui(
      List<GetProductlistDataModel> featureproductlist, String title) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleTextStyle(
            text: title,
            style: AppStyle.texttitlemain,
          ),
          SizedBox(
            height: 1.h,
          ),
          SizedBox(
            height: 36.h,
            child: ListView.builder(
                itemCount: featureproductlist.length,
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ProductshowuiScreen(
                      model: featureproductlist[index],
                      onSelected: (model) {
                        Navigator.pushNamed(context, Routes.productDetails,
                            arguments: {
                              AppStringFile.productid: model.id.toString()
                            });
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _productdetailsshow(String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyle.cardssubtitle.copyWith(fontSize: 15.sp),
        ),
        TitleTextStyle(
          text: subtitle,
          style: AppStyle.cardtitle.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }

  Widget _description(String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (!showmoredes)
          Text(
            AppHelper().htmlremove(description),
            style: AppStyle.textdescription,
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
        if (!showmoredes)
          InkWell(
            onTap: () {
              setState(() {
                showmoredes = true;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TitleTextStyle(
                  text: "Show more",
                  style: AppStyle.cardtitle
                      .copyWith(color: AppColors.primarycolor),
                ),
              ],
            ),
          ),
        if (showmoredes)
          Text(
            AppHelper().htmlremove(description),
            style: AppStyle.textdescription,
          ),
      ],
    );
  }

  FloatingActionButton _flotingButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.mybiddingform);
      },
      backgroundColor: AppColors.orange,
      child: Icon(Icons.add,
          color: Theme.of(context).floatingActionButtonTheme.backgroundColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailsProvider>(
        builder: (context, productProvider, child) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xfffbfbfb),
                Color(0xfff7f7f7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _appBar(),
                      if (productProvider.getProductlistDataModelfetch)
                        if (productProvider
                                .getProductlistDataModel.productImages !=
                            null)
                          if (productProvider.getProductlistDataModel
                              .productImages!.isNotEmpty)
                            _productImage(productProvider
                                .getProductlistDataModel.productImages!),
                      SizedBox(
                        height: 6.h,
                      ),
                      // _categoryWidget(),
                      // if (productProvider.getproductdetailsfetch)
                      if (productProvider.getProductlistDataModelfetch)
                        _detailWidget(productProvider.getProductlistDataModel,
                            productProvider.getrelatedproduct),
                    ],
                  ),
                ),
                if (!productProvider.getProductlistDataModelfetch)
                  LoaderScreen(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
