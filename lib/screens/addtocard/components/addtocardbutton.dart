import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supersonicapp/utils/appcolors.dart';
import 'package:supersonicapp/utils/appstyle.dart';
import 'package:supersonicapp/utils/title_text_style.dart';

class AddtoCardquantitytiyScreenActivity extends StatefulWidget {
  final Function callback;
  final String quantity;
  const AddtoCardquantitytiyScreenActivity({
    super.key,
    required this.callback,
    required this.quantity,
  });

  @override
  State<AddtoCardquantitytiyScreenActivity> createState() =>
      _AddtoCardquantitytiyScreenActivityState();
}

class _AddtoCardquantitytiyScreenActivityState
    extends State<AddtoCardquantitytiyScreenActivity> {
  int quntity = 0;
  @override
  void initState() {
    // TODO: implement initState
    quntity = int.parse(widget.quantity);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleTextStyle(
          text: "Quantity :",
          style: AppStyle.cardssubtitle
              .copyWith(fontSize: 14.sp, color: AppColors.grey),
        ),
        SizedBox(
          width: 2.w,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 2.0,
                ),
              ]),
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      if (quntity > 1) {
                        quntity--;
                      }
                    });
                    widget.callback(quntity);
                  },
                  child: Icon(Icons.remove)),
              SizedBox(
                width: 2.w,
              ),
              Text(quntity.toString()),
              SizedBox(
                width: 2.w,
              ),
              InkWell(
                  onTap: () {
                    print("object");
                    setState(() {
                      quntity++;
                    });
                    widget.callback(quntity);
                  },
                  child: Icon(Icons.add)),
            ],
          ),
        ),
      ],
    );
  }
}
