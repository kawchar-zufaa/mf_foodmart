import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mf_foodmart/controller/address_controller.dart';
import 'package:mf_foodmart/database_helper/profile_database/profile_databae.dart';
import 'package:mf_foodmart/screens/delivery_address/address_screen.dart';
import 'package:mf_foodmart/screens/profile/componets/address_widget.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class MyDetails extends StatefulWidget {
  @override
  _MyDetailsState createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
  String? _imagePath;

  Future<void> _selectAndStoreImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Get the app's document directory
      final appDocumentsDirectory = await getApplicationDocumentsDirectory();
      final imageFileName = basename(pickedFile.path);
      final savedImagePath = join(appDocumentsDirectory.path, imageFileName);

      await File(pickedFile.path).copy(savedImagePath);

      String? profileImagePath =
          await ProfileDatabase.instance.getProfileImagePath();

      if (profileImagePath != null) {
        await ProfileDatabase.instance.updateProfileImagePath(savedImagePath);
      } else {
        await ProfileDatabase.instance.insertProfileImage(savedImagePath);
      }

      setState(() {
        _imagePath = savedImagePath;
      });
    }
  }

  final _addressController=Get.put(AddressController());

  // List<AddressModel> _address = [];

  @override
  void initState() {
    super.initState();
   _addressController.getAddressList();
    _loadProfileImage();
  }

  // void _loadAddresses() async {
  //   final addresses = await DeliveryAddressDatabase.instance.getAddresses();
  //   setState(() {
  //     _address = addresses;
  //   });
  // }

  Future<void> _loadProfileImage() async {
    final imagePath = await ProfileDatabase.instance.getProfileImagePath();
    setState(() {
      _imagePath = imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyAppColor.productBG,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black45),
        backgroundColor: MyAppColor.productBG,
        elevation: 0,
        title: TextWidget(
          text: "My Profile",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    child: FutureBuilder<String?>(
                      future: ProfileDatabase.instance.getProfileImagePath(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                            backgroundImage:
                                AssetImage('assets/images/banner.png'),
                          );
                        }
                      },
                    ),
                  ),
                  Positioned(
                    right: -6,
                    bottom: 5,
                    child: IconButton(
                      onPressed: () {
                        _selectAndStoreImage();
                      },
                      icon: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 14,
                        child: Icon(
                          Icons.file_upload,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              _addressController.addressList.isEmpty
                  ? TextWidget(
                      text: 'MF FOOD MART',
                      fontWeight: FontWeight.bold,
                      color: MyAppColor.btnColor,
                    )
                  : Container(),
              Expanded(
                child: _addressController.addressList.isEmpty
                    ? Center(
                        child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddressScreen()));
                        },
                        child: TextWidget(
                          text: "Add Address",
                        ),
                      ))
                    : ListView.builder(
                        itemCount: _addressController.addressList.length,
                        itemBuilder: (context, index) {
                          final data = _addressController.addressList[index];
                          return Column(
                            children: [
                              TextWidget(
                                  text: "${data.firstName} ${data.lastName}"),
                              const SizedBox(height: 20),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                height: 300,
                                width: size.width,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.shade200, width: 2)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AddressWidget(
                                      addressModel: data,
                                      titleText: "Email",
                                      addressText: data.email,
                                    ),
                                    AddressWidget(
                                      addressModel: data,
                                      titleText: "Address",
                                      addressText:
                                          "${data.address1}, ${data.address2}, ${data.city}, ${data.country}",
                                    ),
                                    AddressWidget(
                                      addressModel: data,
                                      titleText: "Phone",
                                      addressText: data.phone,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
