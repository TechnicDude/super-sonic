import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supersonicapp/model/getproductlistdatamodel.dart';
import 'package:supersonicapp/page_routes/routes.dart';
import 'package:supersonicapp/provider/globalserchProvider.dart';
import 'package:supersonicapp/screens/Home/components/homecomponents/productshowui.dart';
import 'package:supersonicapp/utils/appcolors.dart';
import 'package:supersonicapp/utils/appstringfile.dart';
import 'package:supersonicapp/utils/loaderscreen.dart';
import 'package:supersonicapp/utils/nodatafoundscreen.dart';
import 'package:supersonicapp/utils/textform.dart';
import 'package:supersonicapp/utils/widgets/extentions.dart';

class GlobalSearchScreenActivity extends StatefulWidget {
  const GlobalSearchScreenActivity({super.key});

  @override
  State<GlobalSearchScreenActivity> createState() =>
      _GlobalSearchScreenActivityState();
}

class _GlobalSearchScreenActivityState
    extends State<GlobalSearchScreenActivity> {
  TextEditingController searchcontroller = TextEditingController();
  GlobalSearchProvider _productDetails = GlobalSearchProvider();
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    _productDetails = Provider.of<GlobalSearchProvider>(context, listen: false);

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
      await _productDetails.loadMore(searchcontroller.text);
      setState(() {
        _isLoading = false;
      });
    }
  }

  fetchdata() async {
    await _productDetails.getallcategorylist(1, searchcontroller.text);
  }

  Widget _appBar() {
    return Container(
      color: AppColors.colorWhite,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          RotatedBox(
            quarterTurns: 4,
            child: _icon(Icons.arrow_back, color: Colors.white).ripple(() {
              // widget.callback("okopen");
            }),
          ),
          SizedBox(
            width: 2.w,
          ),
          Container(
            width: 80.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.w),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                  ),
                ]),
            child: TextFormField(
              onChanged: (value) {
                fetchdata();
              },
              controller: searchcontroller,
              cursorColor: AppColors.primarycolor,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Search Product",
                  hintStyle: TextStyle(fontSize: 14.sp, fontFamily: 'Roboto'),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.w),
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.w),
                      )),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.w),
                      )),
                  suffixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.search))),
            ),
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

  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalSearchProvider>(
        builder: (context, categoryprovider, child) {
      return Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            _appBar(),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    if (!categoryprovider.getcategorydatamodelfetch)
                      SizedBox(
                          width: 100.w,
                          height: 90.h,
                          child: Center(child: NoDataFoundErrorScreens())),
                    SizedBox(
                      height: 2.h,
                    ),
                    if (categoryprovider.getcategorydatamodelfetch)
                      if (categoryprovider.getcategorydatamodel.isNotEmpty)
                        _categorieslist(categoryprovider.getcategorydatamodel),
                  ],
                ),
              ),
            ),
          ],
        )),
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
