import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commers/Models/sneakers_models.dart';
import 'package:e_commers/Servicers/helper.dart';
import 'package:e_commers/controllers/product_providder.dart';
import 'package:flutter/material.dart';
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
                                                ))
                                          ],
                                        );
                                      }),
                                )
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
