class GetProductlistDataModel {
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
  int? offerId;
  String? seoTitle;
  String? metaKeywords;
  String? seoCategory;
  String? seoTags;
  String? metaDescriptions;
  int? subcategoryId;
  String? packageWeight;
  int? length;
  int? width;
  int? height;
  String? dimensionUnit;
  String? upc;
  String? mpn;
  String? bestSelling;
  double? avgRating;
  int? productReviewCount;
  Category? category;
  Subcategory? subcategory;
  BrandValue? brandValue;
  User? user;
  List<ProductKeyFeatures>? productKeyFeatures;
  List<ProductReview>? productReview;
  Offers? offers;
  List<ProductImages>? productImages;

  GetProductlistDataModel(
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
      this.subcategoryId,
      this.packageWeight,
      this.length,
      this.width,
      this.height,
      this.dimensionUnit,
      this.upc,
      this.mpn,
      this.bestSelling,
      this.avgRating,
      this.productReviewCount,
      this.category,
      this.subcategory,
      this.brandValue,
      this.user,
      this.productKeyFeatures,
      this.productReview,
      this.offers,
      this.productImages});

  GetProductlistDataModel.fromJson(Map<String, dynamic> json) {
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
    offerId = json['offer_id'];
    seoTitle = json['seo_title'];
    metaKeywords = json['meta_keywords'];
    seoCategory = json['seo_category'];
    seoTags = json['seo_tags'];
    metaDescriptions = json['meta_descriptions'];
    subcategoryId = json['subcategory_id'];
    packageWeight = json['package_weight'];
    length = json['length'];
    width = json['width'];
    height = json['height'];
    dimensionUnit = json['dimension_unit'];
    upc = json['upc'];
    mpn = json['mpn'];
    bestSelling = json['best_selling'];
    avgRating = json['avg_rating'].toString() != "null"
        ? double.parse(json['avg_rating'].toString())
        : 0.0;
    productReviewCount = json['product_review_count'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    subcategory = json['subcategory'] != null
        ? new Subcategory.fromJson(json['subcategory'])
        : null;
    brandValue = json['brand_value'] != null
        ? new BrandValue.fromJson(json['brand_value'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['product_key_features'] != null) {
      productKeyFeatures = <ProductKeyFeatures>[];
      json['product_key_features'].forEach((v) {
        productKeyFeatures!.add(new ProductKeyFeatures.fromJson(v));
      });
    }
    if (json['product_review'] != null) {
      productReview = <ProductReview>[];
      json['product_review'].forEach((v) {
        productReview!.add(new ProductReview.fromJson(v));
      });
    }
    offers =
        json['offers'] != null ? new Offers.fromJson(json['offers']) : null;
    if (json['product_images'] != null) {
      productImages = <ProductImages>[];
      json['product_images'].forEach((v) {
        productImages!.add(new ProductImages.fromJson(v));
      });
    }
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
    data['subcategory_id'] = this.subcategoryId;
    data['package_weight'] = this.packageWeight;
    data['length'] = this.length;
    data['width'] = this.width;
    data['height'] = this.height;
    data['dimension_unit'] = this.dimensionUnit;
    data['upc'] = this.upc;
    data['mpn'] = this.mpn;
    data['best_selling'] = this.bestSelling;
    data['avg_rating'] = this.avgRating;
    data['product_review_count'] = this.productReviewCount;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.subcategory != null) {
      data['subcategory'] = this.subcategory!.toJson();
    }
    if (this.brandValue != null) {
      data['brand_value'] = this.brandValue!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.productKeyFeatures != null) {
      data['product_key_features'] =
          this.productKeyFeatures!.map((v) => v.toJson()).toList();
    }
    if (this.productReview != null) {
      data['product_review'] =
          this.productReview!.map((v) => v.toJson()).toList();
    }
    if (this.offers != null) {
      data['offers'] = this.offers!.toJson();
    }
    if (this.productImages != null) {
      data['product_images'] =
          this.productImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? parentId;
  String? name;
  String? image;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? bannerImage;
  List<Subcategory>? subCategorys;

  Category({
    this.id,
    this.parentId,
    this.name,
    this.image,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.bannerImage,
    this.subCategorys,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'].toString();
    name = json['name'];
    image = json['image'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bannerImage = json['banner_image'];
    if (json['sub_category'] != null) {
      subCategorys = <Subcategory>[];
      json['sub_category'].forEach((v) {
        subCategorys!.add(new Subcategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['banner_image'] = this.bannerImage;
    if (this.subCategorys != null) {
      data['sub_category'] = this.subCategorys!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcategory {
  int? id;
  int? categoryId;
  String? name;
  String? image;
  String? bannerImage;
  String? description;
  String? createdAt;
  String? updatedAt;

  Subcategory(
      {this.id,
      this.categoryId,
      this.name,
      this.image,
      this.bannerImage,
      this.description,
      this.createdAt,
      this.updatedAt});

  Subcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'];
    bannerImage = json['banner_image'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['banner_image'] = this.bannerImage;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
  int? countryId;
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

class ProductKeyFeatures {
  int? id;
  int? productId;
  String? name;
  String? value;
  String? createdAt;
  String? updatedAt;

  ProductKeyFeatures(
      {this.id,
      this.productId,
      this.name,
      this.value,
      this.createdAt,
      this.updatedAt});

  ProductKeyFeatures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    value = json['value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['value'] = this.value;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ProductReview {
  int? id;
  int? productId;
  int? userId;
  String? name;
  String? email;
  String? review;
  double? rating;
  String? createdAt;
  String? updatedAt;
  String? userimg;

  ProductReview({
    this.id,
    this.productId,
    this.userId,
    this.name,
    this.email,
    this.review,
    this.rating,
    this.createdAt,
    this.updatedAt,
    this.userimg,
  });

  ProductReview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    review = json['review'];
    rating = double.parse(json['rating'].toString());
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userimg = json['user_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['review'] = this.review;
    data['rating'] = this.rating;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_img'] = this.userimg;
    return data;
  }
}

class Offers {
  int? id;
  int? userId;
  String? offerName;
  String? discount;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? startAt;
  String? endAt;
  String? banner;
  String? description;

  Offers(
      {this.id,
      this.userId,
      this.offerName,
      this.discount,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.startAt,
      this.endAt,
      this.banner,
      this.description});

  Offers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    offerName = json['offer_name'];
    discount = json['discount'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    banner = json['banner'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['offer_name'] = this.offerName;
    data['discount'] = this.discount;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['start_at'] = this.startAt;
    data['end_at'] = this.endAt;
    data['banner'] = this.banner;
    data['description'] = this.description;
    return data;
  }
}

class ProductImages {
  int? id;
  int? productId;
  String? image;
  String? createdAt;
  String? updatedAt;

  ProductImages(
      {this.id, this.productId, this.image, this.createdAt, this.updatedAt});

  ProductImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
