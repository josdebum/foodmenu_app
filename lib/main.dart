
import 'package:foodmenu_app/food_screen.dart';
import 'package:foodmenu_app/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => FoodProvider()),
    ],
    child: const MyApp()
  ));

}

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => FoodProvider(),
//       child: const MyApp(),
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FoodMenu App",
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
      home: const FoodScreen()
    );
  }
}



