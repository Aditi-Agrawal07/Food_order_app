import 'package:flutter/material.dart';
import 'package:food_order/models/on_board.dart';
import 'package:food_order/views/auth_screen.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
   bool _isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onBoardData.length,
            onPageChanged: (index){
              setState(() {
                _isLastPage = index == onBoardData.length -1;
              });
            },
            itemBuilder: (context,index){
              return Onboarding(
               page: onBoardData,
               currentIndex: index);
            },
          
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child:  Column(
                 children: [
                  
                  SmoothPageIndicator(
                       controller: _pageController,
                       count: onBoardData.length,
                       effect: const WormEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Colors.orange,
                        dotHeight: 12,
                        dotWidth: 12
                       ),
                  ),
                  const SizedBox(height: 200,),
                  ElevatedButton(
                    onPressed:(){
                         if(_isLastPage){
                    Get.to(()=> const AuthScreen());
                    }else{
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                    }
                    } ,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 100)
                  ), 
                    child: Text(_isLastPage? 'Get started': 'Next', 
                                style: const TextStyle(color: Colors.white),),),
                  TextButton(onPressed: (){
                 
                       _pageController.nextPage(
                            duration:const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                    
                  }, child: Text(_isLastPage ? '':'skip'))
                 ],))

          
        ],
      ),
    );
  }
}

class Onboarding extends StatelessWidget {
final List<OnBoard> page;
final int currentIndex;

  const Onboarding({super.key, 
        required this.page,
        required this.currentIndex});

  @override
  Widget build(BuildContext context) {

    final OnBoard data = page[currentIndex];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Image.asset(
            data.image,
            height: 500,
          ),
          Text(
            data.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
         const  SizedBox(height: 10,),
          Text(
            data.description,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15,),
        ],
      ),
    );
  }
}
