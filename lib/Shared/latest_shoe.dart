import 'package:e_commers/Models/sneakers_models.dart';
import 'package:e_commers/Shared/stagger_tile.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';


class malelatestshoes extends StatelessWidget {
  const malelatestshoes({
    super.key,
    required Future<List<Sneakers>> male,
  }) : _male = male;

  final Future<List<Sneakers>> _male;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneakers>>(
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
            return StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
              itemCount: male!.length,
              scrollDirection: Axis.vertical,
              staggeredTileBuilder: (index) => StaggeredTile.extent(
                  (index % 2 == 0) ? 1 : 1,
                  (index % 4 == 1 || index % 4 == 3)
                      ? MediaQuery.of(context).size.height * .35
                      : MediaQuery.of(context).size.height * .3),
              itemBuilder: (BuildContext context, int index) {
                final shoe = snapshot.data![index];
                return StaggerTile(
                    imageurl: shoe.imageUrl[1],
                    name: shoe.name,
                    price: shoe.price);
              },
            );
          }
        });
  }
}
