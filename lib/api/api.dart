class ApiUrl {
  static const String roots = "http://127.0.0.1:8000";
  static const String root = "https://admin.supersonicparts.com";
  static const String home = "$root/api";
  static const String register = "$home/registration";
  static const String verify = "$home/verify";
  static const String login = "$home/login";
  static const String forgetpassword = "$home/request-reset-password";

  //profile
  static const String profile = "$home/profile_details";
  static const String updateprofile = "$home/update_profile";
  static const String termscondition = "$home/terms_condition";
  static const String privacypolicy = "$home/privacy_policy";

  //change_password

  //home dashborad

  static const String bannerurl = "$home/slider_images";
  static const String featureproductlisturl = "$home/feature_product_list";
  static const String homeurl = "$home/home";
  static const String productdetails = "$home/product_details";

  static const String productscategories = "$home/category";
  static const String productssubcategories = "$root/products-sub-categories";
  static const String products = "$home/product_list";
  static const String globalproductsearch = "$home/global_product_search";

  // product details
  static const String productsaddtocard = "$home/add_to_cart";
  static const String productsaddtocardlist = "$home/add_to_cart_list";
  static const String productsfavtocardlist = "$home/add_save_product";
  static const String productsreviewproductlist = "$home/add_review";
  static const String saveproductlist = "$home/save_product_list";
}
