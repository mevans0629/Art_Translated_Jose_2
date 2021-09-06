import 'package:art_translated/models/symbols.dart';
import 'package:art_translated/screens/symbol_detail_page.dart';
import 'package:art_translated/services/apimanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class SearchResultListView extends StatelessWidget {
  final String searchText;

  SearchResultListView({Key? key, required this.searchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (searchText == null || searchText.isEmpty) {
      return Center(
        child: Column(),
      );
    }

    ListTile makeListTile(Symbol symbol) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(Icons.autorenew, color: Colors.white),
          ),
          title: Text(
            symbol.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(symbol.meaning,
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SymbolDetailPage(symbol: symbol)));
          },
        );

    Card makeCard(Symbol symbol) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: makeListTile(symbol),
          ),
        );

    return FutureBuilder<Symbols>(
      future: ApiManager().searchSymbols(query: searchText),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data!.results!.length,
              itemBuilder: (context, index) {
                return makeCard(snapshot.data!.results![index]);
              });
        } else
          return Center(child: CircularProgressIndicator());
      },
    );
  }
}
