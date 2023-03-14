import 'package:exchange/data/data_source/api_provider.dart';
import 'package:exchange/data/models/crypto_model/all_crypto_model.dart';
import 'package:exchange/data/data_source/response_model.dart';
import 'package:flutter/material.dart';

class MarketViewProvider extends ChangeNotifier {
  //# create an instance of the ApiProvider class to make API requests
  final ApiProvider apiProvider = ApiProvider();

  AllCryptoModel? _dataFuture;
  ResponseModel<AllCryptoModel>? _state;

  //# getter for the AllCryptoModel object
  AllCryptoModel? get dataFuture => _dataFuture;

  //# getter for the ResponseModel object
  ResponseModel<AllCryptoModel>? get state => _state;

  //# method to fetch crypto data from the API
  getCryptoData() async {
    //# set the state to loading
    _state = ResponseModel.loading("is loading...");

    try {
      //# make the API request
      final response = await apiProvider.getAllCryptoData();
      //# check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        //# parse the JSON response and store it in the _dataFuture object
        _dataFuture = AllCryptoModel.fromJson(response.data);
        //# set the state to completed with the parsed data
        _state = ResponseModel.completed(dataFuture!);
      } else {
        //# set the state to error if there was an issue with the API request
        _state = ResponseModel.error("something wrong please try again...");
      }
      //# notify listeners that the state has changed
      notifyListeners();
    } catch (e) {
      //# set the state to error if there was an issue with the API request
      _state = ResponseModel.error("please check your connection...");
      //# notify listeners that the state has changed
      notifyListeners();
    }
  }
}
