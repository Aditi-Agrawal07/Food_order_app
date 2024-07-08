import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_order/views/on_boarding.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    // HelperFunctions().getCurrentLocation();
super.initState();

Timer(const Duration(seconds: 3), (){
  Get.to(()=>const OnBoardingScreen());

});

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
            child: Image.asset('assets/images/logo.png',width: 100,height: 100,)),
    );
  }
}