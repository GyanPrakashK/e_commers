import 'package:flutter/services.dart' as the_bundle;
import 'package:e_commers/Models/sneakers_models.dart';

class Helper {
  Future<List<Sneakers>> getMaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
    final maleList = sneakersFromJson(data);
    return maleList;
  }



  Future<List<Sneakers>> getFemaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");
    final femaleList = sneakersFromJson(data);
    return femaleList;
  }



  Future<List<Sneakers>> getKidsSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");
    final kidsList = sneakersFromJson(data);
    return kidsList;
  }



  Future<Sneakers> getKidsSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");
    final kidsList = sneakersFromJson(data);
    final sneakers = kidsList.firstWhere((sneakers) => sneakers.id == id);
    return sneakers;
  }





  Future<Sneakers> getMensSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
    final kidsList = sneakersFromJson(data);
    final sneakers = kidsList.firstWhere((sneakers) => sneakers.id == id);
    return sneakers;
  }




  Future<Sneakers> getWomenSneakersById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");
    final kidsList = sneakersFromJson(data);
    final sneakers = kidsList.firstWhere((sneakers) => sneakers.id == id);
    return sneakers;
  }


}







