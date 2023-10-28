import 'package:flutter/material.dart';
import 'package:supersonicapp/api/api.dart';
import 'package:supersonicapp/api/network.dart';
import 'package:supersonicapp/model/Getsaveproductlist.dart';
import 'package:supersonicapp/utils/apphelper.dart';

class WishListProvider extends ChangeNotifier {
  Getsaveproductlist getsaveproductlist = Getsaveproductlist();
  bool getsaveproductlistfetch = false;
  
  Future getwishlist() async {
    getsaveproductlistfetch = false;
    ServiceWithHeader service =
        ServiceWithHeader('${ApiUrl.saveproductlist}?id=${AppHelper.userid}');
    final response = await service.data();
    getsaveproductlist = Getsaveproductlist.fromJson(response);
    getsaveproductlistfetch = true;
    notifyListeners();
    return;
  }
}
