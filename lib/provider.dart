import 'package:foodmenu_app/model.dart';
import 'package:flutter/material.dart';

class FoodProvider extends ChangeNotifier {
  bool isFundWallet = false;
  final List<FoodModel> favouriteFruits = [];
  String? error;

  void addFood(FoodModel food) {
   if ( favouriteFruits.contains(food)) {}
    else{
    favouriteFruits.add(food);
    favouriteFruits == favouriteFruits.toSet().toList();

    notifyListeners();
  }}
  void removeFood(FoodModel food) {
      favouriteFruits.remove(food);
      favouriteFruits == favouriteFruits.toSet().toList();
      notifyListeners();
    }
}