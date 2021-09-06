import 'package:art_translated/components/container_layout.dart';
import 'package:art_translated/components/search_result_list.dart';
import 'package:art_translated/constants/Strings.dart';
import 'package:art_translated/constants/Styling.dart';
import 'package:art_translated/constants/Widgets.dart';
import 'package:flutter/material.dart';

class SearchResultsPage extends StatefulWidget {
  final String textToTranslate;
  SearchResultsPage({Key? key, required this.textToTranslate})
      : super(key: key);
  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Widgets.appBar(title: Strings.titleApp),
      backgroundColor: Styling.getPrimary(),
      body: ContainerLayout(
        color1: Styling.getSecondary(),
        color2: Styling.getPrimary(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 8.0),
                child: SearchResultListView(
                  searchText: this.widget.textToTranslate,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
