import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  final Map tabs;
  Nav({Key key, this.tabs}) : super(key: key);
  @override
  createState() => new MyComponent();
}

class MyComponent extends State<Nav> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: new Row(
        children: <Widget>[
          new Flexible(
            child: new ListView(
                scrollDirection: Axis.horizontal, children: handlerData()),
          ),
          new Text('12'),
        ],
      ),
    );
  }

  List<Widget> handlerData() {
    List<Widget> items = [];
    if (widget.tabs.length > 0) {
      for (var item in widget.tabs['tabs']) {
        items.add(new Container(
          constraints: new BoxConstraints(minWidth: 30),
          padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
          color: Color(0xfff2f2f2),
          // width: 100,
          child: new GestureDetector(
            child: new Text(
              item['name'],
              style: TextStyle(fontSize: 12),
            ),
          ),
        ));
      }
    }
    return items;
  }
}
