import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mf_foodmart/database_helper/delivery_address_database/delivery_address_database.dart';
import 'package:mf_foodmart/database_helper/profile_database/profile_databae.dart';
import 'package:mf_foodmart/screens/order_screen/order_screen.dart';
import 'package:mf_foodmart/screens/profile/componets/delivery_status.dart';
import 'package:mf_foodmart/screens/profile/componets/my_details_screen.dart';
import 'package:mf_foodmart/screens/profile/componets/profile_items.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
        child: Column(
      children: [
        Stack(
          children: [
            Container(
              height: 200,
              width: size.width,
              color: const Color(0xffFFFFF3),
            ),

            Positioned(
              top: 30,
              left: 20,
              child: TextWidget(text: 'Profile'),
            ),
            Positioned(
                top: 18,
                right: 10,
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: const Icon(Icons.close))),
            Positioned(
              right: 50,
              left: 50,
              top: 60,
              child: SizedBox(
                height: 100,
                width: 100,
                child: FutureBuilder<String?>(
                  future: ProfileDatabase.instance.getProfileImagePath(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData && snapshot.data != null) {
                      return CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(File(snapshot.data!)),
                      );
                    } else {
                      return const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/banner.png'),
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Positioned(
              bottom: 15,
              left: 25,
              right: 25,
              child: FutureBuilder(
                  future: DeliveryAddressDatabase.instance.getAddresses(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                          children: List.generate(
                        snapshot.data!.length,
                        (index) => TextWidget(
                          text:
                              "${snapshot.data![index].firstName} ${snapshot.data![index].lastName} ",
                          color: MyAppColor.btnColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ));
                    } else {
                      return TextWidget(
                          text: 'MF FOOD MART',
                          color: MyAppColor.btnColor,
                          fontWeight: FontWeight.bold);
                    }
                  }),
            ),
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              ProfileItems(
                image: 'assets/icons/my_order.png',
                title: "My Order",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrderScreen()));
                },
              ),
              ProfileItems(
                image: 'assets/icons/my_details.png',
                title: "My Details",
                onTap: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyDetails()));
                },
              ),
              ProfileItems(
                image: 'assets/icons/delivery_status.png',
                title: "Delivery Status",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveryStatus()));
                },
              ),
              ProfileItems(
                isIcon: true,
                icon: Icons.notifications_outlined,
                title: "Notifications",
                onTap: () {
                  Fluttertoast.showToast(msg: 'No offers this week');
                },
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
    ));
  }
}
