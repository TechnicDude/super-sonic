import 'package:shared_preferences/shared_preferences.dart';
import 'package:supersonicapp/utils/apphelper.dart';
import 'package:supersonicapp/utils/appstringfile.dart';

class LocDb {
  LocDb._internal();
  static final LocDb _db = LocDb._internal();
  factory LocDb() {
    return _db;
  }
  bool loginapp = false;

  Future<bool> isLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    AppHelper.AUTH_TOKEN_VALUE = preferences.getString(AppStringFile.authtoken);
    AppHelper.userid = preferences.getString(AppStringFile.userid);
    AppHelper.email_VALUE = preferences.getString(AppStringFile.email);
    if (AppHelper.userid == null || AppHelper.userid == false) {
      print("object check");
      loginapp = false;
      return false;
    } else {
      loginapp = true;
      return true;
    }
  }
}
