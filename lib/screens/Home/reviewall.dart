import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supersonicapp/model/getproductlistdatamodel.dart';
import 'package:supersonicapp/page_routes/routes.dart';
import 'package:supersonicapp/utils/appstringfile.dart';
import 'package:supersonicapp/utils/appstyle.dart';
import 'package:supersonicapp/utils/title_text_style.dart';
import 'package:intl/intl.dart';

class ReviewAllScreenActivity extends StatefulWidget {
  List<ProductReview>? productReview;
  final String productid;
  ReviewAllScreenActivity({
    super.key,
    this.productReview,
    required this.productid,
  });

  @override
  State<ReviewAllScreenActivity> createState() =>
      _ReviewAllScreenActivityState();
}

class _ReviewAllScreenActivityState extends State<ReviewAllScreenActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TitleTextStyle(
          text: "All Review ",
          style: AppStyle.cardtitle.copyWith(fontSize: 20.sp),
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.reviewproduct, arguments: {
                  AppStringFile.productid: widget.productid,
                }).then((value) {
                  Navigator.pop(context);
                });
              },
              child: Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: widget.productReview!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10.w,
                          height: 10.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(widget
                                      .productReview![index].userimg
                                      .toString()))),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleTextStyle(
                              text: widget.productReview![index].name!,
                              style: AppStyle.cardtitle,
                            ),
                            TitleTextStyle(
                              text: DateFormat('yyyy-MM-dd').format(
                                DateTime.parse(
                                  widget.productReview![index].updatedAt
                                      .toString(),
                                ),
                              ),
                              style: AppStyle.cardtitle
                                  .copyWith(color: Colors.grey),
                            ),
                            RatingBar.builder(
                              initialRating:
                                  widget.productReview![index].rating!,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 15,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    TitleTextStyle(
                      text: widget.productReview![index].review.toString(),
                      style: AppStyle.cardtitle.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
