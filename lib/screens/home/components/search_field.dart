import 'package:flutter/material.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';

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
      child: TextField(
        decoration: InputDecoration(
          fillColor: MyAppColor.bgColor,
            hintText: "Search grocery",
            hintStyle: const TextStyle(
                color: Color(0xffC0C0C0)
            ),
            border: InputBorder.none,
            suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Color(0xffC0C0C0),))
        ),
      ),);
  }
}
