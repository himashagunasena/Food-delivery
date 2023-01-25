//
// import 'package:flutter/material.dart';
//import 'package:firebase_database/firebase_database.dart';

class UserData{
  String? name;
  var location;
  List? favourite;
  var email;
  var id;

  UserData.fromJson(Map<String,dynamic>json){
    id=json['id'];
    name=json['name'];
    location=json['location'];
    favourite=json['favourite'];
  }

  UserData({
    this.location,
    this.name,
    this.email,
    this.id,
    this.favourite,
  });

  //User.fromSnapshot(DataSnapshot snapshot){

   // id = snapshot.key;

    //email = snapshot.value!['email'] ?? 'email';

  //}
}