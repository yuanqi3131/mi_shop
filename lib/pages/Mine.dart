import 'package:flutter/material.dart';

class Mine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Page();
  }
}

class Page extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Mine',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Mine'),
        ),
        body: new Center(
          child: new Text('Welcome to Mine'),
        ),
      ),
    );
  }
}
