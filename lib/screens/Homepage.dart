// import 'package:e_commers/Shared/appstyl.dart';

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commers/Models/sneakers_models.dart';
import 'package:e_commers/Servicers/helper.dart';
import 'package:e_commers/Shared/appstyl.dart';
import 'package:e_commers/Shared/home_pageWidget.dart';
import 'package:e_commers/controllers/fave_notif.dart';
import 'package:e_commers/controllers/product_providder.dart';
// import 'package:e_commers/Shared/new_shoes.dart';
// import 'package:e_commers/Shared/product_card.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
// import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  // final _favBox = Hive.box('fav_box');

  // late Future<List<Sneakers>> _male;
  // late Future<List<Sneakers>> _female;
  // late Future<List<Sneakers>> _kids;

  // void getMale() {
  //   _male = Helper().getMaleSneakers();
  // }

  // void getFemale() {
  //   _female = Helper().getFemaleSneakers();
  // }

  // void getKids() {
  //   _kids = Helper().getKidsSneakers();
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getMale();
  //   getKids();
  //   getFemale();
  // }

  @override
  Widget build(BuildContext context) {
    var productNotifer = Provider.of<ProductNotifer>(context);
    productNotifer.getFemale();
    productNotifer.getKids();
    productNotifer.getMale();
    var favoritesNotifire = Provider.of<FavoritesNotifier>(context);
    favoritesNotifire.getFavorites();
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
                child: Container(
                  padding: EdgeInsets.only(left: 8, bottom: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Athletics Shoes",
                        style: appstylewithHT(
                            42, Colors.white, FontWeight.bold, 1.5),
                      ),
                      Text(
                        "Collection",
                        style: appstylewithHT(
                            42, Colors.white, FontWeight.bold, 1.2),
                      ),
                      TabBar(
                          padding: EdgeInsets.zero,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.transparent,
                          controller: _tabController,
                          isScrollable: true,
                          labelColor: Colors.white,
                          labelStyle:
                              appstyle(24, Colors.white, FontWeight.bold),
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
                            )
                          ]),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.265),
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: TabBarView(controller: _tabController, children: [
                    HomePageWidget(
                      male: productNotifer.male,
                      tabindex: 0,
                    ),
                    HomePageWidget(
                      male: productNotifer.female,
                      tabindex: 1,
                    ),
                    HomePageWidget(
                      male: productNotifer.kids,
                      tabindex: 2,
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
