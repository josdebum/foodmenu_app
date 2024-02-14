
import 'package:flutter/material.dart';
import 'package:foodmenu_app/provider.dart';
import 'package:provider/provider.dart';

class FavouriteFoodScreen extends StatefulWidget {
  const FavouriteFoodScreen({
    super.key,
  });

  @override
  State<FavouriteFoodScreen> createState() => _FavouriteFoodScreenState();
}

class _FavouriteFoodScreenState extends State<FavouriteFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favourite Foods"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Consumer<FoodProvider>(
                builder: (context, data, child) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: data.favouriteFruits.length,
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
                                      image: AssetImage(
                                          data.favouriteFruits[index].image!),
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
                                  bottom: 30,
                                  left: 10,
                                  right: 10,
                                  child: Text(
                                    data.favouriteFruits[index].name!,
                                    maxLines: 3,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  )),
                            ]);
                          },
                        )
                      ],
                    ))),
      ),
    );
  }
}
