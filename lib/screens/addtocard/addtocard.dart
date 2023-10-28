import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supersonicapp/model/getaddtocartlistmodel.dart';
import 'package:supersonicapp/model/getcategorymodel.dart';
import 'package:supersonicapp/page_routes/routes.dart';
import 'package:supersonicapp/provider/addtocardProvider.dart';
import 'package:supersonicapp/provider/categoryProvider.dart';
import 'package:supersonicapp/screens/addtocard/components/addtocardui.dart';
import 'package:supersonicapp/screens/categories/components/categoriescardui.dart';
import 'package:supersonicapp/utils/appcolors.dart';
import 'package:supersonicapp/utils/appstringfile.dart';
import 'package:supersonicapp/utils/appstyle.dart';
import 'package:supersonicapp/utils/loaderscreen.dart';
import 'package:supersonicapp/utils/title_text_style.dart';

class AddToCardScreenActivity extends StatefulWidget {
  const AddToCardScreenActivity({super.key});

  @override
  State<AddToCardScreenActivity> createState() =>
      _AddToCardScreenActivityState();
}

class _AddToCardScreenActivityState extends State<AddToCardScreenActivity> {
  AddtoCardProductListProvider _productDetails = AddtoCardProductListProvider();
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    _productDetails =
        Provider.of<AddtoCardProductListProvider>(context, listen: false);
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
      await _productDetails.loadMore();
      setState(() {
        _isLoading = false;
      });
    }
  }

  fetchdata() async {
    await _productDetails.getalladdtocardlists(1);
  }

  Widget _appBar() {
    return Container(
      color: AppColors.colorWhite,
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleTextStyle(
            text: 'Add To Cart',
            style: AppStyle.texttitlemain.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddtoCardProductListProvider>(
        builder: (context, categoryprovider, child) {
      return Column(
        children: [
          _appBar(),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  if (!categoryprovider.getaddtocardproductlistfetch)
                    SizedBox(
                        width: 100.w,
                        height: 90.h,
                        child: Center(child: LoaderScreen())),
                  SizedBox(
                    height: 2.h,
                  ),
                  if (categoryprovider.getaddtocardproductlistfetch)
                    if (categoryprovider.getaddtocardproductlist.isNotEmpty)
                      _addtocardui(categoryprovider.getaddtocardproductlist),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _addtocardui(List<GetaddtocartlistmodelDataData> listdaya) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: listdaya.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return AddtoCardShowUiScreen(
              model: listdaya[index],
              onSelected: (model) {
                // Navigator.pushNamed(context, Routes.subcategories, arguments: {
                //   AppStringFile.subCategoryId: model.subCategory,
                //   AppStringFile.subcategoriesname: model.name,
                // });
              });
        });
  }
}
