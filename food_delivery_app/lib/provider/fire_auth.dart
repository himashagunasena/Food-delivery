
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/presentation/common/name.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:get/get.dart';

import '../model/userData.dart';

class FireAuth {

  var myuser=UserData().obs;
  
  getUserInfo(){
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('City').doc(uid).snapshots().listen((event) {
      myuser.value= UserData.fromJson(event.data()!);
    });
  }
  // static Future<FirebaseApp> initializeFirebase( { BuildContext? context,})
  //  async{
  //   FirebaseApp firebaseApp = await Firebase.initializeApp();
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     Navigator.pushReplacement(context!, MaterialPageRoute(builder: (BuildContext context) => Name(
  //           user: user,
  //         ),
  //       ),
  //     );
  //   }
  //   return firebaseApp;
  // }
  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
     BuildContext? context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,

      );
      user = userCredential.user;
    }on PlatformException catch (err) {
      print(err);
    }
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     print('No user found for that email.');
    //   } else if (e.code == 'wrong-password') {
    //     print('Wrong password provided.');
    //   }
    //
    // }

    return user;
  }
  static Future<User?> registerUsingEmailPassword({
    required String name,
    //required String location,
    required String email,
    required String password, required id,
  }
  ) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,

      );
      user = userCredential.user;
      await user!.updateProfile(displayName: name);
     // await user!.location!;
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }
}
