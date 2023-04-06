import 'package:flutter/material.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class AddressTextFilled extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const AddressTextFilled({Key? key, required this.text, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(text: text),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.only(left: 7),
          height:50,
          width: size.width,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey
              )
          ),
          child: TextField(
            controller: controller,
            decoration:const InputDecoration(
                border: InputBorder.none
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
