import 'package:flutter/material.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class AddressTextFilled extends StatelessWidget {
  final String text;
  TextInputType textInputType;
  final TextEditingController controller;
  String? Function(String?)? validator;
  AddressTextFilled(
      {Key? key,
      required this.text,
      required this.controller,
      this.validator,
      this.textInputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(text: text),
        const SizedBox(height: 5),
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey), //<-- SEE HERE
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey), //<-- SEE HERE
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey), //<-- SEE HERE
            ),
          ),
          controller: controller,
          keyboardType: textInputType,
          validator: validator,
        ),
        // Container(
        //   padding: const EdgeInsets.only(left: 7),
        //   height:50,
        //   width: size.width,
        //   decoration: BoxDecoration(
        //       border: Border.all(
        //           color: Colors.grey
        //       )
        //   ),
        //   child: TextField(
        //     controller: controller,
        //     decoration:const InputDecoration(
        //         border: InputBorder.none
        //     ),
        //   ),
        // ),
        const SizedBox(height: 10),
      ],
    );
  }
}
