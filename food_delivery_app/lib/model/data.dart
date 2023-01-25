import 'package:food_delivery_app/presentation/common/popular.dart';

class Data {
  static List<Products> productitem = [
    Products(
      image: "assets/images/pasta.png",
      name: "Cheese Pasta",
      place: "Bistro, Badulla",
      review: 4.9,
      time: "15 min",
      price: 300.00,
      index: 0,
      category: 4,
      description:
          'cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccCheese pasta is most popular food in Bistro resturent. Customers can added their choices ingredients ',
      imagebg: 'assets/images/pasta-bg.png',
      ing: ["Onion", "Cheese", "Pasta", "Vegetable"],
      ingbtn: [
        Ingrediant(image: "assets/icons/chicken.png", price: 500.00),
        Ingrediant(image: "assets/icons/cheese.png", price: 300.00),
        Ingrediant(image: "assets/icons/mushroom.png", price: 100.00),
        Ingrediant(image: "assets/icons/shrimp.png", price: 500.00),
        Ingrediant(image: "assets/icons/beef.png", price: 500.00),
      ],
    ),
    Products(
      image: "assets/images/pizza.png",
      name: "Devilled Pizza",
      place: "Pizza Hut",
      review: 3.8,
      time: "15 min",
      price: 1100.00,
      index: 1,
      category: 2,
      description:
          'That pizza include with the chicken devilled or prawns deviled or beef devilled. Customer can choose their flavour inbelow.',
      imagebg: 'assets/images/pizza-bg.png',
      ing: ["Onion", "Cheese", "Tomato Sauce", "Dough", "Bell-Pepper"],
      ingbtn: [
        Ingrediant(image: "assets/icons/chicken.png", price: 500.00),
        Ingrediant(image: "assets/icons/cheese.png", price: 200.00),
        Ingrediant(image: "assets/icons/mushroom.png", price: 100.00),
        Ingrediant(image: "assets/icons/shrimp.png", price: 300.00),
        Ingrediant(image: "assets/icons/beef.png", price: 500.00),
      ],
    ),
    Products(
      image: "assets/images/burger.png",
      name: "Burger",
      place: "Cafe Montage, Badulla",
      review: 4.5,
      time: "30 min",
      price: 800.00,
      index: 3,
      category: 4,
      description:
          'Our cafe has different kind of pizza. you can select small, large portion with selected ingredients.',
      imagebg: 'assets/images/burger-bg.png',
      ing: ["Tomato", "Cheese", "Cucumber", "Chips"],
      ingbtn: [
        Ingrediant(image: "assets/icons/chicken.png", price: 650.00),
        Ingrediant(image: "assets/icons/beef.png", price: 700.00),

      ],
    ),

    Products(
      image: "assets/images/biryani.png",
      name: "Britzza",
      place: "Pizza Hut",
      review: 2.0,
      time: "15 min",
      price: 500.00,
      index: 4,
      category: 5,
      description:
      ' New arrival biriyani of Pizza hut. There has two types of biriyani. Additionally we give grave with them ',
      imagebg: 'assets/images/biryani-bg.png',
      ing: ["Onion", "Vegetable"],
      ingbtn: [
        Ingrediant(image: "assets/icons/chicken.png", price: 500.00),
        Ingrediant(image: "assets/icons/mushroom.png", price: 500.00),

      ],
    ),
  ];
}

class Products {
  late final String image;
  late final String imagebg;
  late final String name;
  late final List<String> ing;
  late final List<Ingrediant> ingbtn;
  late final String description;
  late final String place;
  late final double review;
  late final String time;
  late final double price;
  late final int index;
  late final int category;
  late bool select;

  Products(
      {required this.image,
      required this.imagebg,
      required this.ing,
      required this.ingbtn,
      required this.description,
      required this.name,
      required this.place,
      required this.review,
      required this.time,
      required this.price,
      required this.index,
      required this.category,
      this.select = false});
}

class Category {
  static List<CategoryItem> categoryItem = [
    CategoryItem(
        image: "assets/icons/all.png", name: "All", category: 1, select: true),
    CategoryItem(
        image: "assets/icons/pizza 3.png",
        name: "Pizza",
        category: 2,
        select: false),
    CategoryItem(
        image: "assets/icons/drink.png",
        name: "Drinks",
        category: 3,
        select: false),
    CategoryItem(
        image: "assets/icons/fast.png",
        name: "Fast Food",
        category: 4,
        select: false),
    CategoryItem(
        image: "assets/icons/asian.png",
        name: "Asian",
        category: 5,
        select: false),
  ];
}

class CategoryItem {
  late final String image;
  late final String name;
  late final int category;
  late bool select;

  CategoryItem(
      {required this.image,
      required this.name,
      required this.category,
      this.select = false});
}

class Ingrediant {
  late final String image;
  late final double price;

  late bool select;

  Ingrediant({required this.image, required this.price, this.select = false});
}

