import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supersonicapp/model/getcategorymodel.dart';
import 'package:supersonicapp/page_routes/routes.dart';
import 'package:supersonicapp/provider/categoryProvider.dart';
import 'package:supersonicapp/screens/categories/components/categoriescardui.dart';
import 'package:supersonicapp/utils/appcolors.dart';
import 'package:supersonicapp/utils/appstringfile.dart';
import 'package:supersonicapp/utils/appstyle.dart';
import 'package:supersonicapp/utils/loaderscreen.dart';
import 'package:supersonicapp/utils/title_text_style.dart';

class SubCategorisScreenActivity extends StatefulWidget {
  List<SubCategory> subcategory;
  String subcategoryname;
  SubCategorisScreenActivity({
    super.key,
    required this.subcategory,
    required this.subcategoryname,
  });

  @override
  State<SubCategorisScreenActivity> createState() =>
      _SubCategorisScreenActivityState();
}

class _SubCategorisScreenActivityState
    extends State<SubCategorisScreenActivity> {
  // CategoryProvider _productDetails = CategoryProvider();
  // ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    // _productDetails = Provider.of<CategoryProvider>(context, listen: false);
    // fetchdata();
    // _scrollController = ScrollController()..addListener(_loadMore);
    super.initState();
  }

  void _loadMore() async {
    // if (_productDetails.hasfirst &&
    //     _productDetails.isFirstdatafound == false &&
    //     _productDetails.isLoadMoreRunning == false) {
    //   setState(() {
    //     _isLoading = true;
    //   });
    //   await Future.delayed(Duration(seconds: 2));
    //   await _productDetails.loadMore();
    //   setState(() {
    //     _isLoading = false;
    //   });
    // }
  }

  fetchdata() async {
    // await _productDetails.getallcategorylist(1);
  }

  Widget _appBar() {
    return Container(
      color: AppColors.colorWhite,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          // RotatedBox(
          //   quarterTurns: 4,
          //   child: _icon(Icons.sort, color: Colors.white).ripple(() {
          //     widget.callback("okopen");
          //   }),
          // ),
          TitleTextStyle(
            text: 'Categories',
            style: AppStyle.texttitlemain.copyWith(color: Colors.black),
          ),
          Spacer(),
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          // SizedBox(
          //   width: 3.w,
          // ),
          // Icon(
          //   Icons.notifications,
          //   color: Colors.black,
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbakgroundcolor,
      appBar: AppBar(
        centerTitle: true,
        title: TitleTextStyle(
          text: widget.subcategoryname,
          style: AppStyle.texttitlemain.copyWith(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              // controller: _scrollController,
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  if (widget.subcategory.isNotEmpty)
                    _categorieslist(widget.subcategory),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    ;
  }

  Widget _categorieslist(List<SubCategory> categorylist) {
    return GridView.builder(
        // controller: _scrollController,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2 / 1,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1),
        itemCount: categorylist.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return CategoriesCardShowUiScreen(
              model: CategoryDataModel(
                id: categorylist[index].id,
                name: categorylist[index].name,
                image: categorylist[index].image,
                subCategory: [],
              ),
              onSelected: (model) {
                Navigator.pushNamed(context, Routes.product, arguments: {
                  AppStringFile.subcategoriesid: model.id.toString(),
                  AppStringFile.subcategoriesname: model.name,
                });
              });
        });
  }
}
