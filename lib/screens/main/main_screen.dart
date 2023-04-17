import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mf_foodmart/screens/cart_screen/cart_screen.dart';
import 'package:mf_foodmart/screens/favourite/favourite_screen.dart';
import 'package:mf_foodmart/screens/home/home_screen.dart';
import 'package:mf_foodmart/screens/profile/profile_screen.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/drawer/custom_drawer.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  final pages = [
    const HomeScreen(),
     FavouriteScreen(),
     CartScreen(),
     ProfileScreen(),
  ];

  bool isConnected = true;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  void _onItemTapped(value){
    setState(() {
      pageIndex=value;
    });
  }

  @override
  void initState() {
    super.initState();
    checkConnectivity();
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
          if (result == ConnectivityResult.none) {
            setState(() {
              isConnected = false;
            });
          } else {
            setState(() {
              isConnected = true;
            });
          }
        });
  }

  Future<void> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isConnected = false;
      });
    } else {
      setState(() {
        isConnected = true;
      });
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyAppColor.bgColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: MyAppColor.iconColor
        ),
        elevation: 0,
        title:Image.asset("assets/images/logo.png",width: 140,),
        centerTitle: true,
        backgroundColor: MyAppColor.bgColor,
        actions: [
          IconButton(
              onPressed: () {
                Fluttertoast.showToast(msg: 'No offers this week');
              }, icon: const Icon(Icons.notifications,color: MyAppColor.iconColor,),),
        ],
      ),
      drawer: CustomDrawer(),
      bottomNavigationBar: customNavigationBar(),

      body: isConnected ? pages[pageIndex] : noInternetContent(),
      // pages[pageIndex],
    );
  }

  Widget customNavigationBar(){
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
      currentIndex: pageIndex,
      selectedItemColor: MyAppColor.btnColor,
      showUnselectedLabels: true,
      unselectedItemColor: MyAppColor.iconColor,
      onTap: _onItemTapped,
    );
  }

  Widget noInternetContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.signal_wifi_off,
            size: 48,
            color: MyAppColor.iconColor,
          ),
          const SizedBox(height: 16),
          const Text(
            "No Internet Connection",
            style: TextStyle(
              color: MyAppColor.textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () async {
              var connectivityResult = await Connectivity().checkConnectivity();
              if (connectivityResult != ConnectivityResult.none) {
                setState(() {
                  isConnected = true;
                });
              } else {
                Fluttertoast.showToast(msg: 'No internet connection');
              }
            },
            style: ElevatedButton.styleFrom(
              primary: MyAppColor.btnColor,
              onPrimary: MyAppColor.textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                "Retry",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

