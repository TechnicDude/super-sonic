import 'package:supersonicapp/api/api.dart';
import 'package:supersonicapp/api/network.dart';

class ProductApi {
  final Map<String, dynamic> body;
  ProductApi(this.body);

  Future addtocard() async {
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(ApiUrl.productsaddtocard, body);
    var data = await service.data();
    return data;
  }

  Future favtocard() async {
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(ApiUrl.productsfavtocardlist, body);
    var data = await service.data();
    return data;
  }

  Future reviewadd() async {
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(ApiUrl.productsreviewproductlist, body);
    var data = await service.data();
    return data;
  }
  
}
