class MyConstants{

 static const String categoriesApi = "https://www.mffoodmart.com/wp-json/wc/v2/products/categories?per_page=40";
  static String categoriesWaysProduct(var cid)=>"https://www.mffoodmart.com/wp-json/wc/v3/products?category=$cid";
  static String allProduct(var page, var perPage)=>"https://www.mffoodmart.com/wp-json/wc/v3/products?orderby=popularity&per_page=$perPage&page=$page";
  static String createOrder="https://www.mffoodmart.com/wp-json/wc/v2/orders";

}




