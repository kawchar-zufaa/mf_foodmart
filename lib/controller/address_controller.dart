
import 'package:get/get.dart';
import 'package:mf_foodmart/database_helper/delivery_address_database/delivery_address_database.dart';
import 'package:mf_foodmart/models/address_model.dart';

class AddressController extends GetxController{

  var addressList=<AddressModel>[].obs;


  @override
  void onInit() {
    getAddressList();
    _loadAddresses();
    super.onInit();
  }

  void _loadAddresses() async {
    final addresses = await DeliveryAddressDatabase.instance.getAddresses();

    addressList.value = addresses;

  }

  // void fetchAddresses() async {
  //   List<Map<String, dynamic>> maps = await DeliveryAddressDatabase.instance.getAddress();
  //   addressList.value =
  //       maps.map((address) => AddressModel.fromMap(address)).toList();
  // }


  void getAddressList() async {
    final db = await DeliveryAddressDatabase.instance.database;
    final result = await db.query('delivery_address');
    addressList.value =
        result.map((json) => AddressModel.fromMap(json)).toList();
  }






}