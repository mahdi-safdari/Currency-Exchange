// # id : 1
// # name : "Bitcoin"
// # symbol : "BTC"
// # slug : "bitcoin"
// # cmcRank : 1
// # marketPairCount : 9226
// # circulatingSupply : 18981025.00000000
// # selfReportedCirculatingSupply : 0
// # totalSupply : 18981025.00000000
// # maxSupply : 2.1E+7
// # ath : 68789.625938922131334232
// # atl : 65.526000976562500000
// # high24h : 40081.679254257200000000
// # low24h : 38432.931633910060000000
// # isActive : 1
// # lastUpdated : "2022-03-12T09:23:00.000Z"
// # dateAdded : "2013-04-28T00:00:00.000Z"
// # quotes : [{"name":"USD","price":39144.775449462126000000000000,"volume24h":23301890066.89607239,"volume7d":174686950923.67400537,"volume30d":703067717071.67283326,"marketCap":743007961425.62685015915000000000000000000000,"selfReportedMarketCap":0E-24,"percentChange1h":0.31370907,"percentChange24h":0.04596212,"percentChange7d":0.28884588,"lastUpdated":"2022-03-12T09:23:00.000Z","percentChange30d":-11.66603041,"percentChange60d":-6.72707190,"percentChange90d":-20.21373828,"fullyDilluttedMarketCap":822040284438.70,"marketCapByTotalSupply":743007961425.62685015915000000000000000000000,"dominance":42.5432,"turnover":0.03136156,"ytdPriceChangePercentage":-17.9128}]
// # isAudited : false

class CryptoDataModel {
  final int? id;
  final String? name;
  final String? symbol;
  final String? slug;
  final int? cmcRank;
  final int? marketPairCount;
  final double? circulatingSupply;
  final int? selfReportedCirculatingSupply;
  final double? totalSupply;
  final double? maxSupply;
  final double? ath;
  final double? atl;
  final double? high24h;
  final double? low24h;
  final int? isActive;
  final String? lastUpdated;
  final String? dateAdded;
  final List<Quotes>? quotes;
  final bool? isAudited;
  CryptoDataModel({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.cmcRank,
    this.marketPairCount,
    this.circulatingSupply,
    this.selfReportedCirculatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.atl,
    this.high24h,
    this.low24h,
    this.isActive,
    this.lastUpdated,
    this.dateAdded,
    this.quotes,
    this.isAudited,
  });

  factory CryptoDataModel.fromJson(Map<String, dynamic> json) {
    final quotesList = json["quotes"] as List?;
    final quotes = quotesList?.map((e) => Quotes.fromJson(e)).toList();
    return CryptoDataModel(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      slug: json['slug'],
      cmcRank: json['cmcRank'],
      marketPairCount: json['marketPairCount'],
      circulatingSupply: json['circulatingSupply'].toDouble(),
      totalSupply: json['totalSupply'],
      isAudited: json['isAudited'],
      ath: json['ath'],
      atl: json['atl'],
      high24h: json['high24h'],
      low24h: json['low24h'],
      isActive: json['isActive'],
      lastUpdated: json['lastUpdated'],
      dateAdded: json['dateAdded'],
      maxSupply: json['maxSupply'],
      selfReportedCirculatingSupply: json['selfReportedCirculatingSupply'],
      quotes: quotes,
    );
  }
}

// # name : "USD"
// # price : 39144.775449462126000000000000
// # volume24h : 23301890066.89607239
// # volume7d : 174686950923.67400537
// # volume30d : 703067717071.67283326
// # marketCap : 743007961425.62685015915000000000000000000000
// # selfReportedMarketCap : 0E-24
// # percentChange1h : 0.31370907
// # percentChange24h : 0.04596212
// # percentChange7d : 0.28884588
// # lastUpdated : "2022-03-12T09:23:00.000Z"
// # percentChange30d : -11.66603041
// # percentChange60d : -6.72707190
// # percentChange90d : -20.21373828
// # fullyDilluttedMarketCap : 822040284438.70
// # marketCapByTotalSupply : 743007961425.62685015915000000000000000000000
// # dominance : 42.5432
// # turnover : 0.03136156
// # ytdPriceChangePercentage : -17.9128

class Quotes {
  final String? name;
  final double? price;
  final double? volume24h;
  final double? volume7d;
  final double? volume30d;
  final double? marketCap;
  final double? selfReportedMarketCap;
  final double? percentChange1h;
  final double? percentChange24h;
  final double? percentChange7d;
  final String? lastUpdated;
  final double? percentChange30d;
  final double? percentChange60d;
  final double? percentChange90d;
  final double? fullyDilluttedMarketCap;
  final double? marketCapByTotalSupply;
  final double? dominance;
  final double? turnover;
  final double? ytdPriceChangePercentage;
  Quotes({
    this.name,
    this.price,
    this.volume24h,
    this.volume7d,
    this.volume30d,
    this.marketCap,
    this.selfReportedMarketCap,
    this.percentChange1h,
    this.percentChange24h,
    this.percentChange7d,
    this.lastUpdated,
    this.percentChange30d,
    this.percentChange60d,
    this.percentChange90d,
    this.fullyDilluttedMarketCap,
    this.marketCapByTotalSupply,
    this.dominance,
    this.turnover,
    this.ytdPriceChangePercentage,
  });

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(
      name: json['name'],
      price: json['price'],
      volume24h: json['volume24h'],
      volume7d: json['volume7d'],
      volume30d: json['volume30d'],
      marketCap: json['marketCap'].toDouble(),
      selfReportedMarketCap: json['selfReportedMarketCap'].toDouble(),
      percentChange1h: json['percentChange1h'],
      percentChange24h: json['percentChange24h'],
      percentChange7d: json['percentChange7d'],
      lastUpdated: json['lastUpdated'],
      percentChange30d: json['percentChange30d'],
      percentChange60d: json['percentChange60d'],
      percentChange90d: json['percentChange90d'],
      fullyDilluttedMarketCap: json['fullyDilluttedMarketCap'],
      marketCapByTotalSupply: json['marketCapByTotalSupply'],
      dominance: json['dominance'].toDouble(),
      turnover: json['turnover'],
      ytdPriceChangePercentage: json['ytdPriceChangePercentage'],
    );
  }
}
