import 'dart:convert';

import 'package:mf_foodmart/models/categories_model.dart';
import 'package:http/http.dart' as http;
import 'package:mf_foodmart/utility/constants.dart';

class ApiService {
  static String username = "ck_389df1912d9d0be0541ee41dc1e3fcbfb367bbf9";
  static String password = "cs_643aea4269872c4005d4a106676bcd07e96af983";

  static Future<List<CategoriesModel>> fetchCategory() async {
    final response = await http.get(
      Uri.parse(MyConstants.categoriesApi),
      headers: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$username:$password'))}',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body) as List;
      var jsonData =
          data.map((json) => CategoriesModel.fromJson(json)).toList();
      return jsonData;
    } else {
      throw Exception("failed to load data");
    }
  }

  static Future<List<CategoriesModel>> fetchCatWaysProduct(
      {required int cid}) async {
    final response = await http.get(
      Uri.parse(MyConstants.categoriesWaysProduct(cid)),
      headers: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$username:$password'))}',
      },
    );

    if(response.statusCode==200){

      List<dynamic> data=json.decode(response.body) as List;

      var jsonData=data.map((e) => CategoriesModel.fromJson(e)).toList();

      return jsonData;
    }else{
      throw Exception('Failed to load data');
    }
  }
}
