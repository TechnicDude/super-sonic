import 'package:supersonicapp/model/getsubcategoryproductlist.dart';

class GetGlobalSearchModel {
  ProductList? productList;
  String? status;

  GetGlobalSearchModel({this.productList, this.status});

  GetGlobalSearchModel.fromJson(Map<String, dynamic> json) {
    productList = json['product_list'] != null
        ? new ProductList.fromJson(json['product_list'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productList != null) {
      data['product_list'] = this.productList!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}
