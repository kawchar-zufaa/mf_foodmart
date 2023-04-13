import 'package:flutter/material.dart';
import 'package:mf_foodmart/screens/main/main_screen.dart';
import 'package:mf_foodmart/widgets/custom_button.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class OrderSuccessFullScreen extends StatelessWidget {
  const OrderSuccessFullScreen({Key? key, required this.orderId}) : super(key: key);
final int orderId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/success.png',height: 200,width: 200,),
            const SizedBox(height: 5),
            TextWidget(text: 'Order Success',size: 40,),
            const SizedBox(height: 5),
            TextWidget(text: 'Your order #$orderId id successfully placed',size: 20,color: Colors.black45,),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const MainScreen()));
              }, text: "Back To Home"),
            )
          ],
        )
      ),
    );
  }
}
