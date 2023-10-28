class Getsaveproductlist {
  GetsaveproductlistData? data;
  String? status;

  Getsaveproductlist({this.data, this.status});

  Getsaveproductlist.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new GetsaveproductlistData.fromJson(json['data'])
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

class GetsaveproductlistData {
  int? currentPage;
  List<GetsaveproductlistDatas>? data;
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

  GetsaveproductlistData(
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

  GetsaveproductlistData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <GetsaveproductlistDatas>[];
      json['data'].forEach((v) {
        data!.add(new GetsaveproductlistDatas.fromJson(v));
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

class GetsaveproductlistDatas {
  int? id;
  int? userId;
  int? productId;
  String? createdAt;
  String? updatedAt;
  User? user;
  Product? product;

  GetsaveproductlistDatas(
      {this.id,
      this.userId,
      this.productId,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.product});

  GetsaveproductlistDatas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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

class Product {
  int? id;
  int? userId;
  int? categoryId;
  String? title;
  String? content;
  String? slug;
  String? brand;
  String? partNumber;
  String? sku;
  String? regularPrice;
  String? salePrice;
  String? price;
  String? stockQty;
  String? stockAvailability;
  String? type;
  String? imageUrl;
  int? status;
  int? feature;
  String? createdAt;
  String? updatedAt;
  String? country;
  String? currency;
  String? material;
  String? keylockHole;
  String? originalPart;
  String? color;
  String? offerId;
  String? seoTitle;
  String? metaKeywords;
  String? seoCategory;
  String? seoTags;
  String? metaDescriptions;
  String? categoryName;
  String? brandName;
  String? avgRating;
  int? productReviewCount;

  Product(
      {this.id,
      this.userId,
      this.categoryId,
      this.title,
      this.content,
      this.slug,
      this.brand,
      this.partNumber,
      this.sku,
      this.regularPrice,
      this.salePrice,
      this.price,
      this.stockQty,
      this.stockAvailability,
      this.type,
      this.imageUrl,
      this.status,
      this.feature,
      this.createdAt,
      this.updatedAt,
      this.country,
      this.currency,
      this.material,
      this.keylockHole,
      this.originalPart,
      this.color,
      this.offerId,
      this.seoTitle,
      this.metaKeywords,
      this.seoCategory,
      this.seoTags,
      this.metaDescriptions,
      this.categoryName,
      this.brandName,
      this.avgRating,
      this.productReviewCount});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    title = json['title'];
    content = json['content'];
    slug = json['slug'];
    brand = json['brand'];
    partNumber = json['part_number'];
    sku = json['sku'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    price = json['price'];
    stockQty = json['stock_qty'];
    stockAvailability = json['stock_availability'];
    type = json['type'];
    imageUrl = json['image_url'];
    status = json['status'];
    feature = json['feature'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    country = json['country'];
    currency = json['currency'];
    material = json['material'];
    keylockHole = json['keylock_hole'];
    originalPart = json['original_part'];
    color = json['color'];
    offerId = json['offer_id'].toString();
    seoTitle = json['seo_title'];
    metaKeywords = json['meta_keywords'];
    seoCategory = json['seo_category'];
    seoTags = json['seo_tags'];
    metaDescriptions = json['meta_descriptions'];
    categoryName = json['category_name'];
    brandName = json['brand_name'];
    avgRating = json['avg_rating'].toString();
    productReviewCount = json['product_review_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['slug'] = this.slug;
    data['brand'] = this.brand;
    data['part_number'] = this.partNumber;
    data['sku'] = this.sku;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    data['price'] = this.price;
    data['stock_qty'] = this.stockQty;
    data['stock_availability'] = this.stockAvailability;
    data['type'] = this.type;
    data['image_url'] = this.imageUrl;
    data['status'] = this.status;
    data['feature'] = this.feature;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['country'] = this.country;
    data['currency'] = this.currency;
    data['material'] = this.material;
    data['keylock_hole'] = this.keylockHole;
    data['original_part'] = this.originalPart;
    data['color'] = this.color;
    data['offer_id'] = this.offerId;
    data['seo_title'] = this.seoTitle;
    data['meta_keywords'] = this.metaKeywords;
    data['seo_category'] = this.seoCategory;
    data['seo_tags'] = this.seoTags;
    data['meta_descriptions'] = this.metaDescriptions;
    data['category_name'] = this.categoryName;
    data['brand_name'] = this.brandName;
    data['avg_rating'] = this.avgRating;
    data['product_review_count'] = this.productReviewCount;
    return data;
  }
}
