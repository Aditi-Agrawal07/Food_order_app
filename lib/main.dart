import 'package:flutter/material.dart';
import 'package:food_order/views/home_screen.dart';
import 'package:food_order/views/location.dart';
import 'package:food_order/views/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food Deliver',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const SplashScreen(),
      getPages: [
        GetPage(
          name: '/location',
          page: ()=> const Locationpage(),
        ),
        GetPage(name: "/home", page: ()=>const HomeScreen()
        )
      

      ]
    );
  }
}

