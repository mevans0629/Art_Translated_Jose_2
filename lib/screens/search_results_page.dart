import 'package:art_translated/components/buttons/howto_button.dart';
import 'package:art_translated/components/container_layout.dart';
import 'package:art_translated/components/search_result_list.dart';
import 'package:art_translated/components/toolbar.dart';
import 'package:art_translated/constants/Styling.dart';
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
    MediaQueryData _mediaData = MediaQuery.of(context);
    final width = _mediaData.size.width;
    final height = _mediaData.size.height;
    final wh = width + height;

    TextEditingController _textEditingController = TextEditingController();

    _onTextChanged(newText) {
      _textEditingController.text = newText;
    }

    void _clearText() {
      _textEditingController.clear();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styling.getSecondary(),
      body: ContainerLayout(
        color1: Styling.getSecondary(),
        color2: Styling.getPrimary(),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Toolbar(
                    showShadow: false,
                    showGoBack: true,
                    right: HowtoButton(
                      color: Colors.black87,
                    ),
                  ),
                  SearchResultListView(
                    searchText: this.widget.textToTranslate,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
