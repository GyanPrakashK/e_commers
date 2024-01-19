import 'package:e_commers/Models/sneakers_models.dart';
import 'package:e_commers/Servicers/helper.dart';
import 'package:e_commers/Shared/CategoryBtn.dart';
import 'package:e_commers/Shared/Custom_spacer.dart';
import 'package:e_commers/Shared/appstyl.dart';
import 'package:e_commers/Shared/latest_shoe.dart';
import 'package:e_commers/controllers/product_providder.dart';
// import 'package:e_commers/Shared/stagger_tile.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
// import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
// import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class ProductByCard extends StatefulWidget {
  const ProductByCard({
    super.key,
    required this.tabindex,
  });

  final int tabindex;

  @override
  State<ProductByCard> createState() => _ProductByCardState();
}

class _ProductByCardState extends State<ProductByCard>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kids;

  // void getMale() {
  //   _male = Helper().getMaleSneakers();
  // }

  // void getFemale() {
  //   _female = Helper().getFemaleSneakers();
  // }

  // void getKids() {
  //   _kids = Helper().getKidsSneakers();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController.animateTo(widget.tabindex, curve: Curves.easeIn);
    // getMale();
    // getKids();
    // getFemale();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<String> brand = [
    "assets/images/adidas.png",
    "assets/images/gucci.png",
    "assets/images/jordan.png",
    "assets/images/nike.png",
  ];

  @override
  Widget build(BuildContext context) {
    var productNotifer = Provider.of<ProductNotifer>(context);
    productNotifer.getFemale();
    productNotifer.getKids();
    productNotifer.getMale();
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/top_image.png"),
                      fit: BoxFit.fill)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Ionicons.close,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: Icon(
                            FontAwesomeIcons.sliders,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  TabBar(
                      padding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Colors.white,
                      labelStyle: appstyle(24, Colors.white, FontWeight.bold),
                      unselectedLabelColor: Colors.green.withOpacity(0.3),
                      tabs: [
                        Tab(
                          text: "Men's Shoes",
                        ),
                        Tab(
                          text: "Women's Shoes",
                        ),
                        Tab(
                          text: "Kid's Shoes",
                        ),
                      ]),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .2,
                  left: 16,
                  right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: TabBarView(controller: _tabController, children: [
                  malelatestshoes(male: productNotifer.male),
                  malelatestshoes(male: productNotifer.female),
                  malelatestshoes(male: productNotifer.kids),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double _value = 100;
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white54,
        builder: (context) => Container(
              height: MediaQuery.of(context).size.height * .80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 5,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .7,
                    child: Column(
                      children: [
                        CustomSpacer(),
                        Text(
                          "filter",
                          style: appstyle(40, Colors.black, FontWeight.bold),
                        ),
                        CustomSpacer(),
                        Text(
                          "Gender",
                          style: appstyle(20, Colors.black, FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            CategoryBtn(buttonClr: Colors.black, label: "Men"),
                            CategoryBtn(buttonClr: Colors.grey, label: "Women"),
                            CategoryBtn(buttonClr: Colors.grey, label: "Kids"),
                          ],
                        ),
                        CustomSpacer(),
                        Text(
                          "category",
                          style: appstyle(20, Colors.black, FontWeight.bold),
                        ),
                        CustomSpacer(),
                        Row(
                          children: [
                            CategoryBtn(
                                buttonClr: Colors.black, label: "Shoes"),
                            CategoryBtn(
                                buttonClr: Colors.grey, label: "Apparrels"),
                            CategoryBtn(
                                buttonClr: Colors.grey, label: "Accessories"),
                          ],
                        ),
                        CustomSpacer(),
                        Text(
                          "Price",
                          style: appstyle(18, Colors.black, FontWeight.bold),
                        ),
                        Slider(
                            value: _value,
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            thumbColor: Colors.black,
                            max: 500,
                            divisions: 50,
                            label: _value.toString(),
                            secondaryTrackValue: 200,
                            onChanged: (double value) {}),
                        CustomSpacer(),
                        Text(
                          "Brand",
                          style: appstyle(20, Colors.black, FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          height: 67,
                          child: ListView.builder(
                            itemCount: brand.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.all(8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  child: Image.asset(
                                    brand[index],
                                    height: 60,
                                    width: 80,
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
