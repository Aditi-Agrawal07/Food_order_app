import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_order/shared/icon_text.dart';

class Resturantview extends StatelessWidget {
  const Resturantview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Image.asset(
              "assets/images/restaurant_image.jpeg",
              height: 300,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackButton(),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.ellipsis,
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icontext(
                      icon: FontAwesomeIcons.star,
                      iconColor: Colors.orange,
                      text: "4.7",
                      textStyle: TextStyle(fontWeight: FontWeight.w600)),
                  Icontext(
                      icon: FontAwesomeIcons.truck,
                      text: "Free",
                      iconColor: Colors.orange,
                      textStyle: TextStyle(fontWeight: FontWeight.w600)),
                  Icontext(
                      icon: FontAwesomeIcons.clock,
                      text: "20 min",
                      iconColor: Colors.orange,
                      textStyle: TextStyle(fontWeight: FontWeight.w600))
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Spicy Restaurant",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        )
      ],
    ));
  }
}
