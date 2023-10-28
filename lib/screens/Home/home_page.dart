import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:supersonicapp/model/banner_model.dart';
import 'package:supersonicapp/model/gethomelistModel.dart';
import 'package:supersonicapp/model/getproductlistdatamodel.dart';
import 'package:supersonicapp/page_routes/routes.dart';
import 'package:supersonicapp/screens/Home/components/homecomponents/productshowui.dart';

import 'package:supersonicapp/utils/appcolors.dart';
import 'package:supersonicapp/utils/apphelper.dart';
import 'package:supersonicapp/utils/appstringfile.dart';

import 'package:supersonicapp/utils/appstyle.dart';
import 'package:supersonicapp/utils/title_text_style.dart';
import 'package:supersonicapp/utils/widgets/extentions.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../provider/dashboardProvider.dart';

class MyHomePage extends StatefulWidget {
  final Function callback;
  MyHomePage({
    Key? key,
    this.title,
    required this.callback,
  }) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DashBoradProvider _dashBoradProvider = DashBoradProvider();

  @override
  void initState() {
    // TODO: implement initState

    _dashBoradProvider = Provider.of<DashBoradProvider>(context, listen: false);

    fetchdata();
    log(AppHelper.userid.toString());
    super.initState();
  }

  fetchdata() async {
    await _dashBoradProvider.profile();

    await _dashBoradProvider.bannerlists();
    await _dashBoradProvider.featureproductlist();
    await _dashBoradProvider.homeproductlist();
  }

  Widget _appBar(DashBoradProvider _dashBoradProvider) {
    return Container(
      color: AppColors.colorWhite,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          RotatedBox(
            quarterTurns: 4,
            child: _icon(Icons.sort, color: Colors.white).ripple(() {
              widget.callback("okopen");
            }),
          ),
          if (_dashBoradProvider.profilefetch)
            if (AppHelper.userInfo != null)
              TitleTextStyle(
                text: '  Hi ${AppHelper.userInfo!.name}',
                style: AppStyle.texttitlemain.copyWith(color: Colors.black),
              ),
          Spacer(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.globalSearch);
            },
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          Icon(
            Icons.notifications,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _icon(IconData icon, {Color color = AppColors.iconColor}) {
    return Container(
      padding: EdgeInsets.all(0.5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(1.h)),
        color: AppColors.primarycolor,
      ),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
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
            height: 40.h,
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

  Widget _bestsellingbrandtui(
      List<BrandsData> featureproductlist, String title) {
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
            height: 30.w,
            child: ListView.builder(
                itemCount: featureproductlist.length,
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.productlistbybrand,
                              arguments: {
                                AppStringFile.subCategoryId:
                                    featureproductlist[index].id.toString(),
                                AppStringFile.subcategoriesname:
                                    featureproductlist[index].name.toString(),
                              });
                        },
                        child: Container(
                          height: 30.w,
                          width: 30.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.grey, width: 2),
                            image: DecorationImage(
                              image: NetworkImage(
                                  featureproductlist[index].image!),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ));
                }),
          ),
        ],
      ),
    );
  }

  Widget _banner(List<BannerData> bannerdata) {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: false,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
      ),
      items: bannerdata
          .map((item) => Image.network(
                item.image!,
                fit: BoxFit.fill,
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoradProvider>(
        builder: (context, dashBoradProvider, child) {
      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _appBar(dashBoradProvider),
            Expanded(
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: [
                    if (dashBoradProvider.bannerfetch)
                      if (dashBoradProvider.bannerList.isNotEmpty)
                        _banner(dashBoradProvider.bannerList),
                    if (dashBoradProvider.getfeatureproductlistModelfetch)
                      if (dashBoradProvider.getfetureproductlist.isNotEmpty)
                        _featureproductlistui(
                            dashBoradProvider.getfetureproductlist,
                            "FEATURED PRODUCT"),
                    if (dashBoradProvider.gethomeproductlistModelfetch)
                      if (dashBoradProvider
                          .getbestsellingproductlist.isNotEmpty)
                        _featureproductlistui(
                            dashBoradProvider.getbestsellingproductlist,
                            "BEST SELLING PRODUCT"),
                    if (dashBoradProvider.gethomeproductlistModelfetch)
                      if (dashBoradProvider
                          .getnewarrivalsproductlist.isNotEmpty)
                        _featureproductlistui(
                            dashBoradProvider.getnewarrivalsproductlist,
                            "NEW ARRIVALS"),
                    if (dashBoradProvider.gethomeproductlistModelfetch)
                      if (dashBoradProvider.getbestsellingbrandlist.isNotEmpty)
                        _bestsellingbrandtui(
                            dashBoradProvider.getbestsellingbrandlist,
                            "BEST SELLING BRAND"),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
