import 'package:exchange/ui/widgets/home_page_view.dart';
import 'package:exchange/ui/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageViewController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    TextTheme textTheme = Theme.of(context).textTheme;
    final List<String> choiceList = [
      'Top MarketCaps',
      'Top Gainers',
      'Top Losers'
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: const <Widget>[
          ThemeSwitcher(),
        ],
        title: const Text('Exchange'),
      ),
      drawer: const Drawer(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //! Page View
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                child: SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      HomePageView(controller: _pageViewController),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SmoothPageIndicator(
                            controller: _pageViewController,
                            count: 4,
                            effect: const ExpandingDotsEffect(
                              dotWidth: 7,
                              dotHeight: 7,
                              spacing: 3,
                            ),
                            onDotClicked: (index) =>
                                _pageViewController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.bounceOut,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
