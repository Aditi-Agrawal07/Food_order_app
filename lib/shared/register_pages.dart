import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_order/shared/buttons.dart';

class Commonregisterpage extends StatelessWidget {
  final Widget customForm;
  final String formtitle;
  final String formSubtitle;
  const Commonregisterpage({super.key,required this.customForm, required this.formtitle, required this.formSubtitle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       
        Container(
            padding: const EdgeInsets.only(top: 110),
            color: const Color.fromARGB(255, 30, 30, 46),
            height: double.infinity,
            width: double.infinity,
            child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                 
                    Text(
                      formtitle,
                      style: const TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontFamily: "Sen",
                          fontSize: 30),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      formSubtitle,
                      style: const TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontFamily: "Sen",
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    )
                  ],
                ))),
                const Positioned(
                 top: 40,
                 left: 15,
                  child: FaIcon(FontAwesomeIcons.arrowLeft),),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
         
          child: Container(
            height: 550,
            width: 360,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
            child: customForm,
          ),
        )
      ],
    );
  }
}