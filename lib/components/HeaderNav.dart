import 'package:flutter/material.dart';

class HeaderNav extends StatefulWidget {
  final Container left;
  final Container right;
  final Container content;
  HeaderNav({Key key, this.left, this.content, this.right}) : super(key: key);
  @override
  createState() => new HeaderComponent();
}

class HeaderComponent extends State<HeaderNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Color(0xfff2f2f2)),
      height: 40,
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        children: <Widget>[
          Expanded(
            child: widget.left,
            flex: 1,
          ),
          Expanded(child: widget.content, flex: 6),
          Expanded(
            child: widget.right,
            flex: 1,
          )
        ],
      ),
    );
  }
}
