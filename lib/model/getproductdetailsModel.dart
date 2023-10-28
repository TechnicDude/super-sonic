import 'package:supersonicapp/model/getproductlistdatamodel.dart';

class GetproductdetailsModel {
  GetProductlistDataModel? product;
  List<GetProductlistDataModel>? relatedProducts;
  String? status;

  GetproductdetailsModel({this.product, this.relatedProducts, this.status});

  GetproductdetailsModel.fromJson(Map<String, dynamic> json) {
    product = json['product'] != null
        ? new GetProductlistDataModel.fromJson(json['product'])
        : null;
    if (json['related_products'] != null) {
      relatedProducts = <GetProductlistDataModel>[];
      json['related_products'].forEach((v) {
        relatedProducts!.add(new GetProductlistDataModel.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.relatedProducts != null) {
      data['related_products'] =
          this.relatedProducts!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}
