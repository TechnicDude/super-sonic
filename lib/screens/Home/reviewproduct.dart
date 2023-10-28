import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supersonicapp/api/productapi.dart';
import 'package:supersonicapp/utils/appcolors.dart';
import 'package:supersonicapp/utils/apphelper.dart';
import 'package:supersonicapp/utils/appstyle.dart';
import 'package:supersonicapp/utils/dialoghelper.dart';
import 'package:supersonicapp/utils/textform.dart';
import 'package:supersonicapp/utils/title_text_style.dart';
import 'package:supersonicapp/utils/viewbutton.dart';
import 'package:supersonicapp/utils/widgets/extentions.dart';

class ReviewProductScreenActivity extends StatefulWidget {
  final String productid;
  const ReviewProductScreenActivity({
    super.key,
    required this.productid,
  });

  @override
  State<ReviewProductScreenActivity> createState() =>
      _ReviewProductScreenActivityState();
}

class _ReviewProductScreenActivityState
    extends State<ReviewProductScreenActivity> {
  double apprating = 0.0;
  TextEditingController reviewcontroller = TextEditingController();

  Future addreview() async {
    if (reviewcontroller.text.isNotEmpty) {

      var body = {
        "product_id": widget.productid,
        "user_id": AppHelper.userid,
        "name": AppHelper.userInfo!.name,
        "email": AppHelper.userInfo!.email,
        "rating": apprating,
        "review": reviewcontroller.text,
      };

      ProductApi productApi = ProductApi(body);
      final response = await productApi.reviewadd();

      if (response['status'].toString().toLowerCase() == "success") {
        DialogHelper.showFlutterToast(strMsg: response['msg']);
        Navigator.pop(context);
      }

    } else {
      DialogHelper.showFlutterToast(strMsg: "Please Enter review");
    }

  }

  Widget _appBar() {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
            size: 15,
            padding: 12,
            isOutLine: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(
            width: 100.w - 80,
            child: Center(
              child: TitleTextStyle(
                textAlign: TextAlign.center,
                maxline: 2,
                text: "Review Product",
                style: AppStyle.texttitlemain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _icon(
    IconData icon, {
    Color color = AppColors.iconColor,
    double size = 20,
    double padding = 10,
    bool isOutLine = false,
    Function? onPressed,
  }) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(padding),
      // margin: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.iconColor,
            style: isOutLine ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color:
            isOutLine ? Colors.transparent : Theme.of(context).backgroundColor,
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Color(0xfff8f8f8),
              blurRadius: 5,
              spreadRadius: 10,
              offset: Offset(5, 5)),
        ],
      ),
      child: Icon(icon, color: color, size: size),
    ).ripple(() {
      if (onPressed != null) {
        onPressed();
      }
    }, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          _appBar(),
          _productreview(),
        ],
      )),
    );
  }

  Widget _productreview() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          Center(
            child: RatingBar.builder(
              initialRating: apprating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 40,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
                setState(() {
                  apprating = rating;
                });
              },
            ),
          ),
          
          SizedBox(
            height: 2.h,
          ),

          Text(
            "Write your Review",
            style: AppStyle.cardtitle,
          ),
          SizedBox(
            height: 2.h,
          ),
         
          TextFormField(
            controller: reviewcontroller,
            minLines: 4,
            maxLines: 10,
            cursorColor: AppColors.primarycolor,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintStyle: TextStyle(fontSize: 14.sp, fontFamily: 'Roboto'),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),

              // color: AppColors.appPrimarycolor,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Center(
            child: SizedBox(
              width: 90.w,
              child: ViewButtonWidget(
                height: 4.h,
                onTap: () {
                  addreview();
                },
                boxcolor: AppColors.primarycolor,
                text: "Submit Review",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
