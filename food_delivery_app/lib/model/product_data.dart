import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Product {
  static const NAME = "name";
  static const IMAGE = "image";
  static const PLACE = "place";
  static const REVIEW = "review";
  static const TIME = "time";
  static const PRICE = "price";
  static const INDEX = "index";

  late String _name;
  late Image _image;
  late String _place;
  late double _review;
  late String _time;
  late double _price;
  late int _index;

  String get name => _name;
  String get place => _place;
  String get time => _time;
  double get price => _price;
  double get review => _review;
  Image get image => _image;
  int get index => _index;

  Product.fromSnapshot(DocumentSnapshot snapshot){
  Map data = snapshot.data as Map;
  _name = data[NAME];
  _price = data[PRICE];
  _place = data[PLACE];
  _review = data[REVIEW];
  _time = data[TIME];
  _image = data[IMAGE];
  _index = data[INDEX];

  }
  }


