import 'package:supersonicapp/model/getproductlistdatamodel.dart';

class GethomelistModel {
  List<Category>? category;
  List<SliderImages>? sliderImages;
  Brands? brands;
  int? countBrands;
  List<GetProductlistDataModel>? featureProduct;
  int? countFeatureProduct;
  List<GetProductlistDataModel>? bestSellingProduct;
  int? countBestSellingProduct;
  List<GetProductlistDataModel>? newArrival;
  int? countNewArrival;
  List<LatestBlog>? latestBlog;
  int? countLatestBlog;
  int? totalProduct;
  String? status;

  GethomelistModel(
      {this.category,
      this.sliderImages,
      this.brands,
      this.countBrands,
      this.featureProduct,
      this.countFeatureProduct,
      this.bestSellingProduct,
      this.countBestSellingProduct,
      this.newArrival,
      this.countNewArrival,
      this.latestBlog,
      this.countLatestBlog,
      this.totalProduct,
      this.status});

  GethomelistModel.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    if (json['slider_images'] != null) {
      sliderImages = <SliderImages>[];
      json['slider_images'].forEach((v) {
        sliderImages!.add(new SliderImages.fromJson(v));
      });
    }
    brands =
        json['brands'] != null ? new Brands.fromJson(json['brands']) : null;
    countBrands = json['count_brands'];
    if (json['feature_product'] != null) {
      featureProduct = <GetProductlistDataModel>[];
      json['feature_product'].forEach((v) {
        featureProduct!.add(new GetProductlistDataModel.fromJson(v));
      });
    }
    countFeatureProduct = json['count_feature_product'];
    if (json['best_selling_product'] != null) {
      bestSellingProduct = <GetProductlistDataModel>[];
      json['best_selling_product'].forEach((v) {
        bestSellingProduct!.add(new GetProductlistDataModel.fromJson(v));
      });
    }
    countBestSellingProduct = json['count_best_selling_product'];
    if (json['new_arrival'] != null) {
      newArrival = <GetProductlistDataModel>[];
      json['new_arrival'].forEach((v) {
        newArrival!.add(new GetProductlistDataModel.fromJson(v));
      });
    }
    countNewArrival = json['count_new_arrival'];
    if (json['latest_blog'] != null) {
      latestBlog = <LatestBlog>[];
      json['latest_blog'].forEach((v) {
        latestBlog!.add(new LatestBlog.fromJson(v));
      });
    }
    countLatestBlog = json['count_latest_blog'];
    totalProduct = json['total_product'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.sliderImages != null) {
      data['slider_images'] =
          this.sliderImages!.map((v) => v.toJson()).toList();
    }
    if (this.brands != null) {
      data['brands'] = this.brands!.toJson();
    }
    data['count_brands'] = this.countBrands;
    if (this.featureProduct != null) {
      data['feature_product'] =
          this.featureProduct!.map((v) => v.toJson()).toList();
    }
    data['count_feature_product'] = this.countFeatureProduct;
    if (this.bestSellingProduct != null) {
      data['best_selling_product'] =
          this.bestSellingProduct!.map((v) => v.toJson()).toList();
    }
    data['count_best_selling_product'] = this.countBestSellingProduct;
    if (this.newArrival != null) {
      data['new_arrival'] = this.newArrival!.map((v) => v.toJson()).toList();
    }
    data['count_new_arrival'] = this.countNewArrival;
    if (this.latestBlog != null) {
      data['latest_blog'] = this.latestBlog!.map((v) => v.toJson()).toList();
    }
    data['count_latest_blog'] = this.countLatestBlog;
    data['total_product'] = this.totalProduct;
    data['status'] = this.status;
    return data;
  }
}

class SliderImages {
  int? id;
  String? heading;
  String? subHeading;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? categoryId;

  SliderImages(
      {this.id,
      this.heading,
      this.subHeading,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.categoryId});

  SliderImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    subHeading = json['sub_heading'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['heading'] = this.heading;
    data['sub_heading'] = this.subHeading;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['category_id'] = this.categoryId;
    return data;
  }
}

class Brands {
  int? currentPage;
  List<BrandsData>? data;
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

  Brands(
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

  Brands.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <BrandsData>[];
      json['data'].forEach((v) {
        data!.add(new BrandsData.fromJson(v));
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

class BrandsData {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? productCount;

  BrandsData(
      {this.id,
      this.name,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.productCount});

  BrandsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productCount = json['product_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['product_count'] = this.productCount;
    return data;
  }
}

class BrandValue {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;

  BrandValue({this.id, this.name, this.image, this.createdAt, this.updatedAt});

  BrandValue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class LatestBlog {
  int? id;
  String? title;
  String? body;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? categoryId;
  String? userId;
  String? tags;
  String? seoTitle;
  String? metaKeywords;
  String? seoCategory;
  String? seoTags;
  String? metaDescriptions;

  LatestBlog(
      {this.id,
      this.title,
      this.body,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.categoryId,
      this.userId,
      this.tags,
      this.seoTitle,
      this.metaKeywords,
      this.seoCategory,
      this.seoTags,
      this.metaDescriptions});

  LatestBlog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    tags = json['tags'];
    seoTitle = json['seo_title'];
    metaKeywords = json['meta_keywords'];
    seoCategory = json['seo_category'];
    seoTags = json['seo_tags'];
    metaDescriptions = json['meta_descriptions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['category_id'] = this.categoryId;
    data['user_id'] = this.userId;
    data['tags'] = this.tags;
    data['seo_title'] = this.seoTitle;
    data['meta_keywords'] = this.metaKeywords;
    data['seo_category'] = this.seoCategory;
    data['seo_tags'] = this.seoTags;
    data['meta_descriptions'] = this.metaDescriptions;
    return data;
  }
}
