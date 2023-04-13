import 'package:flutter/material.dart';
import 'package:mf_foodmart/models/address_model.dart';
import 'package:mf_foodmart/screens/delivery_address/address_screen.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
    required this.addressModel,
    required this.titleText,
    required this.addressText,
  });
  final String titleText;
  final String addressText;
  final AddressModel addressModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              text: titleText,
              color: MyAppColor.btnColor,
              fontWeight: FontWeight.bold,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddressScreen(
                            addressModel: addressModel,
                          )));
                },
                icon: const Icon(
                  Icons.edit_outlined,
                  size: 20,
                  color: MyAppColor.btnColor,
                ))
          ],
        ),
        TextWidget(
          text: addressText,
          color: Colors.grey,
          size: 13,
        )
      ],
    );
  }
}