import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_order/shared/icon_text.dart';

class Productpage extends StatefulWidget {
  const Productpage({super.key});

  @override
  State<Productpage> createState() => _ProductpageState();
}

class _ProductpageState extends State<Productpage> {
  late IconData likeButtonIcon = FontAwesomeIcons.heart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 37.0, right: 24.0, left: 24.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: FaIcon(FontAwesomeIcons.arrowLeft),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: InkWell(
                                    child: FaIcon(
                                      likeButtonIcon,
                                      color: Colors.orange,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        likeButtonIcon =
                                            FontAwesomeIcons.solidHeart;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Image.asset(
                              "assets/images/categories_images/category_02.png",
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Burger Bistro",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      const SizedBox(height: 10.0),
                      const Icontext(
                        icon: FontAwesomeIcons.addressBook,
                        text: "Rose Garden",
                        textStyle: TextStyle(fontSize: 15),
                        iconColor: Colors.orange,
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icontext(
                            icon: FontAwesomeIcons.star,
                            text: '4.7',
                            iconColor: Colors.orange,
                            textStyle: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Icontext(
                            icon: FontAwesomeIcons.car,
                            text: 'Free',
                            iconColor: Colors.orange,
                            textStyle: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Icontext(
                            icon: FontAwesomeIcons.clock,
                            text: '20 min',
                            iconColor: Colors.orange,
                            textStyle: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "SIZE :",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizeInput(text: "10''"),
                          SizeInput(text: "14''"),
                          SizeInput(text: "16''"),
                        ],
                      ),
                      const Text("INGRDIENTS"),
                      IconButton(
                          onPressed: () {},
                          icon: const FaIcon(FontAwesomeIcons.addressCard)),
                      const SizedBox(height: 250), // Space for bottom fixed section
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '\$32',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Row(
                          children: [
                            IconButton(
                              color: Colors.grey,
                              icon: const Icon(Icons.remove),
                              onPressed: () {},
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: const Text(
                                '2',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 15.0),
                      backgroundColor: Colors.orange,
                    ),
                    child: const Text('ADD TO CART', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SizeInput extends StatelessWidget {
  final String text;
  final MaterialColor inputColor;
  const SizeInput(
      {super.key, required this.text, this.inputColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color.fromARGB(255, 206, 204, 204),
        ),
        child: Center(child: Text(text)),
      ),
      onTap: () {},
    );
  }
}
