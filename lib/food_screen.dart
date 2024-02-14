import 'package:foodmenu_app/favourite_food_screen.dart';
import 'package:foodmenu_app/model.dart';
import 'package:foodmenu_app/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  void initState() {
    super.initState();
  }

  final controller = ScrollController();
  List<FoodModel> foods = [
    FoodModel(
        name: "Amala and Egusi soup",
        favourite: false,
        image: "assets/images/amala_egusi.jpeg"),
    FoodModel(
        name: "Beans and Bread",
        favourite: false,
        image: "assets/images/beans_bread.jpeg"),
    FoodModel(
        name: "Eba and Efo riro",
        favourite: false,
        image: "assets/images/eba_eforiro.jpeg"),
    FoodModel(
        name: "Fried Rice and Chicken",
        favourite: false,
        image: "assets/images/friedrice_chicken.jpeg"),
    FoodModel(
        name: "Garrium with berries",
        favourite: false,
        image: "assets/images/garri_berries.jpeg"),
    FoodModel(
        name: "Jollof Rice and Chicken",
        favourite: false,
        image: "assets/images/jollofrice_chicken.jpeg"),
    FoodModel(
        name: "Burger",
        favourite: false,
        image: "assets/images/hand_burger.jpeg"),
    FoodModel(
        name: "Noodles",
        favourite: false,
        image: "assets/images/noodles.jpeg"),
    FoodModel(
        name: "MeatPie", favourite: false, image: "assets/images/meatpie.jpeg"),
    FoodModel(
        name: "Ofada Rice",
        favourite: false,
        image: "assets/images/ofadarice.jpeg"),
    FoodModel(
        name: "Okro Soup",
        favourite: false,
        image: "assets/images/okro_soup.jpeg"),
    FoodModel(
        name: "Pap and Akara",
        favourite: false,
        image: "assets/images/pap_akara.jpeg"),
    FoodModel(
        name: "White rice and stew",
        favourite: false,
        image: "assets/images/whiterice_stew.jpeg"),
    FoodModel(
        name: "Pounded yam and egusi",
        favourite: false,
        image: "assets/images/poundedyam_egusi.jpeg"),
    FoodModel(
        name: "Spaghetti",
        favourite: false,
        image: "assets/images/spaghetti.jpeg"),
    FoodModel(
        name: "Salad", favourite: false, image: "assets/images/salad.jpeg"),
    FoodModel(
        name: "Amala and Egusi soup",
        favourite: false,
        image: "assets/images/amala_egusi.jpeg"),
  FoodModel(
        name: "Spaghetti",
        favourite: false,
        image: "assets/images/spaghetti_2.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Menu List"),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FavouriteFoodScreen(
                                )));
                  },
                  child: const Icon(Icons.favorite))),
        ],
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Consumer<FoodProvider>(
                builder: (context, data, child) => GridView.builder(
                      shrinkWrap: true,
                      itemCount: foods.length,
                      controller: controller,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.86,
                              mainAxisSpacing: 10),
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(children: <Widget>[
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.7))
                                ],
                                image: DecorationImage(
                                  image: AssetImage(foods[index].image!),
                                  fit: BoxFit.fill,
                                )),
                          ),
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.24),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Positioned(
                              bottom: 20,
                              left: 10,
                              right: 10,
                              child: Text(
                                foods[index].name!,
                                maxLines: 3,
                                style: const TextStyle(
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              )),
                          Positioned(
                              top: 10,
                              right: 0,
                              child:
                                  data.favouriteFruits.contains(foods[index]) ==
                                          false
                                      ? IconButton(
                                          icon: const Icon(Icons.favorite_border,
                                              color: Colors.red),
                                          onPressed: () {
                                            data.addFood(foods[index]);
                                          },
                                        )
                                      : IconButton(
                                          icon: const Icon(Icons.favorite,
                                              color: Colors.red),
                                          onPressed: () {
                                            data.removeFood(foods[index]);
                                          },
                                        ))
                        ]);
                      },
                    ))),

    ));
  }
}
