// import 'package:flutter/material.dart';
// import 'package:mf_foodmart/screens/home/home_screen.dart';
// import 'package:mf_foodmart/test_screen.dart';
//
// class CustomNavBar extends StatelessWidget {
//   const CustomNavBar({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 65,
//       padding:const EdgeInsets.symmetric(horizontal: 20),
//       decoration:const BoxDecoration(
//           color: Color(0xFF292B37),
//           borderRadius: BorderRadius.only(
//               topLeft:Radius.circular(25),
//               topRight: Radius.circular(25)
//           )
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           InkWell(
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
//             },
//             child:const Icon(Icons.home,size: 35,color: Colors.white,),
//           ),
//           InkWell(
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>TestScreen()));
//             },
//             child: const Icon(Icons.category,size: 35,color: Colors.white,),
//           ),
//           InkWell(
//             onTap: (){
//
//             },
//             child:const Icon(Icons.favorite_border,size: 35,color: Colors.white,),
//           ),
//           InkWell(
//             onTap: (){
//
//             },
//             child:const Icon(Icons.person,size: 35,color: Colors.white,),
//           ),
//         ],
//       ),
//     );
//   }
// }