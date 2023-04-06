import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mf_foodmart/controller/cart_controller.dart';
import 'package:mf_foodmart/database_helper/cart_database/cart_database.dart';
import 'package:mf_foodmart/models/cart_model.dart';
import 'package:mf_foodmart/utility/my_app_colors.dart';
import 'package:mf_foodmart/widgets/build_image.dart';
import 'package:mf_foodmart/widgets/text_widget.dart';

class CartItemWidget extends StatefulWidget {
 final CartModel cartModel;
  const CartItemWidget({Key? key,required this.cartModel}) : super(key: key);

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  final _cartController=Get.put(CartController());

  bool _isRemove = false;
  bool _isAdd = false;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
            padding: const EdgeInsets.all(3),
            height: 90,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildImage(size: size/10, imgUrl: widget.cartModel.productImage),
                // Image.network(
                //   widget.cartModel.productImage,
                //   width: 80,
                // ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(text: widget.cartModel.productName,maxLines: 2,),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          TextWidget(
                            text: "CAD ${widget.cartModel.productPrice}",
                            color: MyAppColor.btnColor,
                            fontWeight: FontWeight.bold,
                          ),
                          TextWidget(
                            text: '/per lbs',
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        _cartController.deleteCartItem(widget.cartModel.productId);
                      },
                      icon: const Icon(Icons.close,color: Colors.grey,size: 20,),),
                    _countButton(
                        removeButton: () {
                          if(widget.cartModel.count==1){
                            Fluttertoast.showToast(msg: 'You cannot order less than one item');
                          }else{
                            setState(() {
                              _isRemove=true;
                              _isAdd=false;
                              widget.cartModel.count--;
                            });

                            CartDatabase.instance.updateCartItem(widget.cartModel);

                          }

                        },
                        text: "${widget.cartModel.count}",
                        addButton: () {
                          setState(() {
                            _isAdd=true;
                            _isRemove=false;
                            widget.cartModel.count++;
                          });
                          CartDatabase.instance.updateCartItem(widget.cartModel);
                        })

                  ],
                )
              ],
            )

        ),
      ),
    );
  }

  Widget _countButton({
    required VoidCallback removeButton,
    required String text,
    required VoidCallback addButton,
  }) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: _isRemove ? MyAppColor.btnColor : Colors.grey[300],
          radius: 12,
          child: InkWell(
            onTap: removeButton,
            child: Icon(
              Icons.remove,
              size: 16,
              color: _isRemove ? Colors.white : MyAppColor.btnColor,
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        TextWidget(text: text),
        const SizedBox(width: 5),
        CircleAvatar(
          backgroundColor: _isAdd ? MyAppColor.btnColor : Colors.grey[300],
          radius: 12,
          child: InkWell(
            onTap: addButton,
            child: Icon(
              Icons.add,
              size: 16,
              color: _isAdd ? Colors.white : MyAppColor.btnColor,
            ),
          ),
        ),
      ],
    );
  }
}
