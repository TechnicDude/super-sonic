class GetprivacyPolicyModel {
  PrivacyPolicy? privacyPolicy;
  String? status;

  GetprivacyPolicyModel({this.privacyPolicy, this.status});

  GetprivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    privacyPolicy = json['privacy_policy'] != null
        ? new PrivacyPolicy.fromJson(json['privacy_policy'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.privacyPolicy != null) {
      data['privacy_policy'] = this.privacyPolicy!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class PrivacyPolicy {
  int? id;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;

  PrivacyPolicy(
      {this.id, this.title, this.description, this.createdAt, this.updatedAt});

  PrivacyPolicy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
