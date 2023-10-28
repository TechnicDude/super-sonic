import 'package:flutter/material.dart';
import 'package:supersonicapp/api/api.dart';
import 'package:supersonicapp/api/network.dart';
import 'package:supersonicapp/model/getcategorymodel.dart';
import 'package:supersonicapp/model/getglobalserch.dart';
import 'package:supersonicapp/model/getproductlistdatamodel.dart';

class GlobalSearchProvider extends ChangeNotifier {
  GetGlobalSearchModel getcategorymodel = GetGlobalSearchModel();

  List<GetProductlistDataModel> _getcategorydatamodel = [];
  List<GetProductlistDataModel> get getcategorydatamodel =>
      _getcategorydatamodel;

  bool getcategorydatamodelfetch = false;

  bool isFirstdatafound = true;
  bool isLoadMoreRunning = false;
  bool hasfirst = true;
  int pageNumrecipe = 1;

  Future getallcategorylist(int page, String search) async {
    if (page == 1) {
      getcategorydatamodelfetch = false;
      isFirstdatafound = true;
      _getcategorydatamodel = [];
    }

    ServiceWithHeader service = ServiceWithHeader(
        ApiUrl.globalproductsearch + "?search=$search" + "&page=$page");

    final response = await service.data();

    getcategorymodel = GetGlobalSearchModel.fromJson(response);

    if (getcategorymodel.productList != null) {
      if (getcategorymodel.productList!.data != null)
        for (int i = 0; i < getcategorymodel.productList!.data!.length; i++) {
          _getcategorydatamodel.add(getcategorymodel.productList!.data![i]);
        }
    }

    getcategorydatamodelfetch = true;

    notifyListeners();
    return;
  }

  Future loadMore(String search) async {
    if (hasfirst && isFirstdatafound == false && isLoadMoreRunning == false) {
      isLoadMoreRunning = true; // Display a progress indicator at the bottom

      pageNumrecipe += 1; // Increase _page by 1
      await getallcategorylist(pageNumrecipe, search);

      isLoadMoreRunning = false;
    }
  }
}
