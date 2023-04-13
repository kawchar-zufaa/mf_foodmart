import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class CreditCardItems extends StatelessWidget {
  const CreditCardItems({
    super.key, required this.nameController, required this.cardController, required this.monthController, required this.yearController, required this.cvcController,
  });
final TextEditingController nameController;
final TextEditingController cardController;
final TextEditingController monthController;
final TextEditingController yearController;
final TextEditingController cvcController;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 300,
        color: Colors.white,
        child: ListView(
          children: [
            TextWidget(
                text: "Pay securely using your credit card",
                color: const Color(0xff979494)),
            const SizedBox(
              height: 10,
            ),
            _cardTextField(size: size,title: 'Name',hintText: 'name',controller: nameController),
            const SizedBox(
              height: 10
            ),
            _cardTextField(size: size,title: 'Card Number',hintText: 'xxxx xxxx xxxx xxxx',controller: cardController),
            const SizedBox(
                height: 10
            ),
            _cardTextField(size: size,title: 'Expiry_Month',hintText: 'expire month',controller: monthController),
            const SizedBox(
                height: 10
            ),
            _cardTextField(size: size,title: 'Expiry_Year',hintText: 'expire year',controller: yearController),
            const SizedBox(
                height: 10
            ),
            _cardTextField(size: size,title: 'Card Verification Code',hintText: 'cvc',controller: cvcController),
            const SizedBox(
              height: 10,
            ),
            // const Text.rich(
            //   TextSpan(
            //     children: [
            //       TextSpan(
            //           text: 'Expiration (MM/YY) ',
            //           style: TextStyle(color: Color(0xff8B8B8B))),
            //       TextSpan(
            //         text: '*',
            //         style: TextStyle(
            //           color: Colors.red,
            //           fontWeight: FontWeight.w800,
            //         ),
            //       ),
            //       TextSpan(text: '.'),
            //     ],
            //   ),
            // ),
            // const SizedBox(
            //   height: 5,
            // ),
            // const TextField(
            //   textAlign: TextAlign.start,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: 'MM/YY',
            //   ),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // Text.rich(
            //   TextSpan(
            //     children: [
            //       const TextSpan(
            //           text: 'Card Security Code ',
            //           style: TextStyle(color: Color(0xff8B8B8B))),
            //       TextSpan(
            //         text: '*',
            //         style: const TextStyle(
            //           color: Colors.red,
            //           fontWeight: FontWeight.w800,
            //         ),
            //         recognizer: TapGestureRecognizer()..onTap = () {},
            //       ),
            //       const TextSpan(text: '.'),
            //     ],
            //   ),
            // ),
            // const SizedBox(
            //   height: 5,
            // ),
            // const TextField(
            //   textAlign: TextAlign.start,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: 'CSC',
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _cardTextField(
    {
     required Size size,
      required String title,
    required String hintText,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: title,
                  style: const TextStyle(color: Color(0xff8B8B8B))),
              TextSpan(
                text: '*',
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w800,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              const TextSpan(text: '.'),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.only(left: 8),
          height: 50,
          width: size.width,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8)),
          child: TextField(
            controller: controller,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(fontSize: 15)),
          ),
        ),
      ],
    );
  }
}
