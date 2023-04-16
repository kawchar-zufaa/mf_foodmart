import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/controller/product_controller.dart';

import 'package:mf_foodmart/models/favourite_model.dart';
import 'package:mf_foodmart/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteController extends GetxController{
final _productController=Get.put(ProductController());
  var isLoading=true.obs;
  var favoriteList=<FavouriteModel>[].obs;


  Future<List<FavouriteModel>> getFavoriteDataFromLocal() async {
    isLoading(true);
    favoriteList.value = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final favoriteItem = prefs.getString('favourite');
    final List<dynamic> jsonData = jsonDecode(favoriteItem ?? '[]');
    final favoriteList_ = jsonData
        .map<FavouriteModel>((jsonItem) => FavouriteModel.fromMap(jsonItem))
        .toList();
    favoriteList.value = favoriteList_.whereType<FavouriteModel>().toList();
    isLoading(false);
    return favoriteList;
  }


  void savaFavoriteDataInLocal(ProductModel productModel)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    List<FavouriteModel> favoriteList=[];
    favoriteList.addAll(await getFavoriteDataFromLocal());
    bool isAvailable=false;
    for(var element in favoriteList){
      if(element.productId==productModel.id){
        isAvailable=true;
      }
    }
    if(isAvailable){
      favoriteList.removeWhere((element) => element.productId == productModel.id);
      bool result = await prefs.setString('favourite',
          jsonEncode(favoriteList.map((e) => e.toMap()).toList()));
       getFavoriteDataFromLocal();
      _productController.getProduct();
      if (result) {
        Fluttertoast.showToast(
          msg: "Product removed from favorite list!",
          backgroundColor: Colors.red,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
        );
      }
      // Fluttertoast.showToast(
      //   msg: "Already added to favorite list!",
      //   backgroundColor: Colors.red,
      //   gravity: ToastGravity.BOTTOM,
      //   timeInSecForIosWeb: 1,
      //   textColor: Colors.white,
      // );
    }else{
      FavouriteModel favouriteModel=FavouriteModel(
        productId: productModel.id,
        productImage: productModel.images,
        productName: productModel.name,
        productPrice: productModel.price,
        description: productModel.description,
        isFavourite:true,
        cid: productModel.categories.first.id,
        categoryName: productModel.categories.first.name,
        shortDescription: productModel.shortDescription,
        count: 1,
      );

      favoriteList.add(favouriteModel);
      bool result=await prefs.setString('favourite', jsonEncode(favoriteList.map((e) => e.toMap()).toList()));

      if(result){
        Fluttertoast.showToast(
          msg: "Product added as favorite!",
          backgroundColor: Colors.red,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
        );
      }

    }

    _productController.getProduct();
    getFavoriteDataFromLocal();
  }


void removeItem(int index) async {
  for (int i = 0; i < favoriteList.length; i++) {
    if (i == index) {
      favoriteList.removeAt(i);
    }
  }

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool result = await prefs.setString('favourite',
      jsonEncode(favoriteList.map((e) => e.toMap()).toList()));

  if (result) {
    Fluttertoast.showToast(
      msg: "Product removed from favorite list!",
      backgroundColor: Colors.red,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
    );
  }
  _productController.getProduct();
  getFavoriteDataFromLocal();
}

}