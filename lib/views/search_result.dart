import 'package:flutter/material.dart';
import 'package:food_order/shared/buttons.dart';
import 'package:food_order/shared/restaurant_card.dart';
import 'package:food_order/shared/title.dart';
import 'package:food_order/views/product_screen.dart';
import 'package:food_order/views/restaurant_screen.dart';
import 'package:get/get.dart';

class Searchresult extends StatefulWidget {
  const Searchresult({super.key});

  @override
  State<Searchresult> createState() => _SearchresultState();
}

class _SearchresultState extends State<Searchresult> {
  final searchResult = Get.arguments as String;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Backbutton(),
        ),
        title: Container(
          height: 45,
          width: 102,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(33.0)
          ),
          child:  Center(child: Text(searchResult.toUpperCase(), style: const TextStyle(fontSize: 14))),
        
        ),
        
        actions: const [
          Searchbutton(),
          SizedBox(width: 10,),
          Filterbutton()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
             sectiontitle("Popular $searchResult"),
             Expanded(
               child: CustomScrollView(
                 slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(10.0),
                    sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65),
                    delegate: SliverChildBuilderDelegate(
                      (context,index){
                       return  InkWell(
                        onTap: (){
                          Get.to(()=>const Productpage());
                          },
                         child: Card(
                                               
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                                          children: [
                                Image.asset("assets/images/categories_images/category_03.png"),
                                const Text("Pizza"),
                                const Text("ABC Restaurnat"),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("120"),
                                    Addbutton()
                                  ],
                                )
                                                          ],
                                                  
                                                   ),
                              ),
                                                ),
                       );
                       
                    },
                    childCount: 4
                    ),
                  
                    
                                     ),
                  ),
                  SliverList(delegate: SliverChildBuilderDelegate(
                    (context,index){
                      return Padding(
                  padding:
                     const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: InkWell(
                    onTap: (){
                      Get.to(()=>const Resturantview());
                    },
                    child: const RestaurantCard(restaurnatData: {},)),
                  
                );
                    }
                  ))
                 ] 
               ),
             )
             ],
          
        ),
      ),
    );
  }

 
}
