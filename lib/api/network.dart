import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:supersonicapp/utils/apphelper.dart';

class Service {
  final Map<String, dynamic> body;
  final String loginURL;
  Service(this.loginURL, this.body);

  Future data() async {
    Response response = await post(Uri.parse(loginURL), body: jsonEncode(body));

    var status = jsonDecode(response.body);
    if (status['status'].toString().toUpperCase() == 'SUCCESS' ||
        status['status'].toString().toUpperCase() == 'TRUE') {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return {
        "error": status['message'],
      };
    }
  }

  Future formdata() async {
    Response response = await post(Uri.parse(loginURL), body: (body));
    var status = jsonDecode(response.body);
    if (status['status'].toString().toUpperCase() == 'SUCCESS' ||
        status['status'].toString().toUpperCase() == 'TRUE') {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return {
        "error": status['message'],
      };
    }
  }
}

class ServiceWithHeaderWithbody {
  final String loginURL;
  final Map<String, dynamic> body;

  ServiceWithHeaderWithbody(
    this.loginURL,
    this.body,
  );

  Future data() async {
    print(body);
    print(loginURL);
    final response = await http.post(Uri.parse(loginURL),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body));

    var status = jsonDecode(response.body);
    print(status);
    if (status['status'].toString().toUpperCase() == 'SUCCESS' ||
        status['status'].toString().toUpperCase() == 'TRUE') {
      print("object data1");
      String data = response.body;
      print(data);
      return jsonDecode(data);
    } else {
      print("object data");
      return {
        "error": status['message'],
      };
    }
  }

  Future datarow() async {
    print(body);
    print(loginURL);
    final response = await http.post(Uri.parse(loginURL), body: (body));
    // body: jsonEncode(body))
    // final response =
    //     await http.post(Uri.parse(loginURL), body: jsonEncode(body), headers: {
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    //   // 'Authorization': 'Bearer ${MyApp.AUTH_TOKEN_VALUE}',
    // });
    var status = jsonDecode(response.body);
    print(status);
    if (status['status'].toString().toUpperCase() == 'SUCCESS' ||
        status['status'].toString().toUpperCase() == 'TRUE') {
      print("object data1");
      String data = response.body;
      print(data);
      return jsonDecode(data);
    } else {
      print("object data");
      return {
        "error": status['message'],
      };
    }
  }

  Future dataput() async {
    print(body);
    print(loginURL);
    final response = await http.put(Uri.parse(loginURL),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body));
    // body: jsonEncode(body))
    // final response =
    //     await http.post(Uri.parse(loginURL), body: jsonEncode(body), headers: {
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    //   // 'Authorization': 'Bearer ${MyApp.AUTH_TOKEN_VALUE}',
    // });
    var status = jsonDecode(response.body);
    print(status);

    if (status['status'].toString().toUpperCase() == 'SUCCESS' ||
        status['status'].toString().toUpperCase() == 'TRUE') {
      print("object data1");
      String data = response.body;
      print(data);
      return jsonDecode(data);
    } else {
      print("object data");
      return {
        "error": status['message'],
      };
    }
  }

  Future postdatawithoutbody() async {
    print(loginURL);
    // print(MyApp.AUTH_TOKEN_VALUE);
    print(body);
    final response = await http.post(Uri.parse(loginURL),
        body: jsonEncode(body),

        // AppHelper.language!

        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer ${MyApp.AUTH_TOKEN_VALUE}',
        });
    print(loginURL);
    print(response.body);
    var restatus = jsonDecode(response.body);
    print(restatus);
    print('heee${restatus['status']}');
    if (restatus['status'].toString().toUpperCase() == 'SUCCESS' ||
        restatus['status'].toString().toUpperCase() == 'TRUE') {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print("object check");
      print(restatus['message']);
      print(restatus);
      return {
        "error": restatus['message'],
      };
    }
  }
}

class ServiceWithHeader {
  final String loginURL;

  ServiceWithHeader(
    this.loginURL,
  );

