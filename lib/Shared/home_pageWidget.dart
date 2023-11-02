import 'package:e_commers/Models/sneakers_models.dart';
import 'package:e_commers/Shared/appstyl.dart';
import 'package:e_commers/Shared/new_shoes.dart';
import 'package:e_commers/Shared/product_card.dart';
import 'package:e_commers/controllers/product_providder.dart';
import 'package:e_commers/screens/Product_page.dart';
import 'package:e_commers/screens/product_by_card.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({
    super.key,
    required Future<List<Sneakers>> male,
    required this.tabindex,
  }) : _male = male;

  final Future<List<Sneakers>> _male;
  final int tabindex;

  @override
  Widget build(BuildContext context) {
    var productNotifer = Provider.of<ProductNotifer>(context);
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.405,
            child: FutureBuilder<List<Sneakers>>(
                future: _male,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text(
                      "error ${snapshot.error}",
                      style: TextStyle(color: Colors.white),
                    );
                  } else {
                    // ignore: unused_local_variable
                    final male = snapshot.data;
                    return ListView.builder(
                      itemCount: male!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        final shoe = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            productNotifer.shoesSize = shoe.sizes;
                            print(productNotifer.shoesSize);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductPage(
                                        id: shoe.id, category: shoe.category)));
                          },
                          child: ProductCard(
                            price: "\$${shoe.price}",
                            category: shoe.category,
                            id: shoe.id,
                            name: shoe.name,
                            image: shoe.imageUrl[0],
                          ),
                        );
                      },
                    );
                  }
                })),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Show",
                    style: appstyle(24, Colors.black, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductByCard(
                                  tabindex: tabindex,
                                ))),
                    child: Row(
                      children: [
                        Text(
                          "Show All",
                          style: appstyle(22, Colors.black, FontWeight.w500),
                        ),
                        Icon(
                          Ionicons.caret_forward,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
          child: FutureBuilder<List<Sneakers>>(
              future: _male,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text(
                    "error ${snapshot.error}",
                    style: TextStyle(color: Colors.white),
                  );
                } else {
                  // ignore: unused_local_variable
                  final male = snapshot.data;
                  return ListView.builder(
                    itemCount: male!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      final shoe = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: NewShoes(
                          imageurl: shoe.imageUrl[1],
                        ),
                      );
                    },
                  );
                }
              }),
        )
      ],
    );
  }
}
