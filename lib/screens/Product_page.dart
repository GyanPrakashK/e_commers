// import 'dart:js_util';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commers/Models/sneakers_models.dart';
import 'package:e_commers/Servicers/helper.dart';
import 'package:e_commers/Shared/appstyl.dart';
import 'package:e_commers/controllers/product_providder.dart';
import 'package:e_commers/screens/CheckOut_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.id, required this.category});
  final String id;
  final String category;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final PageController pageController = PageController();

  late Future<Sneakers> _sneaker;
  void getShoes() {
    if (widget.category == "Men's Running") {
      _sneaker = Helper().getMensSneakersById(widget.id);
    } else if (widget.category == "Women's Running") {
      _sneaker = Helper().getWomenSneakersById(widget.id);
    } else {
      _sneaker = Helper().getKidsSneakersById(widget.id);
    }
  }

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    getShoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Sneakers>(
            future: _sneaker,
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
                final sneaker = snapshot.data;
                return Consumer<ProductNotifer>(
                  builder: (context, productNotifer, child) {
                    return CustomScrollView(
                      slivers: <Widget>[
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          leadingWidth: 0,
                          title: Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      // productNotifer.shoesSize.clear();
                                    },
                                    child: const Icon(
                                      Ionicons.close,
                                      color: Colors.black,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: null,
                                    child: const Icon(
                                        Ionicons.ellipsis_horizontal,
                                        color: Colors.black),
                                  ),
                                ]),
                          ),
                          pinned: true,
                          snap: false,
                          floating: true,
                          backgroundColor: Colors.transparent,
                          expandedHeight: MediaQuery.of(context).size.height,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Stack(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .5,
                                  width: MediaQuery.of(context).size.width,
                                  child: PageView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: sneaker!.imageUrl.length,
                                      controller: pageController,
                                      onPageChanged: (page) {
                                        productNotifer.activepage = page;
                                      },
                                      itemBuilder: (context, int index) {
                                        return Stack(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .39,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.grey.shade300,
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    sneaker.imageUrl[index],
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Positioned(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .25,
                                                right: 20,
                                                child: Icon(
                                                  Ionicons.heart_outline,
                                                  color: Colors.grey,
                                                )),
                                            Positioned(
                                                bottom: 0,
                                                right: 0,
                                                left: 0,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.3,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children:
                                                      List<Widget>.generate(
                                                          sneaker
                                                              .imageUrl.length,
                                                          (index) => Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            4),
                                                                child:
                                                                    CircleAvatar(
                                                                  radius: 5,
                                                                  backgroundColor: productNotifer
                                                                              .activepage !=
                                                                          index
                                                                      ? Colors
                                                                          .grey
                                                                      : Colors
                                                                          .black,
                                                                ),
                                                              )),
                                                )),
                                          ],
                                        );
                                      }),
                                ),
                                Positioned(
                                    bottom: 30,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .645,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.all(12),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                sneaker.name,
                                                style: appstyle(
                                                    40,
                                                    Colors.black,
                                                    FontWeight.bold),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    sneaker.category,
                                                    style: appstyle(
                                                        20,
                                                        Colors.grey,
                                                        FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  RatingBar.builder(
                                                    initialRating: 4,
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemSize: 22,
                                                    itemPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: .8),
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                      Icons.star,
                                                      size: 18,
                                                      color: Colors.black,
                                                    ),
                                                    onRatingUpdate: (ratinh) {},
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "\$${sneaker.price}",
                                                    style: appstyle(
                                                        20,
                                                        Colors.black,
                                                        FontWeight.bold),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "colors",
                                                        style: appstyle(
                                                            18,
                                                            Colors.black,
                                                            FontWeight.w600),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      CircleAvatar(
                                                        radius: 5,
                                                        backgroundColor:
                                                            Colors.black,
                                                      ),
                                                      CircleAvatar(
                                                        radius: 5,
                                                        backgroundColor:
                                                            Colors.red,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 13,
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "select size",
                                                        style: appstyle(
                                                            20,
                                                            Colors.black,
                                                            FontWeight.bold),
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        "View size guide",
                                                        style: appstyle(
                                                            18,
                                                            Colors.grey,
                                                            FontWeight.w600),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  SizedBox(
                                                    height: 40,
                                                    child: ListView.builder(
                                                      itemCount: productNotifer
                                                          .shoesSize.length,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      padding: EdgeInsets.zero,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        final sizes =
                                                            productNotifer
                                                                    .shoesSize[
                                                                index];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      8),
                                                          child: ChoiceChip(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            60),
                                                                    side:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width: 1,
                                                                      style: BorderStyle
                                                                          .solid,
                                                                    )),
                                                            disabledColor:
                                                                Colors.white,
                                                            label: Text(
                                                              sizes['size'],
                                                              style: appstyle(
                                                                  18,
                                                                  sizes["isSelected"]
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black38,
                                                                  FontWeight
                                                                      .w500),
                                                            ),
                                                            selectedColor:
                                                                Colors.black,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        8),
                                                            selected: productNotifer
                                                                        .shoesSize[
                                                                    index]
                                                                ["isSelected"],
                                                            onSelected:
                                                                (nweState) {
                                                              productNotifer
                                                                  .toggleCheck(
                                                                      index);
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              const Divider(
                                                indent: 10,
                                                endIndent: 10,
                                                color: Colors.black,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                child: Text(
                                                  sneaker.title,
                                                  style: appstyle(
                                                      21.5,
                                                      Colors.black,
                                                      FontWeight.w700),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 9,
                                              ),
                                              Text(
                                                sneaker.description,
                                                textAlign: TextAlign.justify,
                                                maxLines: 5,
                                                style: appstyle(
                                                    12.8,
                                                    Colors.black,
                                                    FontWeight.normal),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 12),
                                                  child: CheckOutButton(
                                                    onTab: null,
                                                    lable: 'Add to card',
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            }));
  }
}