  Future data() async {
    print(loginURL);
    print(AppHelper.AUTH_TOKEN_VALUE);
    print('Bearer ${AppHelper.AUTH_TOKEN_VALUE?.trim()}');
    final response = await http.get(Uri.parse(loginURL), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppHelper.AUTH_TOKEN_VALUE?.trim()}',
    });
    print(loginURL);
    print(response.body);
    var status = jsonDecode(response.body);
    print('heee${status['status']}');
    if (status['status'].toString().toUpperCase() == 'SUCCESS' ||
        status['status'].toString().toUpperCase() == 'TRUE') {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return {
        "error": status['message'],
      };
    }
  }

  Future datame() async {
    print(loginURL);
    print(AppHelper.AUTH_TOKEN_VALUE);
    print('Bearer ${AppHelper.AUTH_TOKEN_VALUE?.trim()}');
    final response = await http.get(Uri.parse(loginURL), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppHelper.AUTH_TOKEN_VALUE?.trim()}',
    });
    print(loginURL);
    print(response.body);
    var status = jsonDecode(response.body);
    print('heee${status['status']}');
    // if (status['status'].toString().toUpperCase() == 'SUCCESS' ||
    //     status['status'].toString().toUpperCase() == 'TRUE') {
    String data = response.body;
    return jsonDecode(data);
    // } else {
    //   return {
    //     "error": status['message'],
    //   };
    // }
  }

  Future datawithoutheader() async {
    final response = await http.get(Uri.parse(loginURL));
    print(loginURL);
    print(response.body);
    var status = jsonDecode(response.body);
    print('heee${status['status']}');
    if (status['status'].toString().toUpperCase() == 'SUCCESS' ||
        status['status'].toString().toUpperCase() == 'TRUE') {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return {
        "error": status['Message'],
      };
    }
  }

  Future postdatawithoutbody() async {
    print(loginURL);
    print(AppHelper.AUTH_TOKEN_VALUE);
    final response = await http.post(Uri.parse(loginURL), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppHelper.AUTH_TOKEN_VALUE}',
    });
    print(loginURL);
    print(response.body);
    var status = jsonDecode(response.body);
    print('heee${status['status']}');
    if (status['status'].toString().toUpperCase() == 'SUCCESS' ||
        status['status'].toString().toUpperCase() == 'TRUE') {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return {
        "error": status['message'],
      };
    }
  }
}

class ServicePOST {
  final Map<String, dynamic> body;
  final String loginURL;

  ServicePOST(this.loginURL, this.body);

  Future data() async {
    print(loginURL);
    print(jsonEncode(body));
    Response response = await post(Uri.parse(loginURL), body: jsonEncode(body));
    print(response.body);
    var status = jsonDecode(response.body);
    print('dasss$status');
    if (status['status'].toString().toUpperCase() == 'SUCCESS' ||
        status['status'].toString().toUpperCase() == 'TRUE') {
      String data = response.body;
      print(data);
      return jsonDecode(data);
    } else {
      return {
        "error": status['message'],
      };
    }
  }

  Future formdata() async {
    print(loginURL);
    print(jsonEncode(body));
    Response response = await post(Uri.parse(loginURL), body: (body), headers: {
      // 'Content-Type': 'application/json',
      // 'Accept': 'application/json',
      'Authorization': 'Bearer ${AppHelper.AUTH_TOKEN_VALUE?.trim()}',
    });
    print(response.body);
    var status = jsonDecode(response.body);
    print('dasss$status');
    if (status['status'].toString().toUpperCase() == 'SUCCESS' ||
        status['status'].toString().toUpperCase() == 'TRUE') {
      String data = response.body;
      print(data);
      return jsonDecode(data);
    } else {
      return {
        "error": status['message'],
      };
    }
  }
}

class ServiceWithoutbody {
  final String url;
  ServiceWithoutbody(this.url);
  Future data() async {
    final response = await http.get(
      Uri.parse(url),
      //  header('Content-type: application/json');
    );
    print(url);
    print(response.body);
    var status = jsonDecode(response.body);
    print('heee${status['status']}');

    if (status['status'].toString().toUpperCase() == 'SUCCESS' ||
        status['status'].toString().toUpperCase() == 'TRUE') {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return {
        "error": status['Message'],
      };
    }
  }

  Future dataoutputint() async {
    final response = await http.get(
      Uri.parse(url),
    );
    var status = jsonDecode(response.body);
    // print('heee' + status['Status'].toString());
    if (status['status'].toString().toUpperCase() == 'SUCCESS' ||
        status['status'].toString().toUpperCase() == 'TRUE') {
      var data = response.body;
      return jsonDecode(data);
    } else {
      return {
        "error": status['Message'],
      };
    }
  }
}
