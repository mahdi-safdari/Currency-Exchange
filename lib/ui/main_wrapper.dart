import 'package:exchange/ui/home_page.dart';
import 'package:exchange/ui/market_view_page.dart';
import 'package:exchange/ui/profile_page.dart';
import 'package:exchange/ui/watch_list_page.dart';
import 'package:exchange/ui/widgets/bottom_nav.dart';
import 'package:exchange/ui/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({super.key});

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: const <Widget>[
          ThemeSwitcher(),
        ],
        title: const Text('Exchange'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.compare_arrows_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNav(controller: pageController),
      body: PageView(
        controller: pageController,
        children: const <Widget>[
          HomePage(),
          MarketViewPage(),
          ProfilePage(),
          WatchListPage(),
        ],
      ),
    );
  }
}
