import 'package:supersonicapp/model/getproductlistdatamodel.dart';

class Getaddtocartlistmodel {
  GetaddtocartlistmodelData? data;
  String? status;

  Getaddtocartlistmodel({this.data, this.status});

  Getaddtocartlistmodel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new GetaddtocartlistmodelData.fromJson(json['data'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class GetaddtocartlistmodelData {
  int? currentPage;
  List<GetaddtocartlistmodelDataData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  GetaddtocartlistmodelData(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  GetaddtocartlistmodelData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <GetaddtocartlistmodelDataData>[];
      json['data'].forEach((v) {
        data!.add(new GetaddtocartlistmodelDataData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class GetaddtocartlistmodelDataData {
  int? id;
  int? userId;
  int? productId;
  String? createdAt;
  String? updatedAt;
  int? qty;
  User? user;
  GetProductlistDataModel? product;

  GetaddtocartlistmodelDataData(
      {this.id,
      this.userId,
      this.productId,
      this.createdAt,
      this.updatedAt,
      this.qty,
      this.user,
      this.product});

  GetaddtocartlistmodelDataData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    qty = json['qty'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    product = json['product'] != null
        ? new GetProductlistDataModel.fromJson(json['product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['qty'] = this.qty;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? apiToken;
  int? roleId;
  String? name;
  String? email;
  String? mobile;
  String? profileImage;
  String? emailVerifiedAt;
  String? city;
  String? stateId;
  String? countryId;
  String? country;
  String? pincode;
  String? latitude;
  String? longitude;
  String? activationToken;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? kycSubmit;
  int? kycVerified;
  int? active;

  User(
      {this.id,
      this.apiToken,
      this.roleId,
      this.name,
      this.email,
      this.mobile,
      this.profileImage,
      this.emailVerifiedAt,
      this.city,
      this.stateId,
      this.countryId,
      this.country,
      this.pincode,
      this.latitude,
      this.longitude,
      this.activationToken,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.kycSubmit,
      this.kycVerified,
      this.active});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    apiToken = json['api_token'];
    roleId = json['role_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    profileImage = json['profile_image'];
    emailVerifiedAt = json['email_verified_at'];
    city = json['city'];
    stateId = json['state_id'];
    countryId = json['country_id'];
    country = json['country'];
    pincode = json['pincode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    activationToken = json['activation_token'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    kycSubmit = json['kyc_submit'];
    kycVerified = json['kyc_verified'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['api_token'] = this.apiToken;
    data['role_id'] = this.roleId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['profile_image'] = this.profileImage;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['city'] = this.city;
    data['state_id'] = this.stateId;
    data['country_id'] = this.countryId;
    data['country'] = this.country;
    data['pincode'] = this.pincode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['activation_token'] = this.activationToken;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['kyc_submit'] = this.kycSubmit;
    data['kyc_verified'] = this.kycVerified;
    data['active'] = this.active;
    return data;
  }
}
