import 'package:art_translated/components/action_label.dart';
import 'package:art_translated/components/image_top.dart';
import 'package:art_translated/components/loader.dart';
import 'package:art_translated/components/not_found_box.dart';
import 'package:art_translated/constants/Strings.dart';
import 'package:art_translated/constants/Styling.dart';
import 'package:art_translated/constants/app_utils.dart';
import 'package:art_translated/models/symbols.dart';
import 'package:art_translated/screens/symbol_detail_page.dart';
import 'package:art_translated/services/apimanager.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  final String searchText;
  final ScrollController scrollController;

  SearchResultListView(
      {Key? key, required this.searchText, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaData = MediaQuery.of(context);
    final width = _mediaData.size.width;
    final height = _mediaData.size.height;
    final wh = width + height;

    if (searchText.isEmpty) {
      return Center(
        child: Column(),
      );
    }

    String _validateMeaning(String meaning) {
      if (meaning.length < Strings.maxLength) {
        return meaning;
      } else {
        return meaning.substring(0, Strings.maxLength) + "...";
      }
    }

    Text _probabilityText(int p) {
      String _labelProbability = "";
      if (p == 1)
        _labelProbability = "High";
      else if (2 <= p && p <= 3)
        _labelProbability = "Medium";
      else
        _labelProbability = "Low";
      Color color = Styling.getProbabilityColor(_labelProbability);
      return Text(
        _labelProbability + " probaility ",
        style: Styling.getProbabilityTextStyle(wh, color),
        textAlign: TextAlign.right,
      );
    }

    Widget _validateThumbnail(List<String> images) {
      if (images.isNotEmpty && images.length == 2 && images[1].isNotEmpty) {
        return AppUtils.loadNetworkImage(images[1], Strings.thumbnailWidth);
      }
      return AppUtils.notFoundImage(width: Strings.thumbnailWidth);
    }

    Image _validateMainItem(List<String> images, double width) {
      if (images.isNotEmpty && images.length == 2 && images[1].isNotEmpty) {
        return AppUtils.loadNetworkImageFill(images[1], 142, width);
      }
      return AppUtils.notFoundImage(width: Strings.thumbnailWidth);
    }

    Column makeListTile(int index, Symbol symbol) {
      if (index == 0) {
        return Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ImageTop(
                  symbol: symbol,
                  image: _validateMainItem(symbol.images!, width),
                  width: width,
                  hasImage: true,
                ),
              ],
            ),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SymbolDetailPage(symbol: symbol)));
              },
              title: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      symbol.name,
                      style: Styling.getHead1Style(wh),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _probabilityText(symbol.probability!),
                  ),
                ],
              ),
              subtitle: Column(
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 0, top: 15),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            _validateMeaning(symbol.meaning),
                            style: Styling.getDetailsTextStyle(wh),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10, right: 5),
                  child: ActionLabel(
                    text: "Learn More >",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SymbolDetailPage(symbol: symbol)));
                    },
                    textStyle: Styling.getLinkDetailsTextStyle(wh),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ],
        );
      } else {
        return Column(
          children: <Widget>[
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              leading: Container(
                padding: EdgeInsets.only(right: 10.0, bottom: 10),
                child: _validateThumbnail(symbol.images!),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SymbolDetailPage(symbol: symbol)));
              },
              title: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      symbol.name,
                      style: Styling.getHead1Style(wh),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _probabilityText(symbol.probability!),
                  ),
                ],
              ),
              subtitle: Column(
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 0, top: 15),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            _validateMeaning(symbol.meaning),
                            style: Styling.getDetailsTextStyle(wh),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10, right: 5),
                  child: ActionLabel(
                    text: "Learn More >",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SymbolDetailPage(symbol: symbol)));
                    },
                    textStyle: Styling.getLinkDetailsTextStyle(wh),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ],
        );
      }
    }

    Card makeCard(int index, Symbol symbol) => Card(
          elevation: 3,
          margin: new EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: Colors.white, // set border color
                  width: 1.0), // set border width
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
            ),
            child: makeListTile(index, symbol),
          ),
        );

    return FutureBuilder<Symbols>(
      future: ApiManager().searchSymbols(query: searchText),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.results != null &&
              snapshot.data!.results!.length > 0) {
            return Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                controller: this.scrollController,
                itemCount:
                    snapshot.data != null ? snapshot.data!.results!.length : 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        makeCard(index, snapshot.data!.results![index]),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              'This could also be...',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Monserrat',
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                      ],
                    );
                  } else {
                    return makeCard(index, snapshot.data!.results![index]);
                  }
                },
              ),
            );
          } else
            return NotFoundBox(searchText: searchText);
        } else
          return Loader();
      },
    );
  }
}
