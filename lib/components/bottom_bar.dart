import 'package:art_translated/constants/Styling.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  BottomBar({Key? key, required this.index, required this.onChangedTab})
      : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final _width = _size.width;
    final _height = _size.height;

    return Material(
      elevation: 10,
      shadowColor: Colors.grey,
      child: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buildTabItem(index: 0, icon: Icon(Icons.home)),
              buildTabItem(index: 1, icon: Icon(Icons.question_mark)),
              buildTabItem(index: 2, icon: Icon(Icons.account_circle)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabItem({required int index, required Icon icon}) {
    final bool isSelected = (index == widget.index);
    return IconTheme(
      data:
          IconThemeData(color: isSelected ? Styling.getPrimary() : Colors.grey),
      child: IconButton(
        icon: icon,
        onPressed: () => widget.onChangedTab(index),
      ),
    );
  }
}
