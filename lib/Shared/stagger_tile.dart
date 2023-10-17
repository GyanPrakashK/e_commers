import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commers/Shared/appstyl.dart';
import 'package:flutter/material.dart';

class StaggerTile extends StatefulWidget {
  const StaggerTile(
      {super.key,
      required this.imageurl,
      required this.name,
      required this.price});

  final String imageurl;
  final String name;
  final String price;

  @override
  State<StaggerTile> createState() => _StaggerTileState();
}

class _StaggerTileState extends State<StaggerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.imageurl,
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.only(top: 12),
              height: 70,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style:
                          appstylewithHT(20, Colors.black, FontWeight.w700, 1),
                    ),
                    Text(
                      "\$${widget.price} ",
                      style:
                          appstylewithHT(18, Colors.black, FontWeight.w500, 1),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
