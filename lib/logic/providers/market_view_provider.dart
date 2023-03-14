import 'package:exchange/data/data_source/api_provider.dart';
import 'package:exchange/data/models/crypto_model/all_crypto_model.dart';
import 'package:exchange/data/data_source/response_model.dart';
import 'package:flutter/material.dart';

class MarketViewProvider extends ChangeNotifier {
  final ApiProvider apiProvider = ApiProvider();

  AllCryptoModel? _dataFuture;
  ResponseModel<AllCryptoModel>? _state;

  AllCryptoModel? get dataFuture => _dataFuture;
  ResponseModel<AllCryptoModel>? get state => _state;

  getCryptoData() async {
    _state = ResponseModel.loading("is loading...");

    try {
      final response = await apiProvider.getAllCryptoData();
      if (response.statusCode == 200) {
        _dataFuture = AllCryptoModel.fromJson(response.data);
        _state = ResponseModel.completed(dataFuture!);
      } else {
        _state = ResponseModel.error("something wrong please try again...");
      }
      notifyListeners();
    } catch (e) {
      _state = ResponseModel.error("please check your connection...");
      notifyListeners();
    }
  }
}
