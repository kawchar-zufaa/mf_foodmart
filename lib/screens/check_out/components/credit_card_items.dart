import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class CreditCardItems extends StatelessWidget {
  const CreditCardItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                      text: 'Card Number ',
                      style: TextStyle(color: Color(0xff8B8B8B))),
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
            const TextField(
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'XXXX XXXX XXXX XXXX',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Expiration (MM/YY) ',
                      style: TextStyle(color: Color(0xff8B8B8B))),
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(text: '.'),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const TextField(
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'MM/YY',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                      text: 'Card Security Code ',
                      style: TextStyle(color: Color(0xff8B8B8B))),
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
            const TextField(
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'CSC',
              ),
            ),
          ],
        ),
      ),
    );
  }
}