import 'package:flutter/material.dart';

class PromoCodeField extends StatelessWidget {
  const PromoCodeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Card(
      child: Container(
          alignment: Alignment.center,
          height: 40,
          width: size.width,
          decoration:
          BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Add Your Promo Code",
                  hintStyle: const TextStyle(color: Color(0xff8B8B8B),fontSize: 15),
                  border: InputBorder.none,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(

                      child: Image.asset(
                        'assets/images/img.png',
                      ),
                    ),
                  )),
            ),
          )),
    );
  }
}
