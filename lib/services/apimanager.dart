import 'package:art_translated/constants/Strings.dart';
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
    // _translateProvider.setIsTranslating(false);

    return symbolsModel;
  }
}
