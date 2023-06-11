import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mf_foodmart/models/product_model.dart';
import 'package:mf_foodmart/utility/constants.dart';

class MySearchController extends GetxController {
  var products = <ProductModel>[].obs;
  var isLoading = false.obs;

  static String username = "ck_389df1912d9d0be0541ee41dc1e3fcbfb367bbf9";
  static String password = "cs_643aea4269872c4005d4a106676bcd07e96af983";
  Future<void> searchProducts(String keyword) async {


    try {
      isLoading.value = true;
      products.clear();

      final response = await http.get(Uri.parse(MyConstants.searchProduct(keyword)),headers: {
        'Authorization':
        'Basic ${base64Encode(utf8.encode('$username:$password'))}',
      },);
      if (response.statusCode == 200) {
        final List<dynamic> productList = jsonDecode(response.body);
        for (final productMap in productList) {
          products.add(ProductModel.fromJson(productMap));
        }
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      print(error);
    } finally {
      isLoading.value = false;
    }
  }
}


