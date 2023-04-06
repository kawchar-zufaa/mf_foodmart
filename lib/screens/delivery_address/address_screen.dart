import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/controller/address_controller.dart';
import 'package:mf_foodmart/database_helper/delivery_address_database/delivery_address_database.dart';
import 'package:mf_foodmart/models/address_model.dart';
import 'package:mf_foodmart/screens/check_out/checkout_screen.dart';
import 'package:mf_foodmart/screens/delivery_address/component/address_textfilled.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/custom_button.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class AddressScreen extends StatefulWidget {
  AddressModel? addressModel;
  AddressScreen({Key? key, this.addressModel}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController companyController = TextEditingController();

  TextEditingController address1Controller = TextEditingController();

  TextEditingController address2Controller = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController stateController = TextEditingController();

  TextEditingController postcodeController = TextEditingController();

  TextEditingController countryController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  final _addressController = Get.put(AddressController());

  @override
  void initState() {
   if(widget.addressModel!=null){
     firstNameController.text=widget.addressModel!.firstName;
   }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyAppColor.productBG,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: MyAppColor.productBG,
        elevation: 0,
        title: TextWidget(
          text: "Delivery Address",
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          AddressTextFilled(
            text: 'First Name',
            controller: firstNameController,
          ),
          AddressTextFilled(
            text: 'Last Name',
            controller: lastNameController,
          ),
          AddressTextFilled(
            text: 'Company(Optional)',
            controller: companyController,
          ),
          AddressTextFilled(
            text: 'Address1',
            controller: address1Controller,
          ),
          AddressTextFilled(
            text: 'Address2',
            controller: address2Controller,
          ),
          AddressTextFilled(
            text: 'City',
            controller: cityController,
          ),
          AddressTextFilled(
            text: 'State',
            controller: stateController,
          ),
          AddressTextFilled(
            text: 'PostCode',
            controller: postcodeController,
          ),
          AddressTextFilled(
            text: 'Country/Region',
            controller: countryController,
          ),
          AddressTextFilled(
            text: 'Email',
            controller: emailController,
          ),
          AddressTextFilled(
            text: 'Phone',
            controller: phoneController,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
          child: CustomButton(
            onTap: () async {
              if (validateFields()) {
                AddressModel addressModel = AddressModel(
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  company: companyController.text,
                  address1: address1Controller.text,
                  address2: address2Controller.text,
                  city: cityController.text,
                  state: stateController.text,
                  postCode: postcodeController.text,
                  country: countryController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                );
               await DeliveryAddressDatabase.instance.insertAddress(addressModel);
               print('============================== first name ${addressModel.firstName}');
                Fluttertoast.showToast(msg: 'Data insert Successfully');
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>CheckoutScreen()));
              }
            },
            text: "Insert",
          )),
    );
  }

  bool validateFields() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        address1Controller.text.isEmpty ||
        address2Controller.text.isEmpty ||
        cityController.text.isEmpty ||
        stateController.text.isEmpty ||
        postcodeController.text.isEmpty ||
        countryController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please fill all the fields",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
    return true;
  }
}
