import 'package:exchange/data/data_source/api_provider.dart';
import 'package:exchange/data/models/crypto_model/all_crypto_model.dart';
import 'package:exchange/data/repositories/crypro_data_repository.dart';
import 'package:exchange/data/data_source/response_model.dart';
import 'package:flutter/material.dart';

class CryptoDataProvider extends ChangeNotifier {
  final ApiProvider apiProvider = ApiProvider();
  final CryptoDataRepository repository = CryptoDataRepository();
  CryptoDataProvider() {
    getTopMarketCapData();
  }

  AllCryptoModel? _dataFuture;
  ResponseModel<AllCryptoModel>? _state;
  int _defaultChoiceIndex = 0;

  AllCryptoModel? get dataFuture => _dataFuture;
  ResponseModel<AllCryptoModel>? get state => _state;
  int get defaultChoiceIndex => _defaultChoiceIndex;

  Future<void> getTopMarketCapData() async {
    _defaultChoiceIndex = 0;
    _state = ResponseModel.loading("is Loading...");
    notifyListeners();

    try {
      final response = await apiProvider.getTopMarketCapData();

      if (response.statusCode == 200) {
        _dataFuture = AllCryptoModel.fromJson(response.data);
        _state = ResponseModel.completed(dataFuture!);
      } else {
        _state = ResponseModel.error("something wrong...");
      }

      notifyListeners();
    } catch (e) {
      _state = ResponseModel.error("please check your connection...");
      notifyListeners();
    }
  }

  Future<void> getTopGainersData() async {
    _defaultChoiceIndex = 1;
    _state = ResponseModel.loading("is Loading...");
    notifyListeners();

    try {
      _dataFuture = await repository.getTopGainerData();
      _state = ResponseModel.completed(dataFuture!);
      notifyListeners();
    } catch (e) {
      _state = ResponseModel.error("please check your connection...");
      notifyListeners();
    }
  }

  Future<void> getTopLosersData() async {
    _defaultChoiceIndex = 2;
    _state = ResponseModel.loading("is Loading...");
    notifyListeners();

    try {
      final response = await apiProvider.getTopLosersData();

      if (response.statusCode == 200) {
        _dataFuture = AllCryptoModel.fromJson(response.data);
        _state = ResponseModel.completed(dataFuture!);
      } else {
        _state = ResponseModel.error("something wrong...");
      }

      notifyListeners();
    } catch (e) {
      _state = ResponseModel.error("please check your connection...");
      notifyListeners();
    }
  }
}
