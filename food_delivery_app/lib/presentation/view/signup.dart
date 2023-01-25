

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/view/location.dart';
import 'package:food_delivery_app/presentation/view/login.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';
import '../../main.dart';
import '../../model/userData.dart';
import '../../provider/fire_auth.dart';
import '../../utils/app_color.dart';
import '../common/customText.dart';

//User? user = FirebaseAuth.instance.currentUser;
final FirebaseFirestore auth =
    FirebaseFirestore.instance.collection('City') as FirebaseFirestore;

class SignUp extends StatefulWidget {
  //SignUp({});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _usernametexteditcontroller =
      TextEditingController();
  final TextEditingController _userlocationtexteditcontroller =
      TextEditingController();
  final TextEditingController _emailtexteditcontroller =
      TextEditingController();
  final TextEditingController _passwordtexteditcontroller =
      TextEditingController();
  bool _success = false;
  late String _userEmail;
  late String _name;
  late String _location;


  void _register() async {
   // String? myUid = user.;

  //  var myUser=UserData().obs;
  final User? user = (await FireAuth.registerUsingEmailPassword(

      email: _emailtexteditcontroller.text,
      password: _passwordtexteditcontroller.text,
      name: _usernametexteditcontroller.text,
      id:FirebaseAuth.instance.currentUser?.uid,

    ).then((value) {
      print(value?.uid);
      FirebaseFirestore.instance
          .collection("City")
          .add({
        "location": _userlocationtexteditcontroller.text,
        "id":value?.uid,
        "name": _usernametexteditcontroller.text,
      });
      return value;
    }
    ));
    if (user != null) {
      setState(() async {
        print(user.uid);
        _success = true;
        _userEmail = user.email!;
        _name = user.displayName!;
        _location=UserData().location;
      }
      );} else {
      setState(() {
        _success = false;
       // print(user!.uid);
      });
    }
  }

  //super.setState();}
  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;

    return Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   //scrolledUnderElevation: 2,
        //
        // ),
        //bottomNavigationBar: BottomNavigation(index: 1,),

        // list of images for scrolling
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
                height: 100.h,
                margin: EdgeInsets.only(
                    top: 6.h, bottom: 8.h, left: 5.w, right: 5.w),
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
                            "Registration",
                            style: TextStyle(fontSize: 24.sp),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            children: [
                              Text(
                                "Already have account ?",
                                style: TextStyle(
                                    fontSize: 13.sp, color: Colors.black54),
                              ),
                              TextButton(
                                onPressed: () async {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => LogIn()));
                                },
                                child: Text(
                                  "Log in",
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
                            controller: _usernametexteditcontroller,
                            textwidth: 0.1.w,
                            lable: 'User Name',
                            password: false,
                          ),
                          customNewText(
                            controller: _emailtexteditcontroller,
                            textwidth: 0.1.w,
                            lable: 'Email',
                            password: false,
                          ),
                          customNewText(
                            controller: _userlocationtexteditcontroller,
                            textwidth: 0.1.w,
                            lable: 'Location',
                            password: false,
                          ),
                          customNewText(
                            controller: _passwordtexteditcontroller,
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
                        child: TextButton(

                          onPressed: () async {
                            // try {
                            // } on FirebaseAuthException catch (e) {
                            //   if (e.code == 'weak-password') {
                            //     print('weak-password');
                            //   } else if (e.code == 'email-already-in-use') {
                            //     print('mail-already-in-use');
                            //   } else if (e.code == 'user-not-found') {
                            //     print('user-not-found');
                            //   } else if (e.code == 'wrong-password') {
                            //     print('wrong-password');
                            //   }
                            //   print('x');
                            // } catch (e) {
                            //   print(e);
                            // }
                            _register();
                            if (_success == true) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LogIn()));
                            } else {
                              print("error");
                              print(_userlocationtexteditcontroller.text);
                            }
                          },
                          child: Text(
                            "Sign Up",
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.white),
                          ),
                          // color: Colors.black,
                        ))
                  ],
                )),
          ),
        ));
  }
}

