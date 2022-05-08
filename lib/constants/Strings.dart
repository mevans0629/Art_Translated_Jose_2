class Strings {
  static final String titleApp = 'Art Translated';

  static final bool useHttps = false;
  static final String baseUrl = "http://api.arttranslated.com";
  static final String apiPrefix = "/api";

  static final int maxLength = 50;

  static final double thumbnailWidth = 80;
  static final double mainImageWidth = 296;

  static String getSymbolsSearchUrl({required String query}) {
    return getUrl(apiPrefix + "/symbols/search?query=" + query);
    // + "&ordering=probability";
  }

  static String getSymbolImagesUrl({required double id}) {
    return getUrl(
        apiPrefix + "/symbols/" + (id).toStringAsFixed(0) + "/images");
  }

  static String getSuggestsUrl({required String text}) {
    return getUrl(apiPrefix + "/symbols/suggest?text=" + text);
  }

  static String getAutoSuggestsUrl({required String query}) {
    return getUrl(apiPrefix + "/symbols/suggest?query=" + query);
  }

  static String getUrl(String path) {
    if (useHttps) {
      return baseUrl + path;
    } else {
      return baseUrl + path;
    }
  }
}
