import 'package:e_commers/Models/sneakers_models.dart';
import 'package:e_commers/Servicers/helper.dart';
import 'package:e_commers/Shared/appstyl.dart';
import 'package:e_commers/Shared/latest_shoe.dart';
import 'package:e_commers/Shared/stagger_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class ProductByCard extends StatefulWidget {
  const ProductByCard({super.key});

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

  void getMale() {
    _male = Helper().getMaleSneakers();
  }

  void getFemale() {
    _female = Helper().getFemaleSneakers();
  }

  void getKids() {
    _kids = Helper().getKidsSneakers();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMale();
    getKids();
    getFemale();
  }

  @override
  Widget build(BuildContext context) {
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
                          onTap: () {},
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
                  malelatestshoes(male: _male),
                  malelatestshoes(male: _female),
                  malelatestshoes(male: _kids),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
