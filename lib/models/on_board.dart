class OnBoard{
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description
  });

  
}

final List<OnBoard> onBoardData = [
  OnBoard(
    image: 'assets/images/onBoarding_images/onBoarding01.png',
    title: 'All your Favourite',
    description: "Get all your loved foods in one once place,you just place the orer we do the rest",
  ),
  OnBoard(
    image: 'assets/images/onBoarding_images/onBoarding02.png',
    title: 'Order from choosen chef',
    description: "Get all your loved foods in one once place,you just place the orer we do the rest",

  ),
  OnBoard(
    image: 'assets/images/onBoarding_images/onBoarding03.png',
    title: 'Free delivery offers',
    description: "Get all your loved foods in one once place,you just place the orer we do the rest",
  ),
];