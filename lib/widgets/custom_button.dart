import 'package:flutter/material.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class CustomButton extends StatelessWidget {
  bool isResponsive;
 final VoidCallback onTap;
 final String text;
   CustomButton({Key? key, required this.onTap, required this.text,this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 48,
        width:isResponsive==true?213:size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyAppColor.btnColor,
        ),
        child: TextButton(
          onPressed:onTap,
          child: TextWidget(
            text: text,
            color: MyAppColor.productBG,
          ),
        ),
      ),
    );
  }
}


