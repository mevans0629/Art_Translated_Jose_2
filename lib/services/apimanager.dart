import 'package:art_translated/constants/Strings.dart';
import 'package:art_translated/models/response.dart';
import 'package:art_translated/models/suggests.dart';
import 'package:dio/dio.dart';

class ApiManager {
  Future<SymbolRes> searchSymbols({required String query}) async {
    var symbolsModel;
    if (query.isEmpty) {
      return symbolsModel;
    }
    print(query.toLowerCase());
    var httpClient = Dio();
    try {
      // print(Strings.getSymbolsSearchUrl(query: query));
      Response response = await httpClient
          .get(Strings.getSymbolsSearchUrl(query: query.toLowerCase()));
      if (response.statusCode == 200) {
        print(response);
        symbolsModel = SymbolRes.fromJson(response.data);
        // print(symbolsModel.message);
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

  Future<SymbolImageRes> getSymbolImages({required double symbolId}) async {
    var symbolImagesModel;

    var httpClient = Dio();
    try {
      String url = Strings.getSymbolImagesUrl(id: symbolId);
      // print("URL $url");
      Response response = await httpClient.get(url);
      if (response.statusCode == 200) {
        symbolImagesModel = SymbolImageRes.fromJson(response.data);
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

  Future<Suggests> getAutoSuggests({required String inputText}) async {
    Suggests suggests = new Suggests(data: []);

    var httpClient = Dio();
    try {
      String url = Strings.getAutoSuggestsUrl(query: inputText);
      print("URL $url");
      Response response = await httpClient.get(url);
      if (response.statusCode == 200) {
        // print(response.data);
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
