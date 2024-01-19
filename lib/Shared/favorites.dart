import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commers/Models/constant.dart';
import 'package:e_commers/Shared/appstyl.dart';
import 'package:e_commers/controllers/fave_notif.dart';
import 'package:e_commers/screens/Mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final _favBox = Hive.box('fav_box');
  // _deleteFav(int key) async {
  //   await _favBox.delete(key);
  // }

  @override
  Widget build(BuildContext context) {
    var favoritesNotifire = Provider.of<FavoritesNotifier>(context);
    favoritesNotifire.getAllData();
    // List<dynamic> fav = [];
    // final favData = _favBox.keys.map((key) {
    //   final item = _favBox.get(key);
    //   return {
    //     "key": key,
    //     "id": item['id'],
    //     "name": item['name'],
    //     "category": item['category'],
    //     "price": item['price'],
    //     "imageUrl": item['imageUrl'],
    //   };
    // }).toList();
    // fav = favData.reversed.toList();
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 45, 0, 0),
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/top_image.png"),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'My Favorites',
                style: appstyle(40, Colors.white, FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: favoritesNotifire.fav.length,
              padding: EdgeInsets.only(top: 100),
              itemBuilder: (BuildContext context, int index) {
                final shoe = favoritesNotifire.fav[index];
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
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
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: CachedNetworkImage(
                                  imageUrl: shoe['imageUrl'],
                                  height: 70,
                                  width: 70,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12, left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      shoe['name'],
                                      style: appstyle(
                                          10, Colors.black, FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      shoe['category'],
                                      style: appstyle(
                                          12, Colors.grey, FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${shoe['price']}',
                                          style: appstyle(15, Colors.black,
                                              FontWeight.w500),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () {
                                favoritesNotifire.deleteFav(shoe['key']);
                                favoritesNotifire.ids.removeWhere(
                                    (element) => element == shoe['id']);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainScreen()));
                              },
                              child: Icon(Ionicons.heart_dislike),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
