import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  final PageController controller;
  const HomePageView({super.key, required this.controller});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  var images = [
    'assets/images/a1.png',
    'assets/images/a2.png',
    'assets/images/a3.png',
    'assets/images/a4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.controller,
      allowImplicitScrolling: true,
      children: [
        myPages(images[0]),
        myPages(images[1]),
        myPages(images[2]),
        myPages(images[3]),
      ],
    );
  }
}

Widget myPages(String image) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
      child: Image(
        image: AssetImage(image),
        fit: BoxFit.fill,
      ),
    ),
  );
}
