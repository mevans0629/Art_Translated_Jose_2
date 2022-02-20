import 'package:art_translated/components/bottom_bar.dart';
import 'package:art_translated/components/scroll_tohide.dart';
import 'package:art_translated/constants/Styling.dart';
import 'package:art_translated/screens/about_page.dart';
import 'package:art_translated/screens/profile_page.dart';
import 'package:art_translated/screens/translator_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void onChangedTab(index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      TranslatorPage(
        scrollController: scrollController,
      ),
      AboutPage(showGoBack: false, onClicked: () {}),
      ProfilePage(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styling.getSecondary(),
      body: pages[index],
      bottomNavigationBar: ScrollToHideWidget(
        controller: scrollController,
        child: BottomBar(
          index: index,
          onChangedTab: onChangedTab,
        ),
      ),
    );
  }
}
