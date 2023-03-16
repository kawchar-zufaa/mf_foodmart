import 'package:flutter/material.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class ViewAllButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const ViewAllButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: text,
          color: MyAppColor.textColor,
          size: 16,
        ),
        InkWell(
          onTap:onTap,
          child: Container(
            alignment: Alignment.center,
            height: 25,
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color(0xffEAEBEC)
              ),
              borderRadius: BorderRadius.circular(30)
            ),
            child: TextWidget(
              text: 'View All',
              color: MyAppColor.textColor,
              size: 12,
            ),
          ),
        ),
      ],
    );
  }
}
