import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supersonicapp/model/getcategorymodel.dart';
import 'package:supersonicapp/model/getproductlistdatamodel.dart';
import 'package:supersonicapp/page_routes/routes.dart';
import 'package:supersonicapp/provider/categoryProvider.dart';
import 'package:supersonicapp/provider/subcategoryProductList.dart';
import 'package:supersonicapp/screens/Home/components/homecomponents/productshowui.dart';
import 'package:supersonicapp/screens/categories/components/categoriescardui.dart';
import 'package:supersonicapp/utils/appcolors.dart';
import 'package:supersonicapp/utils/appstringfile.dart';
import 'package:supersonicapp/utils/appstyle.dart';
import 'package:supersonicapp/utils/loaderscreen.dart';
import 'package:supersonicapp/utils/title_text_style.dart';

class SubCategoriesProductListScreenActivity extends StatefulWidget {
  String subcategoriesid;
  String subcategoriesname;
  SubCategoriesProductListScreenActivity({
    super.key,
    required this.subcategoriesid,
    required this.subcategoriesname,
  });

  @override
  State<SubCategoriesProductListScreenActivity> createState() =>
      _SubCategoriesProductListScreenActivityState();
}

class _SubCategoriesProductListScreenActivityState
    extends State<SubCategoriesProductListScreenActivity> {
  SubCategoryProductListProvider _productDetails =
      SubCategoryProductListProvider();
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    _productDetails =
        Provider.of<SubCategoryProductListProvider>(context, listen: false);
    fetchdata();
    _scrollController = ScrollController()..addListener(_loadMore);
    super.initState();
  }

  void _loadMore() async {
    if (_productDetails.hasfirst &&
        _productDetails.isFirstdatafound == false &&
        _productDetails.isLoadMoreRunning == false) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(Duration(seconds: 2));
      await _productDetails.loadMore(widget.subcategoriesid);
      setState(() {
        _isLoading = false;
      });
    }
  }

  fetchdata() async {
    await _productDetails.getallcategorylist(widget.subcategoriesid, 1);
  }

  Widget _appBar() {
    return Container(
      color: AppColors.colorWhite,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          TitleTextStyle(
            text: 'Categories',
            style: AppStyle.texttitlemain.copyWith(color: Colors.black),
          ),
          Spacer(),
          Icon(
            Icons.search,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SubCategoryProductListProvider>(
        builder: (context, categoryprovider, child) {
      return Scaffold(
        backgroundColor: AppColors.appbakgroundcolor,
        appBar: AppBar(
          centerTitle: true,
          title: TitleTextStyle(
            text: widget.subcategoriesname,
            style: AppStyle.texttitlemain.copyWith(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    if (!categoryprovider.getcategorydatamodelfetch)
                      SizedBox(
                          width: 100.w,
                          height: 90.h,
                          child: Center(child: LoaderScreen())),
                    SizedBox(
                      height: 2.h,
                    ),
                    if (categoryprovider.getcategorydatamodelfetch)
                      if (categoryprovider.getsubcategoriproductlist.isNotEmpty)
                        _categorieslist(
                            categoryprovider.getsubcategoriproductlist),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _categorieslist(List<GetProductlistDataModel> categorylist) {
    return GridView.builder(
        controller: _scrollController,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.52,
            mainAxisSpacing: .2,
            crossAxisSpacing: .2),
        itemCount: categorylist.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: ProductshowuiScreen(
              model: categorylist[index],
              onSelected: (model) {
                Navigator.pushNamed(context, Routes.productDetails,
                    arguments: {AppStringFile.productid: model.id.toString()});
              },
            ),
          );
        });
  }
}
