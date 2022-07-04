import 'package:art_translated/components/action_label.dart';
import 'package:art_translated/components/image_top.dart';
import 'package:art_translated/components/loader.dart';
import 'package:art_translated/components/not_found_box.dart';
import 'package:art_translated/constants/Strings.dart';
import 'package:art_translated/constants/Styling.dart';
import 'package:art_translated/constants/app_utils.dart';
import 'package:art_translated/models/datum.dart';
import 'package:art_translated/models/response.dart';
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

    Widget _validateThumbnail(String imageUrl) {
      if (imageUrl.isNotEmpty) {
        return AppUtils.loadNetworkImage(imageUrl, Strings.thumbnailWidth);
      }
      return AppUtils.notFoundImage(width: Strings.thumbnailWidth);
    }

    Image _validateMainItem(String imageUrl, double height, double width) {
      if (imageUrl.isNotEmpty) {
        return AppUtils.loadNetworkImageFill(imageUrl, height, width);
      }
      return AppUtils.notFoundImage(width: Strings.thumbnailWidth);
    }

    Column makeListTile(int index, Datum symbol) {
      if (index == 0) {
        final double _height = 242;
        return Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ImageTop(
                  symbol: symbol,
                  image: _validateMainItem(
                      symbol.getFirstImageUrl(), _height, width),
                  width: width,
                  height: _height,
                  aspectRatio: 1200,
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
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Monserrat',
                        fontSize: Styling.getFontSize(22, height),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _probabilityText(symbol.probability),
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
                            _validateMeaning(symbol.meaning!),
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
                child: _validateThumbnail(symbol.getFirstThumbUrl()),
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
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Monserrat',
                        fontSize: Styling.getFontSize(18, height),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _probabilityText(symbol.probability),
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
                            _validateMeaning(symbol.meaning!),
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

    Card makeCard(int index, Datum symbol) => Card(
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

    return FutureBuilder<SymbolRes>(
      future: ApiManager().searchSymbols(query: searchText),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var records = [];
          int recordsCount = 0;
          if (snapshot.data! != null) {
            records = snapshot.data!.data!;
            recordsCount = records.length;
          }
          if (recordsCount > 0) {
            return Expanded(
              flex: 1,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    bottom: kFloatingActionButtonMargin + 48),
                scrollDirection: Axis.vertical,
                controller: this.scrollController,
                itemCount: recordsCount == 0 ? 1 : recordsCount,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        makeCard(index, records[index]),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Text(
                              'This could also be...',
                              style: TextStyle(
                                color: Colors.black45,
                                fontFamily: 'Monserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                      ],
                    );
                  } else {
                    return makeCard(index, records[index]);
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
