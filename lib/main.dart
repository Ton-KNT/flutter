import 'package:dbtestproject3it1/Categories/categories_car.dart';
import 'package:dbtestproject3it1/Categories/categories_truck.dart';
import 'package:dbtestproject3it1/Categories/categories_van.dart';
import 'package:dbtestproject3it1/Screen/home.dart';
import 'package:dbtestproject3it1/Screen/login.dart';
import 'package:dbtestproject3it1/Screen/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/authentication.dart';
import 'Screen/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value: Authentication(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'Wc',

        routes: {
          '/' : (context) => LoginScreen(),
          'home' : (context) => Home(),
          'sign_up' : (context) => SignupScreen(),
          'Wc' : (context) => WelcomeScreen(),
          'car' : (context) => CategoriesOfCars(),
          'van' : (context) => CategoriesOfVans(),
          'truck' : (context) => CategoriesOfTrucks(),
      },
      ),
    );
  }
}
