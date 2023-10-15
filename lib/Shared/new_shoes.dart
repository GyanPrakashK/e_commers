import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewShoes extends StatelessWidget {
  const NewShoes({
    super.key,
    required this.imageurl,
  });
  final String imageurl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black45,
                spreadRadius: 1,
                blurRadius: 0.8,
                offset: Offset(0, 1))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      height: MediaQuery.of(context).size.height * .12,
      width: MediaQuery.of(context).size.width * .28,
      child: CachedNetworkImage(imageUrl: imageurl),
    );
  }
}
