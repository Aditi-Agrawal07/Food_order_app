import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommonButton extends StatelessWidget {
  final String btntext;
  final Future<void> Function() btnmethod;


  const CommonButton({
    super.key, 
    required this.btntext, 
    required this.btnmethod,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
         await btnmethod();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 100),
        ),
        child: Text(
          btntext, 
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class Cartbutton extends StatelessWidget {
  const Cartbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 38,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: const Center(
        child: FaIcon(
          FontAwesomeIcons.bagShopping,
          color: Colors.white,
        ),
      ),
    );
  }
}

class Backbutton extends StatelessWidget {
  final int? screenState;
  const Backbutton({super.key, this.screenState});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
     
    );
  }
}

class Searchbutton extends StatelessWidget {
  const Searchbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
      child: const Center(
        child: FaIcon(
          FontAwesomeIcons.magnifyingGlass,
          size: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}

class Filterbutton extends StatelessWidget {
  const Filterbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: const Center(
        child: FaIcon(
          FontAwesomeIcons.filter,
          size: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}

class Addbutton extends StatelessWidget {
  const Addbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.orange,
      ),
      child: const Center(
        child: FaIcon(
          FontAwesomeIcons.plus,
          size: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}

class SidebarButton extends StatelessWidget {
  const SidebarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 38,
      decoration: const BoxDecoration(
        color: Color.fromARGB(103, 160, 165, 186),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: const Center(
        child: FaIcon(FontAwesomeIcons.bars),
      ),
    );
  }
}
