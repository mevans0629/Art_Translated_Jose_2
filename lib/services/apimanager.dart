import 'package:art_translated/constants/Strings.dart';
import 'package:art_translated/models/suggests.dart';
import 'package:art_translated/models/symbol_image.dart';
import 'package:art_translated/models/symbols.dart';
import 'package:dio/dio.dart';

class ApiManager {
  Future<Symbols> searchSymbols({required String query}) async {
    var symbolsModel;
    if (query.isEmpty) {
      return symbolsModel;
    }
    var httpClient = Dio();
    try {
      Response response =
          await httpClient.get(Strings.getSymbolsSearchUrl(query: query));
      if (response.statusCode == 200) {
        symbolsModel = Symbols.fromJson(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
      }
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
      return symbolsModel;
    }

    return symbolsModel;
  }

  Future<SymbolImages> getSymbolImages({required double symbolId}) async {
    var symbolImagesModel;

    var httpClient = Dio();
    try {
      String url = Strings.getSymbolImagesUrl(id: symbolId);
      // print("URL $url");
      Response response = await httpClient.get(url);
      if (response.statusCode == 200) {
        symbolImagesModel = SymbolImages.fromJson(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
      }
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
      return symbolImagesModel;
    }

    return symbolImagesModel;
  }

  Future<Suggests> getSuggests({required String inputText}) async {
    var suggests;

    var httpClient = Dio();
    try {
      String url = Strings.getSuggestsUrl(text: inputText);
      // print("URL $url");
      Response response = await httpClient.get(url);
      if (response.statusCode == 200) {
        suggests = Suggests.fromJson(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
      }
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
      return suggests;
    }

    return suggests;
  }
}
