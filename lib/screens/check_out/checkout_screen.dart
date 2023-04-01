import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/custom_button.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  bool _isCreditCard=false;

  String text="850 MERIVALE RD, Ottawa, ON, Canada Phone: +1 613-722-8528";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyAppColor.productBG,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: MyAppColor.productBG,
        title: TextWidget(
          text: "Checkout",
          size: 18,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.grey.shade100,
              ),
            ),

            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 100,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: "Delivery Address"),
                  Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: TextWidget(
                            text:
                                text.isEmpty?"Add your delivery address":text,
                            maxLines: 3,
                            size: 15,
                            color: const Color(0xff979494),
                          )),
                     text.isEmpty?Expanded(
                       child: TextButton(
                         onPressed: () {},
                         child: const Text('Add'),
                       ),
                     ): Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Change'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 25,top: 12
            ),
            child: TextWidget(text: "Selected Payment Method"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.grey.shade100,
                    ),
                  ),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        _isCreditCard=false;
                      });
                    },
                    child: Container(
                      height: 85,
                      width: 125,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _isCreditCard==false?MyAppColor.btnColor:Colors.grey,
                          width:_isCreditCard==false?2:0
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/cash_on.png',width: 30,height: 30,),
                          TextWidget(text:'Cash on delivery')
                        ],
                      ),

                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.grey.shade100,
                    ),
                  ),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        _isCreditCard=true;
                      });
                    },
                    child: Container(
                      height: 85,
                      width: 125,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: _isCreditCard?MyAppColor.btnColor:Colors.grey,
                              width:_isCreditCard?2:0
                          )
                      ),
                     child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/card.png',width: 30,height: 30,),
                          TextWidget(text:'Credit Card')
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          _isCreditCard?Expanded(
               flex: 2,
               child: Card(
                 child: Container(
                   padding: const EdgeInsets.all(8.0),
                   height: 300,
                   color: Colors.white,
                    child: ListView(
                      children: [
                        TextWidget(text: "Pay securely using your credit card", color: const Color(0xff979494)),
                        const SizedBox(height: 10,),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                  text:
                                  'Card Number ',style: TextStyle(
                                  color: Color(0xff8B8B8B)
                              )
                              ),
                              TextSpan(
                                text: '*',
                                style: const TextStyle(
                                  color: Colors.red,fontWeight: FontWeight.w800,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {

                                  },
                              ),
                              const TextSpan(text: '.'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5,),
                        const TextField(
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'XXXX XXXX XXXX XXXX',
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                  'Expiration (MM/YY) ',style: TextStyle(
                                  color: Color(0xff8B8B8B)
                              )
                              ),
                              TextSpan(
                                text: '*',
                                style: TextStyle(
                                  color: Colors.red,fontWeight: FontWeight.w800,
                                ),
                              ),
                              TextSpan(text: '.'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5,),
                        const TextField(
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'MM/YY',
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                  text:
                                  'Card Security Code ',style: TextStyle(
                                  color: Color(0xff8B8B8B)
                              )
                              ),
                              TextSpan(
                                text: '*',
                                style: const TextStyle(
                                  color: Colors.red,fontWeight: FontWeight.w800,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {

                                  },
                              ),
                              const TextSpan(text: '.'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5,),
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
               )):Container(
            height: 300,
          ),

          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text:
                  'Your personal data will be used to process your order, '
                      'support your experience throughout this website, '
                      'and for other purposes described in our ',style: TextStyle(
                     color: Color(0xff8B8B8B)
                )
                ),
                TextSpan(
                  text: 'privacy policy',
                  style: const TextStyle(
                    color: MyAppColor.btnColor,fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {

                    },
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: 'Total:',color: const Color(0xff8B8B8B),),
                  TextWidget(text: 'CAD 23.99',color: MyAppColor.btnColor,fontWeight: FontWeight.bold,)
                ],
              ),
              CustomButton(
                onTap: (){

              }, text: "CheckOut",isResponsive: true,),
            ],
          )

        ],
      ),
    );
  }
}
