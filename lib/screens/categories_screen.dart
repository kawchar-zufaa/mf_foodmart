import 'package:flutter/material.dart';
import 'package:mf_foodmart/api_handler/api_Service.dart';
import 'package:mf_foodmart/models/categories_model.dart';

class CategoriesScreen extends StatefulWidget {
  final int cid;
  final String name;
  CategoriesScreen({Key? key, required this.cid, required this.name})
      : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var categoriesList = <CategoriesModel>[];
  var isLoading = false;

  Future<void> fetchData() async {
    try {
      isLoading = true;

      final data = await ApiService.fetchCatWaysProduct(cid: widget.cid);

      if (data != null) {
        setState(() {
          categoriesList.addAll(data);
        });
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading = false;
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(ApiService.fetchCatWaysProduct(cid: 204));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : categoriesList.isEmpty
              ? const Center(
                  child: Text("No found this item"),
                )
              : GridView.builder(
                  itemCount: categoriesList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 300,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.yellow,
                      child: Center(
                        child: Text(categoriesList[index].name.toString()),
                      ),
                    );
                  },
                ),
    );
  }
}
