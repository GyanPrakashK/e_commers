import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commers/Shared/appstyl.dart';
import 'package:e_commers/controllers/card_provider.dart';
import 'package:e_commers/screens/CheckOut_btn.dart';
import 'package:e_commers/screens/Mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class CardPage extends StatefulWidget {
  CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  // final _cartBox = Hive.box('cart_box');

  @override
  Widget build(BuildContext context) {
    // List<dynamic> cart = [];
    // final cardData = _cardBox.keys.map((key) {
    //   final item = _cardBox.get(key);
    //   return {
    //     "key": key,
    //     "id": item['id'],
    //     "category": item['category'],
    //     "name": item['name'],
    //     "imageUrl": item['imageUrl'],
    //     "price": item['price'],
    //     "qty": item['qty'],
    //     "sizes": item['sizes']
    //   };
    // }).toList();

    // cart = cardData.reversed.toList();
    var cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getcard();
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'My Cart',
                  style: appstyle(36, Colors.black, FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .65,
                  child: ListView.builder(
                    itemCount: cartProvider.cart.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      final data = cartProvider.cart[index];
                      return Padding(
                        padding: EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          // child: Slidable(
                          //   key: const ValueKey(0),
                          //   endActionPane: ActionPane(
                          //       motion: const ScrollMotion(),
                          //       children: [
                          //         SlidableAction(
                          //           flex: 1,
                          //           onPressed: doNothing,
                          //           backgroundColor: Colors.black,
                          //           foregroundColor: Colors.white,
                          //           icon: Icons.delete,
                          //           label: 'Delete',
                          //         ),
                          //       ]),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade500,
                                      spreadRadius: 5,
                                      blurRadius: 0.3,
                                      offset: Offset(0, 1))
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(12),
                                          child: CachedNetworkImage(
                                            imageUrl: data['imageUrl'],
                                            width: 70,
                                            height: 70,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                            bottom: -2,
                                            child: GestureDetector(
                                              onTap: () {
                                                cartProvider
                                                    .deleteCart(data['key']);
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MainScreen()));
                                              },
                                              child: Container(
                                                width: 37,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    12))),
                                                child: Icon(
                                                  Icons.delete,
                                                  size: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 12),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['name'],
                                            style: appstyle(16, Colors.black,
                                                FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            data['category'],
                                            style: appstyle(12, Colors.grey,
                                                FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                data['price'],
                                                style: appstyle(
                                                    16,
                                                    Colors.black,
                                                    FontWeight.w600),
                                              ),
                                              SizedBox(
                                                width: 18,
                                              ),
                                              Text(
                                                "Size",
                                                style: appstyle(16, Colors.grey,
                                                    FontWeight.w600),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              // Text(
                                              //   data['sizes'],
                                              //   style: appstyle(
                                              //       16,
                                              //       Colors.black,
                                              //       FontWeight.w600),
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  // cartProvider.increment();
                                                },
                                                child: const Icon(
                                                  Icons.minimize,
                                                  size: 20,
                                                  color: Colors.grey,
                                                )),
                                            Text(
                                              data['qty'].toString(),
                                              style: appstyle(
                                                16,
                                                Colors.black,
                                                FontWeight.w600,
                                              ),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  // cartProvider.decrement();
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                  size: 20,
                                                  color: Colors.black,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),

                                    // ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          // ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            const Align(
                alignment: Alignment.bottomCenter,
                child: CheckOutButton(lable: "Proceed to Checkout")),
          ],
        ),
      ),
    );
  }

  // void doNothing(BuildContext context) {}
}




































// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// import '../Shared/appstyl.dart';

// class CardPage extends StatelessWidget {
//    CardPage({super.key});
//   final _cardBox = Hive.box('cart_box');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Text(
//         'This is Card Page ',
//         style: appstyle(40, Colors.black, FontWeight.bold),
//       )),
//     );
//   }
// }