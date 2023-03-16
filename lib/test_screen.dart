import 'package:flutter/material.dart';
import 'package:mf_foodmart/screens/products/view_all_products.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllProduct()));
          },
          icon: const Icon(Icons.navigate_next),
        ),
      ),
    );
  }
}
