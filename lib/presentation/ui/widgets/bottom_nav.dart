import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final PageController controller;
  const BottomNav({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      color: Colors.amber,
      child: SizedBox(
        height: 63,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 50,
              width: width / 2 - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        controller.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Icon(Icons.home)),
                  IconButton(
                      onPressed: () {
                        controller.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Icon(Icons.bar_chart)),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: width / 2 - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        controller.animateToPage(
                          2,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Icon(Icons.account_circle_rounded)),
                  IconButton(
                      onPressed: () {
                        controller.animateToPage(
                          3,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Icon(Icons.bookmark)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
