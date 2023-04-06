import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/screens/delivery_address/address_list_screen.dart';
import 'package:mf_foodmart/screens/details/details_screen.dart';
import 'package:mf_foodmart/screens/home/home_screen.dart';
import 'package:mf_foodmart/screens/main/main_screen.dart';
import 'package:mf_foodmart/screens/products/view_all_products.dart';
import 'package:mf_foodmart/test_screen.dart';

void main(){

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        primarySwatch: Colors.green,
      ),
      home: MainScreen(),
    );
  }
}
