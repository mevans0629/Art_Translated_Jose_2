class Strings {
  static final String titleApp = 'Art Translated';

  static final bool useHttps = false;
  static final String baseUrl = "http://api.arttranslated.com";
  static final String apiPrefix = "/api";

  static final int maxLength = 50;

  static final double thumbnailWidth = 80;

  static String getSymbolsSearchUrl({required String query}) {
    String path = "/search/?search=" + query + "&ordering=probability";
    if (useHttps) {
      return baseUrl + path;
    } else {
      return baseUrl + path;
    }
  }

  static String getSymbolImagesUrl({required double id}) {
    String path = apiPrefix + "/symbols/" + (id).toStringAsFixed(0) + "/images";
    if (useHttps) {
      return baseUrl + path;
    } else {
      return baseUrl + path;
    }
  }
}
