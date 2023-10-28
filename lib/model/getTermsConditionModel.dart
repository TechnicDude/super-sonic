class GetTermsConditionModel {
  TermsCondition? termsCondition;
  String? status;

  GetTermsConditionModel({this.termsCondition, this.status});

  GetTermsConditionModel.fromJson(Map<String, dynamic> json) {
    termsCondition = json['terms_condition'] != null
        ? new TermsCondition.fromJson(json['terms_condition'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.termsCondition != null) {
      data['terms_condition'] = this.termsCondition!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class TermsCondition {
  int? id;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;

  TermsCondition(
      {this.id, this.title, this.description, this.createdAt, this.updatedAt});

  TermsCondition.fromJson(Map<String, dynamic> json) {
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
