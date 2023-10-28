import 'package:flutter/material.dart';
import 'package:supersonicapp/api/api.dart';
import 'package:supersonicapp/api/network.dart';
import 'package:supersonicapp/model/getcategorymodel.dart';

class CategoryProvider extends ChangeNotifier {
  Getcategorymodel getcategorymodel = Getcategorymodel();

  List<CategoryDataModel> _getcategorydatamodel = [];
  List<CategoryDataModel> get getcategorydatamodel => _getcategorydatamodel;

  bool getcategorydatamodelfetch = false;

  bool isFirstdatafound = true;
  bool isLoadMoreRunning = false;
  bool hasfirst = true;
  int pageNumrecipe = 1;

  Future getallcategorylist(int page) async {
    if (page == 1) {
      getcategorydatamodelfetch = false;
      isFirstdatafound = true;
      _getcategorydatamodel = [];
    }

    ServiceWithHeader service =
        ServiceWithHeader(ApiUrl.productscategories + "?page=$page");

    final response = await service.data();

    getcategorymodel = Getcategorymodel.fromJson(response);

    if (getcategorymodel.category?.data != null) {
      for (int i = 0; i < getcategorymodel.category!.data!.length; i++) {
        _getcategorydatamodel.add(getcategorymodel.category!.data![i]);
      }
    }

    getcategorydatamodelfetch = true;

    notifyListeners();
    return;
  }

  Future loadMore() async {
    if (hasfirst && isFirstdatafound == false && isLoadMoreRunning == false) {
      isLoadMoreRunning = true; // Display a progress indicator at the bottom

      pageNumrecipe += 1; // Increase _page by 1
      await getallcategorylist(pageNumrecipe);

      isLoadMoreRunning = false;
    }
  }
}
