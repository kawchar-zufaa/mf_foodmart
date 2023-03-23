import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mf_foodmart/screens/cart_screen/cart_screen.dart';
import 'package:mf_foodmart/screens/home/home_screen.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  final pages = [
    HomeScreen(),
    const Text("Second Screen"),
     CartScreen(),
    const Text("profile Screen")
  ];


  void _onItemTapped(value){
    setState(() {
      pageIndex=value;
    });
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
              onPressed: () {}, icon: const Icon(Icons.notifications,color: MyAppColor.iconColor,),),
        ],
      ),
      drawer: Container(),
      bottomNavigationBar: customNavigationBar(),

      body: pages[pageIndex],
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


}