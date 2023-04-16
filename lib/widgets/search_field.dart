import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/screens/search/search_scren.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
      height: 45,width: size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: const Color(0xffEAEBEC)
          )
      ),
      child: InkWell(
        onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(text: 'Search Grocery',color: Colors.grey,),
            IconButton(onPressed: (){}, icon: const Icon(Icons.search,size: 25,color: Colors.grey,))
          ],
        ),
      ));
  }
}
