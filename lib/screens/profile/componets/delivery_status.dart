import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mf_foodmart/controller/order_controller.dart';
import 'package:mf_foodmart/models/order_model.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DeliveryStatus extends StatelessWidget {
   DeliveryStatus({super.key});
  final _orderController=Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
final size =MediaQuery.of(context).size;
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat('MMM dd, yyyy').format(currentDate);
    return Scaffold(
      backgroundColor: MyAppColor.productBG,
         appBar: AppBar(
           iconTheme: const IconThemeData(
             color: Colors.black54
           ),
           backgroundColor: MyAppColor.productBG,
           elevation: 0,
           title: TextWidget(text: "Delivery Status",size: 20,),
           centerTitle: true,
         ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(text: "Estimated Delivery",color: Colors.black87),
          TextWidget(text: formattedDate),
          const SizedBox(height: 15,),
          TextWidget(text: 'Coming soon',size: 30,color: MyAppColor.btnColor,fontWeight: FontWeight.bold,),
          const SizedBox(height: 30,),
          Column(
            children: [
             buildTimelineTile(context, size, title: "Order Placed",time: '9:00 AM',icon:Icons.check_circle_outline,containerColor: Colors.green),
             buildTimelineTile(context, size, title: "Pending",time: '9:30 AM',icon:Icons.check_circle_outline),
             buildTimelineTile(context, size, title: "Confirmed",time: '10:00 AM',icon:Icons.check_circle_outline),
             buildTimelineTile(context, size, title: "Processing",time: '10:30 AM',icon:Icons.circle),
             buildTimelineTile(context, size, title: "Delivered",time: '11:00 AM',icon:Icons.circle,),
            ],
          )


        ],
      ),
    );
  }

  TimelineTile buildTimelineTile(BuildContext context, Size size,
      {required String title, time, containerColor,required IconData icon}) {
    return TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.4,
        beforeLineStyle: const LineStyle(color: Colors.grey, thickness: 2),
        afterLineStyle: const LineStyle(color: Colors.grey, thickness: 2),
        indicatorStyle: IndicatorStyle(
          width: 25,
          color: Colors.green,
          iconStyle: IconStyle(
            iconData:icon,
            fontSize: 23,
            color: Colors.white,
          ),
        ),
        endChild: InkWell(
          onTap: () {
            showModalBottomSheet(
                elevation: 4,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(builder:
                      (BuildContext context, StateSetter setModelState) {
                    return ListView.builder(
                        itemCount:_orderController.orders.length,
                        itemBuilder: (context, index) {
                          OrderModel data =
                          _orderController.orders[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text("Bjreakfast at 9.00 am")),
                              ),
                              buildTextWidget(
                                  data.date, Colors.black),
                              buildTextWidget(
                                  data.productName, Colors.black),
                              buildTextWidget(
                                  data.date, Colors.black),
                              buildTextWidget(data.productPrice.toString(),
                                  Colors.deepOrangeAccent),
                              buildTextWidget('Canada'.toString(),
                                  Colors.black)
                            ],
                          );
                        });
                  });
                });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 50,
                width: 150,
                child: Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const Text(
                     "",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                )),
          ),
        ),
        startChild: Row(
          children: [
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: containerColor,
              ),
            ),
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(time),
            ),
          ],
        ));
  }

  buildTextWidget(data, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextWidget(
        text: data,
        color: color,
      ),
    );
  }
}



