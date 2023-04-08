import 'package:flutter/material.dart';
import 'package:mf_foodmart/models/address_model.dart';
import 'package:mf_foodmart/screens/delivery_address/address_screen.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class DeliveryAddressCard extends StatelessWidget {
  const DeliveryAddressCard({
    super.key,
    required List<AddressModel> addresses,
  }) : _addresses = addresses;


  final List<AddressModel> _addresses;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Card(
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
            TextWidget(
              text: "Delivery Address",
              fontWeight: FontWeight.bold,
            ),
            _addresses.isEmpty
                ? TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AddressScreen()));
              },
              child: TextWidget(
                text: "Add delivery Address",
                color: MyAppColor.btnColor,
                fontWeight: FontWeight.bold,
              ),
            )
                : Expanded(
              child: ListView.builder(
                  itemCount: _addresses.length,
                  itemBuilder: (context, index) {
                    final address = _addresses[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextWidget(
                                text:
                                "${address.firstName} ${address.lastName}",
                                maxLines: 2,
                                color: const Color(0xff979494),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              AddressScreen(
                                                addressModel:
                                                address,
                                              )));
                                },
                                child: TextWidget(
                                  text: "Change",
                                  color: MyAppColor.btnColor,
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        ),
                        TextWidget(
                          text:
                          "${address.address1} ${address.address2}",
                          color: const Color(0xff979494),
                        ),
                        TextWidget(
                            text: address.phone,
                            color: const Color(0xff979494)),
                        TextWidget(
                            text: address.email,
                            color: const Color(0xff979494)),
                        TextWidget(
                            text: address.postCode,
                            color: const Color(0xff979494)),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}