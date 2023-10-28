import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supersonicapp/model/Getsaveproductlist.dart';
import 'package:supersonicapp/provider/wishlistProductList.dart';
import 'package:supersonicapp/screens/myfab/compents/myfabui.dart';
import 'package:supersonicapp/utils/loaderscreen.dart';

class MyFabScreenActivity extends StatefulWidget {
  const MyFabScreenActivity({super.key});

  @override
  State<MyFabScreenActivity> createState() => _MyFabScreenActivityState();
}

class _MyFabScreenActivityState extends State<MyFabScreenActivity> {
  WishListProvider _getproductlist = WishListProvider();

  @override
  void initState() {
    _getproductlist = Provider.of<WishListProvider>(context, listen: false);
    fetchdata();
    super.initState();
  }

  fetchdata() async {
    await _getproductlist.getwishlist();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WishListProvider>(
        builder: (context, productProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Wish List"),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                // controller: _scrollController,
                child: Column(
                  children: [
                    if (!productProvider.getsaveproductlistfetch)
                      SizedBox(
                          width: 100.w,
                          height: 90.h,
                          child: Center(child: LoaderScreen())),
                    SizedBox(
                      height: 2.h,
                    ),
                    if (productProvider.getsaveproductlistfetch)
                      if (productProvider.getsaveproductlist.data != null)
                        if (productProvider.getsaveproductlist.data!.data !=
                            null)
                          if (productProvider
                              .getsaveproductlist.data!.data!.isNotEmpty)
                            _addtocardui(
                                productProvider.getsaveproductlist.data!.data!),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _addtocardui(List<GetsaveproductlistDatas> listdaya) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: listdaya.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return WishListShowUiScreen(
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
