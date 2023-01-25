import 'package:change_notifier/change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/provider/filter.dart';
import 'package:food_delivery_app/provider/price_increase.dart';
import 'package:food_delivery_app/provider/quantity.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:change_notifier/change_notifier.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import '../../model/data.dart';
import '../../utils/app_color.dart';
import '../../utils/app_constant.dart';

import 'category_title.dart';

class FavourBtn extends StatefulWidget {
  @override
  final Products products;
  late double totalval;
  FavourBtn({Key? key, required this.products, this.totalval = 0})
      : super(key: key);

  @override
  _FavourBtnState createState() => _FavourBtnState();
}

class _FavourBtnState extends State<FavourBtn> {
  late double x;

  @override
  void total() {
    setState(() {
      // AppConstant.textEditingController=(widget.products.price +
      //     AppConstant.lasthighprice).toString();
    });
  }

  @override
  void initState() {
    AppConstant.isCardEnabled = [];
    //AppConstant.lasthighprice=0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 1.5.h),
        height: 20.h,
        width: 100.w,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            //physics: const NeverScrollableScrollPhysics(),

            //padding: const EdgeInsets.all(6),

            itemCount: widget.products.ingbtn.length,
            itemBuilder: (BuildContext context, int index) {
              AppConstant.isCardEnabled
                  .add(widget.products.ingbtn[index].select);
              return Consumer3<PriceIncrease, Quantity, FilterItem>(
                  builder: (context, value, val, v, child) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          AppConstant.isCardEnabled[index] =
                              !AppConstant.isCardEnabled[index];
                          // setState(() {
                          if (AppConstant.textEditingController == "") {
                            AppConstant.textEditingController = "";
                            AppConstant.newPrice =
                                (Data.productitem[index].price);
                            AppConstant.textEditingController =
                                (AppConstant.newPrice * val.getQuantity)
                                    .toString();
                          } else {
                            if (AppConstant.isCardEnabled[index] == true) {
                              Provider.of<PriceIncrease>(context, listen: false)
                                  .increaseCounter(
                                      product: widget.products, i: index);
                              AppConstant.newPrice = (value.getCounter);
                              AppConstant.textEditingController =
                                  (AppConstant.newPrice * val.getQuantity)
                                      .toString();
                              print(AppConstant.newPrice);
                              //print(val.getQuantity);
                            } else if (AppConstant.isCardEnabled[index] ==
                                false) {
                              Provider.of<PriceIncrease>(context, listen: false)
                                  .decreaseCounter(
                                      product: widget.products, i: index);
                              AppConstant.newPrice = (value.getCounter);
                              AppConstant.textEditingController =
                                  (AppConstant.newPrice * val.getQuantity)
                                      .toString();
                              print(widget.products.price);
                            }
                            // else{
                            //   AppConstant.newPrice=widget.products.price*val.getQuantity;
                            //      AppConstant.textEditingController=(AppConstant.newPrice).toString();
                            //    }
                            // print("lastlow" + AppConstant.lasthighprice);
                          }
                          //     }
                          // if (v.getIndex.length!=Data.productitem.length) {
                          //   if (AppConstant.textEditingController == "") {
                          //     AppConstant.textEditingController = "";
                          //     AppConstant.newPrice =
                          //     (Data.productitem[index].price);
                          //     AppConstant.textEditingController =
                          //         (AppConstant.newPrice * val.getQuantity)
                          //             .toString();
                          //   }
                          //   int i = Data.productitem[index].index;
                          //   AppConstant.newPrice =  widget.products.price;
                          //
                          //   print(v.getIndex);
                          //   //AppConstant.newPrice=0;
                          //
                          //     if (AppConstant.isCardEnabled[index] == true) {
                          //     Provider.of<PriceIncrease>(context, listen: false)
                          //         .increaseCounter(
                          //     product: widget.products, i: index);
                          //     AppConstant.newPrice =
                          //     (
                          //        value.getCounter);
                          //     AppConstant.textEditingController =
                          //     (AppConstant.newPrice * val.getQuantity)
                          //         .toString();
                          //     print(AppConstant.newPrice.toString()+"m");
                          //     } if (AppConstant.isCardEnabled[index] ==
                          //     false) {
                          //     Provider.of<PriceIncrease>(context, listen: false)
                          //         .decreaseCounter(
                          //     product: widget.products, i: index);
                          //     AppConstant.newPrice =
                          //     (AppConstant.newPrice);
                          //     AppConstant.textEditingController =
                          //     (AppConstant.newPrice * val.getQuantity)
                          //         .toString();
                          //     print(AppConstant.newPrice.toString()+"p");
                          //     }
                          //     }
                          //  total();
                          //});
                        },
                        child: Column(
                          children: [
                            SizedBox(
                                width: 25.w,
                                //height: 11.h,
                                child: Card(
                                  elevation:
                                      AppConstant.isCardEnabled[index] ? 0 : 20,
                                  color: AppConstant.isCardEnabled[index]
                                      ? AppColor.PrimaryColor
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 10.h,
                                    width: 15.w,
                                    child: Transform.scale(
                                        scale: 0.6,
                                        child: Image.asset(widget
                                            .products.ingbtn[index].image)),
                                  ),
                                )),
                            // SizedBox(height: 1.h,),

                            // SizedBox(height: 1.h,),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Center(
                        child: Text(
                          "Rs." +
                              widget.products.ingbtn[index].price.toString() +
                              "0",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12.sp),
                        ),
                      ),
                    ],
                  ),
                );
              });
            }));
  }
}
