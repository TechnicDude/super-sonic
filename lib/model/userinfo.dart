class UserInfoModel {
  UserInfo? user;
  String? status;

  UserInfoModel({this.user, this.status});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new UserInfo.fromJson(json['user']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class UserInfo {
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
  List<ManageAddress>? manageAddress;

  UserInfo(
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
      this.active,
      this.manageAddress});

  UserInfo.fromJson(Map<String, dynamic> json) {
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
    if (json['manage_address'] != null) {
      manageAddress = <ManageAddress>[];
      json['manage_address'].forEach((v) {
        manageAddress!.add(new ManageAddress.fromJson(v));
      });
    }
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
    if (this.manageAddress != null) {
      data['manage_address'] =
          this.manageAddress!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ManageAddress {
  int? id;
  int? userId;
  String? fullName;
  String? mobileNo;
  String? addressLine1;
  String? addressLine2;
  String? zip;
  String? country;
  String? state;
  int? status;
  String? createdAt;
  String? updatedAt;

  ManageAddress(
      {this.id,
      this.userId,
      this.fullName,
      this.mobileNo,
      this.addressLine1,
      this.addressLine2,
      this.zip,
      this.country,
      this.state,
      this.status,
      this.createdAt,
      this.updatedAt});

  ManageAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fullName = json['full_name'];
    mobileNo = json['mobile_no'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    zip = json['zip'];
    country = json['country'];
    state = json['state'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['full_name'] = this.fullName;
    data['mobile_no'] = this.mobileNo;
    data['address_line_1'] = this.addressLine1;
    data['address_line_2'] = this.addressLine2;
    data['zip'] = this.zip;
    data['country'] = this.country;
    data['state'] = this.state;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
