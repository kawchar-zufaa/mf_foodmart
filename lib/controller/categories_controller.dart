import 'package:get/get.dart';
import 'package:mf_foodmart/api_handler/api_Service.dart';
import 'package:mf_foodmart/models/categories_model.dart';

class CategoriesController extends GetxController{

  var categoriesList=<CategoriesModel>[].obs;

  var isLoading=false.obs;

  @override
  void onInit() {
   fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories()async{
    try{
      isLoading.value=true;
      var data=await ApiService.fetchCategory();
      if(data!=null){
        categoriesList.addAll(data);
      }
    }catch(e){
      print(e.toString());
      throw Exception('Something went wrong $e');
    }finally{
      isLoading.value=false;
    }



  }

}