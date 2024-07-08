import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
        
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset("assets/images/restaurant_image.jpeg"),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              Text("Rose Garden Restaurant"),
              Text("Burger - pizza - chinese")
            ]),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 8.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                          child: FaIcon(FontAwesomeIcons.star,
                              color: Colors.orange)),
                      TextSpan(
                        text: "4.7",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                          child: FaIcon(FontAwesomeIcons.car,
                              color: Colors.orange)),
                      TextSpan(
                        text: "Free",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                          child: FaIcon(FontAwesomeIcons.clock,
                              color: Colors.orange)),
                      TextSpan(
                        text: "20 min",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

 