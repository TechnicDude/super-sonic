import 'package:flutter/material.dart';
import 'package:supersonicapp/page_routes/routes.dart';
import 'package:supersonicapp/provider/globalserchProvider.dart';
import 'package:supersonicapp/provider/productdetailsProvider.dart';
import 'package:supersonicapp/provider/productlistbybrand.dart';
import 'package:supersonicapp/provider/subcategoryProductList.dart';
import 'package:supersonicapp/provider/wishlistProductList.dart';
import 'package:supersonicapp/screens/Home/components/myaccount.dart';
import 'package:supersonicapp/screens/Home/bottomNav.dart';
import 'package:supersonicapp/screens/Home/globalsearch.dart';
import 'package:supersonicapp/screens/Home/product_detail.dart';
import 'package:supersonicapp/screens/Home/reviewall.dart';
import 'package:supersonicapp/screens/Home/reviewproduct.dart';
import 'package:supersonicapp/screens/categories/productlist.dart';
import 'package:supersonicapp/screens/categories/productlistbybrand.dart';
import 'package:supersonicapp/screens/categories/subcategories.dart';
import 'package:supersonicapp/screens/loginsignup/changenewpassword.dart';
import 'package:supersonicapp/screens/loginsignup/changepassword.dart';
import 'package:supersonicapp/screens/loginsignup/forgetpassword.dart';
import 'package:supersonicapp/screens/loginsignup/login.dart';
import 'package:supersonicapp/screens/loginsignup/otpverify.dart';
import 'package:supersonicapp/screens/loginsignup/signup.dart';
import 'package:supersonicapp/screens/myfab/myfab.dart';
import 'package:supersonicapp/screens/profile/detailsshow.dart';
import 'package:supersonicapp/screens/profile/editprofile.dart';
import 'package:supersonicapp/screens/splashscreen.dart';
import 'package:supersonicapp/utils/appstringfile.dart';
import 'package:provider/provider.dart';
import '../provider/dashboardProvider.dart';
import '../screens/profile/profilescreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    Widget widgetScreen;
    switch (settings.name) {
      case Routes.splashScreen:
        widgetScreen = SplashScreen();
        break;

      case Routes.loginScreen:
        widgetScreen = LoginScreenActivity();
        break;
      case Routes.signupScreen:
        widgetScreen = SignupScreenActivity();
        break;

      case Routes.forgetPassword:
        widgetScreen = ForgetPassword();
        break;

      case Routes.otpVerify:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = OtpVerify(
          email: args[AppStringFile.email],
        );
        break;

      case Routes.changenewPassword:
        widgetScreen = ChangenewPassword();
        break;

      case Routes.changePassword:
        widgetScreen = ChangePassword();
        break;
      case Routes.bottomNav:
        widgetScreen = BottomNav();
        break;

      case Routes.myAccount:
        widgetScreen = MyAccount();
        break;
      case Routes.productDetails:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangeNotifierProvider<ProductDetailsProvider>(
            create: (BuildContext context) => ProductDetailsProvider(),
            child: ProductDetailPage(
              productid: args[AppStringFile.productid],
            ));

        break;
      case Routes.product:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangeNotifierProvider<SubCategoryProductListProvider>(
            create: (BuildContext context) => SubCategoryProductListProvider(),
            child: SubCategoriesProductListScreenActivity(
              subcategoriesid: args[AppStringFile.subcategoriesid],
              subcategoriesname: args[AppStringFile.subcategoriesname],
            ));

        break;
      case Routes.subcategories:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = SubCategorisScreenActivity(
          subcategory: args[AppStringFile.subCategoryId],
          subcategoryname: args[AppStringFile.subcategoriesname],
        );
        break;
      case Routes.productlistbybrand:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangeNotifierProvider<ProductListByBrandProvider>(
            create: (BuildContext context) => ProductListByBrandProvider(),
            child: ProductListByBarndScreenActivity(
              subcategoriesid: args[AppStringFile.subCategoryId],
              subcategoriesname: args[AppStringFile.subcategoriesname],
            ));

        break;
      case Routes.detailsscreen:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = DetailsShowScreenActivity(
          title: args[AppStringFile.apptitle],
          description: args[AppStringFile.appdescrition],
        );
        break;
      case Routes.reviewallscreen:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ReviewAllScreenActivity(
          productReview: args[AppStringFile.productreviewlist],
          productid: args[AppStringFile.productid],
        );

        break;

      case Routes.wishlist:
        // Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;

        widgetScreen = ChangeNotifierProvider<WishListProvider>(
            create: (BuildContext context) => WishListProvider(),
            child: MyFabScreenActivity());
        break;

      case Routes.globalSearch:
        // Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;

        widgetScreen = ChangeNotifierProvider<GlobalSearchProvider>(
            create: (BuildContext context) => GlobalSearchProvider(),
            child: GlobalSearchScreenActivity());
        break;

      case Routes.editProfile:
        widgetScreen = EditProfile();
        break;

      case Routes.reviewproduct:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ReviewProductScreenActivity(
          productid: args[AppStringFile.productid],
        );
        break;

      case Routes.profileScreen:
        widgetScreen = ProfileScreen();
        break;

      default:
        widgetScreen = SplashScreen();
    }
    return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => widgetScreen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
  }

  static Widget _errorRoute() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('ERROR'),
      ),
    );
  }
}
