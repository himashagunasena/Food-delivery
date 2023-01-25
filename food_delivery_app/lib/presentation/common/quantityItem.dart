// ignore_for_file: file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app/model/data.dart';
import 'package:food_delivery_app/provider/price_increase.dart';
import 'package:food_delivery_app/provider/quantity.dart';
import 'package:food_delivery_app/utils/app_color.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../model/data.dart';

// ignore: camel_case_types
class ItemQuantity extends StatefulWidget {
  final Products products;
  ItemQuantity(this.products);
  @override
  State<ItemQuantity> createState() => _ItemQuantityState();
}

// ignore: camel_case_types
class _ItemQuantityState extends State<ItemQuantity> {
  bool _onpress = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<Quantity>(builder: (context, value, child) {
        return Row(
          children: [
            Text(
              "Quantity",
              style: TextStyle(fontSize: 16.sp, color: Colors.black87),
            ),
            Spacer(),
            MaterialButton(
              shape: CircleBorder(),
              color: value.getQuantity > 1
                  ? AppColor.PrimaryColor
                  : AppColor.titleColor,
              onPressed: () {
                setState(() {
                  Provider.of<Quantity>(context, listen: false).Decrease();
                  AppConstant.textEditingController =
                      (AppConstant.newPrice * value.getQuantity).toString();
                });
              },
              child: Text(
                "-",
                style: TextStyle(fontSize: 20.sp, color: Colors.white),
              ),
            ),
            Text(
              '${context.watch<Quantity>().quantity}',
              style: TextStyle(fontSize: 18.sp),
            ),
            MaterialButton(
              shape: CircleBorder(),
              color: AppColor.PrimaryColor,
              onPressed: () {
                setState(() {
                  Provider.of<Quantity>(context, listen: false).Increase();
                  if (AppConstant.textEditingController ==
                      widget.products.price.toString()) {
                    //   AppConstant.textEditingController=(widget.products.price*value.getQuantity).toString();
                    // }
                    AppConstant.newPrice = widget.products.price;
                  } else {
                    AppConstant.newPrice = AppConstant.newPrice;
                    print(AppConstant.newPrice);
                  }

                  // if (AppConstant.isCardEnabled.isNotEmpty){
                  //   AppConstant.newPrice=AppConstant.newPrice*value.getQuantity;
                  //   AppConstant.textEditingController=(AppConstant.newPrice).toString();
                  //   print(widget.products.price);
                  // }
                  // else{
                  // print(value.getQuantity);}
                  AppConstant.textEditingController =
                      (AppConstant.newPrice * value.getQuantity).toString();
                });
              },
              child: Text(
                "+",
                style: TextStyle(fontSize: 20.sp, color: Colors.white),
              ),
            ),
          ],
        );
      }),
    );
  }
}
