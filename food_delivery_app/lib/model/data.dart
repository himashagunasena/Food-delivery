import 'package:food_delivery_app/presentation/common/popular.dart';

class Data{
  static List<Popular> productitem =[ Popular(
    image: "assets/images/pasta.png",
    name: "Cheese Pasta",
    place: "Bistro, Badulla",
    review: "4.9",
    time: "15 min",
    price: "Rs.300.00", index: 0,),
    Popular(
      image: "assets/images/pizza.png",
      name: "Devilled Pizza",
      place: "Pizza Hut",
      review: "3.6",
      time: "15 min",
      price: "Rs.1100.00", index: 1,),
    Popular(
      image: "assets/images/burger.png",
      name: "Burger",
      place: "Cafe Montage, Badulla",
      review: "4.8",
      time: "30 min",
      price: "Rs.450.00", index: 3,),
  ];
}