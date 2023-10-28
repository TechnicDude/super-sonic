import 'package:flutter/material.dart';
import 'package:supersonicapp/api/api.dart';
import 'package:supersonicapp/api/network.dart';
import 'package:supersonicapp/model/getTermsConditionModel.dart';
import 'package:supersonicapp/model/getprivacyPolicyModel.dart';

class ProfileProvider extends ChangeNotifier {
  GetTermsConditionModel gettermsmodel = GetTermsConditionModel();
  GetprivacyPolicyModel getprivacyPolicymodel = GetprivacyPolicyModel();

  bool getcategorydatamodelfetch = false;
  bool getprivacyPolicymodelfetch = false;

  Future gettermscondtion() async {
    getcategorydatamodelfetch = false;
    ServiceWithHeader service = ServiceWithHeader(ApiUrl.termscondition);
    final response = await service.data();
    gettermsmodel = GetTermsConditionModel.fromJson(response);
    getcategorydatamodelfetch = true;
    notifyListeners();
    return;
  }

  Future getprivacyPolicy() async {
    getprivacyPolicymodelfetch = false;
    ServiceWithHeader service = ServiceWithHeader(ApiUrl.privacypolicy);
    final response = await service.data();
    getprivacyPolicymodel = GetprivacyPolicyModel.fromJson(response);
    getprivacyPolicymodelfetch = true;
    notifyListeners();
    return;
  }
}
