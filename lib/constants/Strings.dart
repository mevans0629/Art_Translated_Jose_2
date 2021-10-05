class Strings {
  static final String titleApp = 'Art Translated';

  static final bool useHttps = false;
  static final String baseUrl = "http://3.236.20.38";
  static final String apiPrefix = "/api";

  static final int maxLength = 50;

  static final double thumbnailWidth = 80;

  static String getSymbolsSearchUrl({required String query}) {
    String path = "/search/?search=" + query;
    if (useHttps) {
      return baseUrl + path;
    } else {
      return baseUrl + path;
    }
  }
}
