import 'package:exchange/data/repositories/response_model.dart';
import 'package:exchange/providers/crypto_data_provider.dart';
import 'package:exchange/ui/widgets/home_page_view.dart';
import 'package:exchange/ui/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageViewController = PageController(initialPage: 0);
  int defaultChoiceIndex = 0;
  final List<String> choiceList = [
    'Top MarketCaps',
    'Top Gainers',
    'Top Losers'
  ];
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    TextTheme textTheme = Theme.of(context).textTheme;
    final cryptoDataProvider = Provider.of<CryptoDataProvider>(context);

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

              //! marquee text
              SizedBox(
                height: 30,
                width: MediaQuery.of(context).size.width - 30,
                child: Marquee(
                  text: '💵 Mahdi Safdari is Billionaire Dollar   ',
                  scrollAxis: Axis.horizontal,
                  style: textTheme.bodySmall,
                  startAfter: const Duration(seconds: 3),
                  pauseAfterRound: const Duration(seconds: 3),
                ),
              ),

              //! buy & sell buttons
              Padding(
                padding: const EdgeInsets.only(right: 5, left: 5, top: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          backgroundColor: Colors.green,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        child: const Text('buy'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.all(20),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        child: const Text('sell'),
                      ),
                    ),
                  ],
                ),
              ),

              //! Choice chip
              Padding(
                padding: const EdgeInsets.only(right: 5, left: 8, top: 10),
                child: Row(
                  children: <Widget>[
                    Wrap(
                      spacing: 8,
                      children: List.generate(
                        choiceList.length,
                        (int index) {
                          return ChoiceChip(
                            label: Text(
                              choiceList[index],
                              style: textTheme.titleSmall,
                            ),
                            selected: defaultChoiceIndex == index,
                            selectedColor: Colors.blue,
                            onSelected: (bool value) {
                              setState(
                                () {
                                  defaultChoiceIndex =
                                      value ? index : defaultChoiceIndex;
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              //! crypto data provider
              SizedBox(
                height: 500,
                child: Consumer<CryptoDataProvider>(
                  builder: (BuildContext context,
                      CryptoDataProvider cryptoDataProvider, Widget? child) {
                    switch (cryptoDataProvider.state.status) {
                      case Status.LOADING:
                        //! Shimmer effect loading
                        return SizedBox(
                          height: 80,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.shade400,
                            highlightColor: Colors.white,
                            child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 8.0, bottom: 8.0, left: 8.0),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 30,
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8.0, left: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              width: 50,
                                              height: 15,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: SizedBox(
                                                width: 25,
                                                height: 15,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: SizedBox(
                                        width: 70,
                                        height: 40,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            SizedBox(
                                              width: 50,
                                              height: 15,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: SizedBox(
                                                width: 25,
                                                height: 15,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      case Status.COMPLETED:
                        return const Text("done.");
                      case Status.ERROR:
                        return Text(cryptoDataProvider.state.message);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
