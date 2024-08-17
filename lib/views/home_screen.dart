import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_order/controller/restaurant_controller.dart';
import 'package:food_order/shared/buttons.dart';
import 'package:food_order/shared/restaurant_card.dart';
import 'package:food_order/views/search_screen.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? streetName;
  String? locality;
  String? pincode;

  final RestaurnatController controller = Get.put(RestaurnatController());

  @override
  void initState() {
    super.initState();
    // Fetch or assign values to streetName, locality, and pincode
    final arguments = Get.arguments as Map<String, dynamic>?;
    final Placemark firstPlacemark = arguments?['firstplacemark'];
    streetName = firstPlacemark.street;
    locality = firstPlacemark.locality;
    pincode = firstPlacemark.postalCode;
    print(pincode);

    controller.getRestaurnats(pinCode: pincode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        // title: topBar(),
        centerTitle: true,
      ),
      body: Obx(() {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              toolbarHeight: 100,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hey Halal, Good Afternoon!',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const SearchScreen());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(150, 160, 165, 186),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.magnifyingGlass,
                              color: Colors.black,
                              size: 16,
                            ),
                            SizedBox(width: 10),
                            Text('Search dishes, restaurants',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              expandedHeight: 100,
              
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    categories(),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final restaurant = controller.restaurantList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: RestaurantCard(restaurnatData: restaurant,),
                  );
                },
                childCount: controller.restaurantList.length,
              ),
            ),
          ],
        );
      }),
    );
  }

  // Widget topBar() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       SidebarButton(),
  //       Column(children: [
  //         const RichText(
  //             text: TextSpan(
  //                 text: "Deliver To",
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.orange,
  //                     fontSize: 20))),
  //         RichText(
  //             text: TextSpan(
  //                 text: '$streetName, $locality',
  //                 style: const TextStyle(
  //                     fontWeight: FontWeight.bold, color: Colors.orange)))
  //       ]),
  //       const CartButton()
  //     ],
  //   );
  // }

  Widget searchBar() {
    return TextField(
        decoration: const InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.all(10.0),
            child: FaIcon(FontAwesomeIcons.magnifyingGlass),
          ),
          fillColor: Color.fromARGB(150, 160, 165, 186),
          border: InputBorder.none,
          filled: true,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          hintText: 'Search dishes, restaurants',
        ),
        onTap: () {
          Get.to(() => const SearchScreen());
        });
  }

  Widget categories() {
    List<Map<String, String>> categoryList = [
      {
        "name": "French Fries",
        "image": "assets/images/categories_images/category_01.png"
      },
      {
        "name": "Milk shake",
        "image": "assets/images/categories_images/category_02.png"
      },
      {
        "name": "Paneer",
        "image": "assets/images/categories_images/category_03.png"
      },
      {
        "name": "Idli",
        "image": "assets/images/categories_images/category_04.png"
      },
      {
        "name": "Pizza",
        "image": "assets/images/categories_images/category_05.png"
      },
      {
        "name": "Tea",
        "image": "assets/images/categories_images/category_06.png"
      },
      {
        "name": "Dal",
        "image": "assets/images/categories_images/category_07.png"
      },
      {
        "name": "Chinese",
        "image": "assets/images/categories_images/category_08.png"
      }
    ];
    return Column(
      children: [
        const SectionTitle(title: "All categories"),
        const SizedBox(height: 20),
        SizedBox(
          height: 250,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 47.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        AssetImage(categoryList[index]['image']!),
                  ),
                  const SizedBox(height: 3.0),
                  Text(
                    categoryList[index]['name']!,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  )
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text(
            'See All',
            style: TextStyle(fontSize: 14, color: Colors.orange),
          ),
        ],
      ),
    );
  }
}
