import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_order/shared/buttons.dart';
import 'package:food_order/shared/title.dart';
import 'package:food_order/views/search_result.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            topBar(),
            searchBar(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: suggestedRestaurants(),
                  ),
                  
                  fastFood(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget topBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BackButton(),
          Text(
            "Search",
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 25, color: Colors.grey),
          ),
          Cartbutton()
        ],
      ),
    );
  }

  Widget searchBar() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      onSubmitted: (value){
        Get.to(()=> const Searchresult(), arguments: value);
      },
      decoration: const InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(10.0),
          child: FaIcon(FontAwesomeIcons.magnifyingGlass),
        ),
        fillColor: Color.fromARGB(150, 160, 165, 186),
        border: InputBorder.none,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        hintText: 'Search dishes, restaurants',
      ),
    );
  }

  Widget suggestedRestaurants() {
    List<Map<String, String>> restaurantList = [
      {"name": "Pansi Restaurant", "rating": "4.7"},
      {"name": "Pansi Restaurant", "rating": "4.7"},
      {"name": "Pansi Restaurant", "rating": "4.7"}
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectiontitle("Recent Keywords"),
          const SizedBox(height: 10.0),
         
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                keywordChip("Burger"),
                keywordChip("Pizza"),
                keywordChip("Dosa"),
                keywordChip("Pasta"),
              ],
            ),
          ),
           const SizedBox(height: 20.0,),
           sectiontitle("Suggested Restaurant"),
           
          ListView.builder(
            shrinkWrap: true,
            physics:const NeverScrollableScrollPhysics(),
            itemCount: restaurantList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset("assets/images/restaurant_image.jpeg")),
                title: Text(restaurantList[index]['name']!),
                subtitle: Text("Rating: ${restaurantList[index]['rating']}"),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget keywordChip(String keyword) {
    return Container(
      height: 40,
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.elliptical(20, 20)),
        border: Border.all(
            color: Colors.black, width: 1.0, style: BorderStyle.solid),
      ),
      child: Center(child: Text(keyword)),
    );
  }

  Widget fastFood() {
    return SliverPadding(
      padding: const EdgeInsets.all(10.0),

      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.7
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return SizedBox(
              height: 100,
              child: Card(
                
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                    Image.asset("assets/images/categories_images/category_04.png"),
                      const Text(
                        "European Pizza",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const Text(
                        "Uttra Coffee House",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          childCount: 10,
        ),
      ),
    );
  }

 
}
