import 'package:supersonicapp/api/api.dart';
import 'package:supersonicapp/api/network.dart';
import 'package:supersonicapp/screens/loginsignup/otpverify.dart';

class LoginApi {
  final Map<String, dynamic> body;
  LoginApi(this.body);
  
  Future register() async {
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(ApiUrl.register, body);
    var data = await service.data();
    return data;
  }

  Future otpVerify() async {
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(ApiUrl.verify, body);
    var data = await service.dataput();
    return data;
  }

  Future login() async {
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(ApiUrl.login, body);
    var data = await service.data();
    return data;
  }

  Future forgetpassword() async {
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(ApiUrl.forgetpassword, body);
    var data = await service.datarow();
    return data;
  }
}
