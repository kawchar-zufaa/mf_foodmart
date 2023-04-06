// import 'package:flutter/material.dart';
// import 'package:mf_foodmart/database_helper/delivery_address_database/delivery_address_database.dart';
// import 'package:mf_foodmart/models/address_model.dart';
//
// class AddressListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Saved Addresses'),
//       ),
//       body: FutureBuilder<List<AddressModel>>(
//         future: DeliveryAddressDatabase.instance.getDeliveryAddresses(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final addresses = snapshot.data!;
//             return ListView.builder(
//               itemCount: addresses.length,
//               itemBuilder: (context, index) {
//                 final address = addresses[index];
//                 return ListTile(
//                   title: Text('${address.firstName} ${address.lastName}'),
//                   subtitle: Text('${address.address1}, ${address.city}'),
//                   trailing: ElevatedButton(
//                     onPressed: (){
//                     },
//                     child: const Text("Update"),
//                   ),
//                 );
//               },
//             );
//           } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }
