import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/view/home.dart';
import 'package:food_delivery_app/presentation/view/signup.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../provider/fire_auth.dart';
import '../../provider/location.dart';
import '../../utils/app_color.dart';
import '../common/bootom_nav.dart';
import '../common/customText.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
User? user = FirebaseAuth.instance.currentUser;

class LogIn extends StatefulWidget {
  //SignUp({});;
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _emailtextcontroller = TextEditingController();
  final TextEditingController _passwordtextcontroller = TextEditingController();
  final TextEditingController _usernametexteditcontroller =
      TextEditingController();
  final TextEditingController _userlocationtexteditcontroller =
      TextEditingController();
  int _success = 1;
  String _userEmail = "";

  void _singIn() async {
    final User? user = (await FireAuth.signInUsingEmailPassword(
      email: _emailtextcontroller.text,
      password: _passwordtextcontroller.text,
    ));

    if (user != null) {
      setState(() {
        _success = 2;
        _userEmail = user.email!;
        _usernametexteditcontroller.text = user.displayName!;

        //_userlocationtexteditcontroller.text =user.location!;
      });
    } else {
      setState(() {
        _success = 3;
      });
    }
  }

  String? id = user?.uid;
  //super.setState();}
  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;

    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          //height: size.height * 5,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill),
          ),

          //physics: NeverScrollableScrollPhysics(),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                height: 80.h,
                margin: EdgeInsets.only(
                    top: 8.h, bottom: 8.h, left: 5.w, right: 5.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 8,
                      blurRadius: 20,
                      offset: Offset(0, 3), // changes position of shadow
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 5.h, left: 9.w, right: 9.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Log In",
                            style: TextStyle(fontSize: 24.sp),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            children: [
                              Text(
                                " Haven't Account?",
                                style: TextStyle(
                                    fontSize: 13.sp, color: Colors.black54),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SignUp()));
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: AppColor.PrimaryColor),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          customNewText(
                            controller: _emailtextcontroller,
                            textwidth: 0.1.w,
                            lable: 'Email',
                            password: false,
                          ),
                          customNewText(
                            controller: _passwordtextcontroller,
                            textwidth: 0.1.w,
                            lable: 'password',
                            password: true,
                          ),
                          Spacer(),
                        ],
                      ),
                    )),
                    Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 9.w),
                        height: 10.h,
                        width: 100.w,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                        ),
                        child: Consumer<UpdateLocation>(
                            builder: (context, value, child) {
                          return TextButton(
                            onPressed: () {
                              print(value.getId);
                              print(id);

                              _singIn();
                              print(_success);
                              if (_success == 2) {
                                Provider.of<UpdateLocation>(context,
                                        listen: false)
                                    .addLocation();
                                print(value.y);
                                // Provider.of<UpdateLocation>(context, listen: false).addClear();
                                if ((value.getId == id)) {
                                  if (AppConstant.location.isNotEmpty &&
                                      AppConstant.name.isNotEmpty) {
                                    AppConstant.location = value.getLocation;
                                    AppConstant.name = value.getName;
                                    print("home");
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                      builder: (context) => BottomNavigation(),
                                    ));
                                  } else {
                                    AppConstant.location = value.getLocation;
                                    AppConstant.name = value.getName;
                                  }
                                } else {
                                  id = value.getId;
                                  AppConstant.name = " ";
                                  AppConstant.location = " ";
                                }
                              // } else {
                              //   print("error");
                              //   id = value.getId;
                              //   AppConstant.location = " ";
                              //   AppConstant.name = " ";

                                //  AppConstant.location = value.getLocation;
                                //  Provider.of<UpdateLocation>(context, listen: false).addClear();
                                //  if ((value.getId == user?.uid) ||
                                //      (value.getId == "")) {
                                //    Provider.of<UpdateLocation>(context,
                                //            listen: false)
                                //        .addLocation();
                                //    AppConstant.location = value.x;
                                //    AppConstant.name = value.y;
                                //  }
                              }
                            },
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.white),
                            ),
                            // color: Colors.black,
                          );
                        }))
                  ],
                )),
          ),
        ));
  }
}
