import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/controller/address_controller.dart';
import 'package:mf_foodmart/screens/order_screen/order_screen.dart';
import 'package:mf_foodmart/screens/profile/componets/my_details_screen.dart';
import 'package:mf_foodmart/screens/profile/componets/profile_items.dart';
import 'package:mf_foodmart/screens/profile/componets/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);
final _addressController=Get.put(AddressController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
           ProfileWidget(),
          Expanded(
            child: ListView(
              children: [
                ProfileItems(
                  image: 'assets/icons/my_order.png',
                  title: "My Order",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderScreen()));
                  },
                ),
                ProfileItems(
                  image: 'assets/icons/my_details.png',
                  title: "My Details",
                  onTap: () async{
                    await Navigator.push(context, MaterialPageRoute(builder: (context)=>MyDetails()));
                  },
                ),
                ProfileItems(
                  image: 'assets/icons/delivery_status.png',
                  title: "Delivery Status",
                  onTap: () {
                  },
                ),
                ProfileItems(
                  isIcon: true,
                  icon: Icons.notifications_outlined,
                  title: "Notifications",
                  onTap: () {},
                ),
                ProfileItems(
                  isIcon: true,
                  icon: Icons.help_outline_outlined,
                  title: "Help",
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


