
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/data.dart';
import 'package:food_delivery_app/presentation/view/home.dart';
import 'package:food_delivery_app/presentation/view/login.dart';
import 'package:food_delivery_app/presentation/view/signup.dart';
import 'package:food_delivery_app/provider/filter.dart';
import 'package:food_delivery_app/provider/location.dart';
import 'package:food_delivery_app/provider/price_increase.dart';
import 'package:food_delivery_app/provider/quantity.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
User? user = FirebaseAuth.instance.currentUser;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PriceIncrease()),
    ChangeNotifierProvider(create: (ctr) => Quantity()),
    ChangeNotifierProvider(create: (ctr) => FilterItem()),
    ChangeNotifierProvider(create: (ctr) => UpdateLocation()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            ),
        home: LogIn(),
      );
    });
  }
}
