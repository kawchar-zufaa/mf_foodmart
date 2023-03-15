import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  Color color;
  double size;
  FontWeight? fontWeight;
  int? maxLines;
  TextOverflow? overflow;

  TextWidget(
      {Key? key,
      required this.text,
      this.size = 15,
      this.color = Colors.black,
      this.fontWeight,
      this.maxLines,
      this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
