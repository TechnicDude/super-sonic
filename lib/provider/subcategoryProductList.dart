import 'package:flutter/material.dart';
import 'package:supersonicapp/api/api.dart';
import 'package:supersonicapp/api/network.dart';
import 'package:supersonicapp/model/getcategorymodel.dart';
import 'package:supersonicapp/model/getproductdetailsModel.dart';
import 'package:supersonicapp/model/getproductlistdatamodel.dart';
import 'package:supersonicapp/model/getsubcategoryproductlist.dart';

class SubCategoryProductListProvider extends ChangeNotifier {
  Getsubcategoryproductlistmodel getsubcategoryproductmodel =
      Getsubcategoryproductlistmodel();

  List<GetProductlistDataModel> _getsubcategoriproductlist = [];
  List<GetProductlistDataModel> get getsubcategoriproductlist =>
      _getsubcategoriproductlist;

  bool getcategorydatamodelfetch = false;

  bool isFirstdatafound = true;
  bool isLoadMoreRunning = false;
  bool hasfirst = true;
  int pageNumrecipe = 1;

  Future getallcategorylist(String subcategoryid, int page) async {
    if (page == 1) {
      getcategorydatamodelfetch = false;
      isFirstdatafound = true;
      _getsubcategoriproductlist = [];
    }

    ServiceWithHeader service = ServiceWithHeader(
        ApiUrl.products + "?page=$page&subcategory_id=$subcategoryid");
    final response = await service.data();
    getsubcategoryproductmodel =
        Getsubcategoryproductlistmodel.fromJson(response);
    if (getsubcategoryproductmodel.productList != null) {
      if (getsubcategoryproductmodel.productList!.data != null) {
        if (getsubcategoryproductmodel.productList!.data!.isNotEmpty) {
          for (int i = 0;
              i < getsubcategoryproductmodel.productList!.data!.length;
              i++) {
            _getsubcategoriproductlist
                .add(getsubcategoryproductmodel.productList!.data![i]);
          }
        }
      }
    }
    getcategorydatamodelfetch = true;
    notifyListeners();
    return;
  }

  Future loadMore(String subcategoryid) async {
    if (hasfirst && isFirstdatafound == false && isLoadMoreRunning == false) {
      isLoadMoreRunning = true; // Display a progress indicator at the bottom

      pageNumrecipe += 1; // Increase _page by 1
      await getallcategorylist(subcategoryid, pageNumrecipe);

      isLoadMoreRunning = false;
    }
  }
}
