import 'package:flutter/material.dart';
import 'package:supersonicapp/api/api.dart';
import 'package:supersonicapp/api/network.dart';
import 'package:supersonicapp/model/getfeatureproductlistModel.dart';
import 'package:supersonicapp/model/gethomelistModel.dart';
import 'package:supersonicapp/model/getproductlistdatamodel.dart';
import 'package:supersonicapp/model/getproductscategoriesModel.dart';
import 'package:supersonicapp/model/userinfo.dart';

import '../model/banner_model.dart';
import '../utils/apphelper.dart';

class DashBoradProvider extends ChangeNotifier {
  UserInfoModel profiletModel = UserInfoModel();
  BannerListModel bannerListModel = BannerListModel();
  GetproductscategoriesModel getproductListModel = GetproductscategoriesModel();
  GetfeatureproductlistModel getfeatureproductlistModel =
      GetfeatureproductlistModel();
  GethomelistModel gethomelistModel = GethomelistModel();

  List<BannerData> _bannerlist = [];
  List<BannerData> get bannerList => _bannerlist;

  List<GetProductlistDataModel> _getbestsellingproductlist = [];
  List<GetProductlistDataModel> get getbestsellingproductlist =>
      _getbestsellingproductlist;

  List<GetProductlistDataModel> _getnewarrivalsproductlist = [];
  List<GetProductlistDataModel> get getnewarrivalsproductlist =>
      _getnewarrivalsproductlist;

  List<BrandsData> _getbestsellingbrandlist = [];
  List<BrandsData> get getbestsellingbrandlist => _getbestsellingbrandlist;

  List<GetProductlistDataModel> _getfetureproductlist = [];
  List<GetProductlistDataModel> get getfetureproductlist =>
      _getfetureproductlist;

  List<GetproductscategoriesModelDatas> _getproductcategories = [];
  List<GetproductscategoriesModelDatas> get getproductcategories =>
      _getproductcategories;

  bool getproductcategorieslistfetch = false;

  bool profilefetch = false;
  bool bannerfetch = false;
  bool getfeatureproductlistModelfetch = false;
  bool gethomeproductlistModelfetch = false;

  Future profile() async {
    profilefetch = false;
    ServiceWithHeader service =
        ServiceWithHeader(ApiUrl.profile + "?id=${AppHelper.userid}");

    final response = await service.data();

    profiletModel = UserInfoModel.fromJson(response);
    _bannerlist = [];

    if (profiletModel.user != null) {
      AppHelper.userInfo = profiletModel.user;
    }
    profilefetch = true;
    notifyListeners();
    return;
  }

  Future bannerlists() async {
    bannerfetch = false;
    ServiceWithHeader service = new ServiceWithHeader(ApiUrl.bannerurl);

    final response = await service.data();

    bannerListModel = BannerListModel.fromJson(response);
    _bannerlist = [];

    if (bannerListModel.sliderImage != null) {
      if (bannerListModel.sliderImage!.data!.isNotEmpty) {
        for (int i = 0; i < bannerListModel.sliderImage!.data!.length; i++) {
          _bannerlist.add(bannerListModel.sliderImage!.data![i]);
        }
      }
    }
    bannerfetch = true;
    notifyListeners();
    return;
  }

  Future featureproductlist() async {
    getfeatureproductlistModelfetch = false;
    ServiceWithHeader service = ServiceWithHeader(ApiUrl.featureproductlisturl);

    final response = await service.data();

    getfeatureproductlistModel = GetfeatureproductlistModel.fromJson(response);
    _getfetureproductlist = [];

    if (getfeatureproductlistModel.featuredProductList != null) {
      if (getfeatureproductlistModel.featuredProductList!.data!.isNotEmpty) {
        for (int i = 0;
            i < getfeatureproductlistModel.featuredProductList!.data!.length;
            i++) {
          _getfetureproductlist
              .add(getfeatureproductlistModel.featuredProductList!.data![i]);
        }
      }
    }
    getfeatureproductlistModelfetch = true;
    notifyListeners();
    return;
  }

  Future homeproductlist() async {
    gethomeproductlistModelfetch = false;
    ServiceWithHeader service = ServiceWithHeader(ApiUrl.homeurl);

    final response = await service.data();

    gethomelistModel = GethomelistModel.fromJson(response);
    _getbestsellingproductlist = [];
    _getnewarrivalsproductlist = [];
    _getbestsellingbrandlist = [];
    if (gethomelistModel.bestSellingProduct!.isNotEmpty) {
      for (int i = 0; i < gethomelistModel.bestSellingProduct!.length; i++) {
        _getbestsellingproductlist.add(gethomelistModel.bestSellingProduct![i]);
      }
    }
    if (gethomelistModel.newArrival!.isNotEmpty) {
      for (int i = 0; i < gethomelistModel.newArrival!.length; i++) {
        _getnewarrivalsproductlist.add(gethomelistModel.newArrival![i]);
      }
    }
    if (gethomelistModel.brands != null) {
      if (gethomelistModel.brands!.data!.isNotEmpty) {
        for (int i = 0; i < gethomelistModel.brands!.data!.length; i++) {
          _getbestsellingbrandlist.add(gethomelistModel.brands!.data![i]);
        }
      }
    }

    gethomeproductlistModelfetch = true;
    notifyListeners();
    return;
  }

  Future getproductcategorieslist() async {
    getproductcategorieslistfetch = false;
    _getproductcategories = [];
    try {
      ServiceWithoutbody _service =
          ServiceWithoutbody(ApiUrl.productscategories);
      final response = await _service.data();
      getproductListModel = GetproductscategoriesModel.fromJson(response);
      if (getproductListModel.category.toString().toLowerCase() == "success") {
        if (getproductListModel.category != null) {
          if (getproductListModel.category!.data!.isNotEmpty) {
            for (int i = 0;
                i < getproductListModel.category!.data!.length;
                i++) {
              _getproductcategories.add(getproductListModel.category!.data![i]);
            }
          }
        }
      }
    } catch (e) {
      print(e);
    }
    getproductcategorieslistfetch = true;
    notifyListeners();

    return;
  }
}
