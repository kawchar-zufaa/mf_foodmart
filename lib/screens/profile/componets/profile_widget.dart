import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/controller/address_controller.dart';
import 'package:mf_foodmart/database_helper/delivery_address_database/delivery_address_database.dart';
import 'package:mf_foodmart/database_helper/profile_database/profile_databae.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({
    super.key,
  });
  final _addressController = Get.put(AddressController());
  @override
  Widget build(BuildContext context) {
    _addressController.getAddressList();
    final size = MediaQuery.of(context).size;
    return Container(
      height: 200,
      width: size.width,
      color: const Color(0xffFFFFF3),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 120,
            width: 120,
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
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
              future: DeliveryAddressDatabase.instance.getAddresses(),
              builder: (context,snapshot){
            if(snapshot.hasData){
              return Column(
                  children: List.generate(
                    _addressController.addressList.length,
                        (index) => TextWidget(
                      text:
                      "${snapshot.data![index].firstName} ${snapshot.data![index].lastName}",
                      color: MyAppColor.btnColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ));
            }else{
              return TextWidget(
                  text: 'MF FOOD MART',
                  color: MyAppColor.btnColor,
                  fontWeight: FontWeight.bold);
            }
          }),
          // Column(
          //     children: List.generate(
          //   _addressController.addressList.length,
          //   (index) => _addressController.addressList.isEmpty
          //       ? TextWidget(
          //           text: 'MF FOOD MART',
          //           color: MyAppColor.btnColor,
          //           fontWeight: FontWeight.bold)
          //       : TextWidget(
          //           text:
          //               "${_addressController.addressList[index].firstName} ${_addressController.addressList[index].lastName}",
          //           color: MyAppColor.btnColor,
          //           fontWeight: FontWeight.bold,
          //         ),
          // )),
        ],
      ),
    );
  }
}
