import 'package:flutter/material.dart';
import 'package:supersonicapp/api/api.dart';
import 'package:supersonicapp/api/network.dart';
import 'package:supersonicapp/model/getproductdetailsModel.dart';
import 'package:supersonicapp/model/getproductlistdatamodel.dart';

class ProductDetailsProvider extends ChangeNotifier {
  GetproductdetailsModel getproductdetailsModel = GetproductdetailsModel();
  GetProductlistDataModel _getProductlistDataModel = GetProductlistDataModel();
  GetProductlistDataModel get getProductlistDataModel =>
      _getProductlistDataModel;

  List<GetProductlistDataModel> _getrelatedproduct = [];
  List<GetProductlistDataModel> get getrelatedproduct => _getrelatedproduct;

  bool getrelatedproductfetch = false;
  bool getProductlistDataModelfetch = false;

  Future getallproductdata(String id) async {
    getrelatedproductfetch = false;
    getProductlistDataModelfetch = false;
    ServiceWithHeader service =
        ServiceWithHeader(ApiUrl.productdetails + "?id=$id");

    final response = await service.data();

    getproductdetailsModel = GetproductdetailsModel.fromJson(response);
    _getrelatedproduct = [];
    _getProductlistDataModel = GetProductlistDataModel();

    if (getproductdetailsModel.product != null) {
      _getProductlistDataModel = getproductdetailsModel.product!;
    }

    if (getproductdetailsModel.relatedProducts!.isNotEmpty) {
      for (int i = 0; i < getproductdetailsModel.relatedProducts!.length; i++) {
        _getrelatedproduct.add(getproductdetailsModel.relatedProducts![i]);
      }
    }

    getrelatedproductfetch = true;
    getProductlistDataModelfetch = true;
    notifyListeners();
    return;
  }
}
