import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/main.dart';

class UpdateLocation extends ChangeNotifier{

  late String x = "";
  late String y = "";
  late String? z = FirebaseAuth.instance.currentUser?.uid;
  String get getLocation => x;
  String get getName => y;
  String? get getId => z;

  void addLocation() {

    FirebaseFirestore.instance
        .collection("City")
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      for (var doc in value.docs) {
        x = doc.data()["location"];
        y=doc.data()["name"];
        z=doc.data()["id"];
      }
    });
    notifyListeners();
  }

  void addClear() {

    FirebaseFirestore.instance
        .collection("City")
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      for (var doc in value.docs) {
        x = " ";
        y = " ";
        //z = " ";
      }
    });
    notifyListeners();
  }

}