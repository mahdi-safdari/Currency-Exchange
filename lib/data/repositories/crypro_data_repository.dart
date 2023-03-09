import 'package:exchange/data/data_source/api_provider.dart';
import 'package:exchange/data/models/crypto_model/all_crypto_model.dart';

//# This class is responsible for getting the top gainer data of cryptocurrencies.
class CryptoDataRepository {
  final ApiProvider apiProvider = ApiProvider();

  //# This method fetches the top gainer data from the API,
  //# maps it to AllCryptoModel and returns as a Future.
  Future<AllCryptoModel> getTopGainerData() async {
    final response = await apiProvider.getTopGainerData();
    final dataFuture = AllCryptoModel.fromJson(response.data);

    return dataFuture;
  }
}
