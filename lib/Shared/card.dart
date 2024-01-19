// import 'dart:ffi';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:e_commers/Shared/appstyl.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class CardPage extends StatelessWidget {
//   CardPage({super.key});

//   final _cardBox = Hive.box('cart_box');

//   @override
//   Widget build(BuildContext context) {
//     List<dynamic> cart = [];
//     final cardData = _cardBox.keys.map((key) {
//       final item = _cardBox.get(key);
//       return {
//         "key": key,
//         "id": item['id'],
//         "category": item['category'],
//         "name": item['name'],
//         "imageUrl": item['imageUrl'],
//         "price": item['price'],
//         "qty": item['qty'],
//         "sizes": item['sizes']
//       };
//     }).toList();

//     cart = cardData.reversed.toList();
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(12),
//         child: Stack(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 40,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Icon(
//                     Icons.close,
//                     color: Colors.black,
//                   ),
//                 ),
//                 Text(
//                   'My Cart',
//                   style: appstyle(36, Colors.black, FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * .65,
//                   child: ListView.builder(
//                     itemCount: cart.length,
//                     padding: EdgeInsets.zero,
//                     itemBuilder: (BuildContext context, int index) {
//                       final data = cart[index];
//                       return Padding(
//                         padding: EdgeInsets.all(8),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.all(Radius.circular(12)),
//                           child: Slidable(
//                             key: const ValueKey(0),
//                             endActionPane: ActionPane(
//                                 motion: const ScrollMotion(),
//                                 children: [
//                                   SlidableAction(
//                                     flex: 1,
//                                     onPressed: null,
//                                     backgroundColor: Colors.black,
//                                     foregroundColor: Colors.white,
//                                     icon: Icons.delete,
//                                     label: 'Delete',
//                                   ),
//                                 ]),
//                             child: Container(
//                               height: MediaQuery.of(context).size.height * 0.11,
//                               width: MediaQuery.of(context).size.width,
//                               decoration: BoxDecoration(
//                                   color: Colors.grey.shade100,
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: Colors.grey.shade500,
//                                         spreadRadius: 5,
//                                         blurRadius: 0.3,
//                                         offset: Offset(0, 1))
//                                   ]),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsets.all(12),
//                                         child: CachedNetworkImage(
//                                           imageUrl: data['imageUrl'],
//                                           width: 70,
//                                           height: 70,
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding:
//                                             EdgeInsets.only(left: 20, top: 12),
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               data['name'],
//                                               style: appstyle(16, Colors.black,
//                                                   FontWeight.bold),
//                                             )
//                                           ],
//                                         ),
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
