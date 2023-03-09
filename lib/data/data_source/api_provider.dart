import 'package:dio/dio.dart';

class ApiProvider {
  //# The base URL for the CoinMarketCap API.
  static const String baseUrl =
      "https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing";

  //# Additional fields to include in the response.
  static const String aux =
      "ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap";

  //# Create a Dio instance for making HTTP requests.
  static final Dio dio = Dio();

  //# Retrieves data on all cryptocurrencies based on market cap.
  Future<Response> getAllCryptoData() async {
    final response = await dio.get(baseUrl, queryParameters: <String, dynamic>{
      "start": 1,
      "limit": 1000,
      "sortBy": "market_cap",
      "sortType": "desc",
      "convert": "USD",
      "cryptoType": "all",
      "tagType": "all",
      "audited": false,
      "aux": aux,
    });
    return response;
  }

  //# Retrieves data on the top 20 cryptocurrencies with the highest market cap.
  Future<Response> getTopMarketCapData() async {
    final response = await dio.get(baseUrl, queryParameters: <String, dynamic>{
      "start": 1,
      "limit": 20,
      "sortBy": "market_cap",
      "sortType": "desc",
      "convert": "USD",
      "cryptoType": "all",
      "tagType": "all",
      "audited": false,
      "aux": aux,
    });

    return response;
  }

  //# Retrieves data on the top 20 cryptocurrencies with the highest percent change over the last 24 hours.
  Future<Response> getTopGainerData() async {
    final response = await dio.get(baseUrl, queryParameters: <String, dynamic>{
      "start": 1,
      "limit": 20,
      "sortBy": "percent_change_24h",
      "sortType": "desc",
      "convert": "USD",
      "cryptoType": "all",
      "tagType": "all",
      "audited": false,
      "aux": aux,
    });
    return response;
  }

  //# Retrieves data on the top 20 cryptocurrencies with the lowest percent change over the last 24 hours.
  Future<Response> getTopLosersData() async {
    final response = await dio.get(baseUrl, queryParameters: <String, dynamic>{
      "start": 1,
      "limit": 20,
      "sortBy": "percent_change_24h",
      "sortType": "asc",
      "convert": "USD",
      "cryptoType": "all",
      "tagType": "all",
      "audited": false,
      "aux": aux,
    });
    return response;
  }

  //# Sends a registration request to an API using form data.
  dynamic callRegisterApi(name, email, password) async {
    var formData = FormData.fromMap({
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password,
    });

    final response =
        await Dio().post('https://besenior.ir/api/register', data: formData);

    return response;
  }
}
