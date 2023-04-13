import 'package:flutter/material.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class ProfileItems extends StatelessWidget {
   ProfileItems({
    super.key,  this.image, required this.title,required this.onTap,this.icon,this.isIcon=false,
  });
   String? image;
  final String title;
    IconData? icon;
   bool isIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap:onTap,
          leading:isIcon==false?Image.asset(image!,width: 25,height: 25,):Icon(icon,size: 25,color: MyAppColor.btnColor,),
          title: TextWidget(text: title,),
          trailing: const Icon(Icons.keyboard_arrow_right_outlined),
        ),
        const Divider()
      ],
    );
  }
}