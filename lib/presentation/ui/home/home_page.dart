import 'package:cached_network_image/cached_network_image.dart';
import 'package:exchange/data/models/crypto_model/crypto_data_model.dart';
import 'package:exchange/data/data_source/response_model.dart';
import 'package:exchange/presentation/helpers/decimal_rounder.dart';
import 'package:exchange/logic/providers/crypto_data_provider.dart';
import 'package:exchange/presentation/ui/widgets/home_page_view.dart';
import 'package:exchange/presentation/ui/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    TextTheme textTheme = Theme.of(context).textTheme;
    final CryptoDataProvider cryptoDataProvider =
        Provider.of<CryptoDataProvider>(context);
    double height = MediaQuery.of(context).size.height;

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
              //! Page View images
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                child: SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      //! show imaage
                      HomePageView(controller: _pageViewController),
                      //! Smooth page indicator
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

              // # marquee text
              SizedBox(
                height: 30,
                width: MediaQuery.of(context).size.width - 30,
                child: Marquee(
                  text: '🔊 this is place for news in application ',
                  scrollAxis: Axis.horizontal,
                  style: textTheme.bodySmall,
                  startAfter: const Duration(seconds: 3),
                  pauseAfterRound: const Duration(seconds: 3),
                ),
              ),

              // # buy & sell buttons
              Padding(
                padding: const EdgeInsets.only(right: 5, left: 5, top: 5),
                child: Row(
                  children: <Widget>[
                    // # button buy
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
                    // # button sell
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

              // # Choice chip
              Padding(
                padding: const EdgeInsets.only(right: 5, left: 8, top: 10),
                child: Row(
                  children: <Widget>[
                    Consumer<CryptoDataProvider>(builder: (BuildContext context,
                        CryptoDataProvider cryptoDataProvider, Widget? child) {
                      return Wrap(
                        spacing: 8,
                        children: List.generate(
                          choiceList.length,
                          (int index) {
                            return ChoiceChip(
                              label: Text(
                                choiceList[index],
                                style: textTheme.titleSmall,
                              ),
                              selected: cryptoDataProvider.defaultChoiceIndex ==
                                  index,
                              selectedColor: Colors.blue,
                              onSelected: (bool value) {
                                switch (index) {
                                  case 0:
                                    cryptoDataProvider.getTopMarketCapData();
                                    break;
                                  case 1:
                                    cryptoDataProvider.getTopGainersData();
                                    break;
                                  case 2:
                                    cryptoDataProvider.getTopLosersData();
                                    break;
                                }
                              },
                            );
                          },
                        ),
                      );
                    }),
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
                        List<CryptoDataModel> model = cryptoDataProvider
                            .dataFuture.data!.cryptoCurrencyList!;
                        return ListView.builder(
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            var number = index + 1;
                            var tokenId = model[index].id;

                            MaterialColor filterColor =
                                DecimalRounder.setColorFilter(
                                    model[index].quotes![0].percentChange24h);

                            var finalPrice = DecimalRounder.removePriceDecimals(
                                model[index].quotes![0].price);

                            //! percent change setup decimals and colors
                            var percentChange =
                                DecimalRounder.removePercentDecimals(
                                    model[index].quotes![0].percentChange24h);

                            Color percentColor =
                                DecimalRounder.setPercentChangesColor(
                                    model[index].quotes![0].percentChange24h);
                            Icon percentIcon =
                                DecimalRounder.setPercentChangesIcon(
                                    model[index].quotes![0].percentChange24h);

                            return SizedBox(
                              height: height * 0.075,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      number.toString(),
                                      style: textTheme.bodySmall,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 15),
                                    child: CachedNetworkImage(
                                        fadeInDuration:
                                            const Duration(milliseconds: 500),
                                        height: 32,
                                        width: 32,
                                        imageUrl:
                                            "https://s2.coinmarketcap.com/static/img/coins/32x32/$tokenId.png",
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) {
                                          return const Icon(Icons.error);
                                        }),
                                  ),
                                  //! name
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          model[index].name!,
                                          style: textTheme.bodySmall,
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                        ),
                                        Text(
                                          model[index].symbol!,
                                          style: textTheme.labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                            filterColor, BlendMode.srcATop),
                                        child: SvgPicture.network(
                                            "https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/$tokenId.svg")),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            "\$$finalPrice",
                                            style: textTheme.bodySmall,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              percentIcon,
                                              Text(
                                                "$percentChange%",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.ubuntu(
                                                  color: percentColor,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
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
