class Strings {
  static final String titleApp = 'Art Translated';

  static final bool useHttps = false;
  static final String baseUrl = "http://34.229.56.96";
  static final String apiPrefix = "/api";

  static String getSymbolsUrl({required String query}) {
    String path = apiPrefix + "/symbols?search=" + query;
    if (useHttps) {
      return baseUrl + path;
    } else {
      return baseUrl + path;
    }
  }
}
