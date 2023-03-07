import 'package:exchange/data/models/crypto_model/crypto_data_model.dart';

import 'Status.dart';

// # status : {"timestamp":"2022-03-12T09:24:55.291Z","error_code":"0","error_message":"SUCCESS","elapsed":"31","credit_count":0}

class AllCryptoModel {
  final Status? status;
  final Data? data;

  AllCryptoModel({this.status, this.data});

  factory AllCryptoModel.fromJson(Map<String, dynamic> json) {
    return AllCryptoModel(
      status: json['status'] != null ? Status.fromJson(json['status']) : null,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

// # cryptoCurrencyList : [{"id":1,"name":"Bitcoin","symbol":"BTC","slug":"bitcoin","cmcRank":1,"marketPairCount":9226,"circulatingSupply":18981025.00000000,"selfReportedCirculatingSupply":0,"totalSupply":18981025.00000000,"maxSupply":2.1E+7,"ath":68789.625938922131334232,"atl":65.526000976562500000,"high24h":40081.679254257200000000,"low24h":38432.931633910060000000,"isActive":1,"lastUpdated":"2022-03-12T09:23:00.000Z","dateAdded":"2013-04-28T00:00:00.000Z","quotes":[{"name":"USD","price":39144.775449462126000000000000,"volume24h":23301890066.89607239,"volume7d":174686950923.67400537,"volume30d":703067717071.67283326,"marketCap":743007961425.62685015915000000000000000000000,"selfReportedMarketCap":0E-24,"percentChange1h":0.31370907,"percentChange24h":0.04596212,"percentChange7d":0.28884588,"lastUpdated":"2022-03-12T09:23:00.000Z","percentChange30d":-11.66603041,"percentChange60d":-6.72707190,"percentChange90d":-20.21373828,"fullyDilluttedMarketCap":822040284438.70,"marketCapByTotalSupply":743007961425.62685015915000000000000000000000,"dominance":42.5432,"turnover":0.03136156,"ytdPriceChangePercentage":-17.9128}],"isAudited":false}]
// # totalCount : "222"

class Data {
  final List<CryptoDataModel>? cryptoCurrencyList;
  final String? totalCount;

  Data({this.cryptoCurrencyList, this.totalCount});

  factory Data.fromJson(Map<String, dynamic> json) {
    final cryptoList = json['cryptoCurrencyList'] as List?;
    final cryptoCurrencyList =
        cryptoList?.map((e) => CryptoDataModel.fromJson(e)).toList();
    final totalCount = json['totalCount'] as String?;

    return Data(
      cryptoCurrencyList: cryptoCurrencyList,
      totalCount: totalCount,
    );
  }
}
