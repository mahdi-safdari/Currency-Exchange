import 'package:exchange/data/data_source/api_provider.dart';
import 'package:exchange/data/models/crypto_model/all_crypto_model.dart';

//# A repository class that provides access to the CoinMarketCap API for retrieving
//# the top gainer cryptocurrency data.
class CryptoDataRepository {
  final ApiProvider apiProvider = ApiProvider();

  //# A method to retrieve the top gainer cryptocurrency data from the CoinMarketCap API.
  //#
  //# This method sends a GET request to the CoinMarketCap API with the appropriate
  //# query parameters to retrieve the top gainer data. The response from the API is
  //# processed into an instance of the `AllCryptoModel` model class and returned as a future.
  Future<AllCryptoModel> getTopGainerData() async {
    final response = await apiProvider.getTopGainerData();
    final dataFuture = AllCryptoModel.fromJson(response.data);

    return dataFuture;
  }
}
