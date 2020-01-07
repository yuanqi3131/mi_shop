import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Page();
  }
}

class Page extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Category',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Category'),
        ),
        body: new Center(
          child: new Text('Welcome to Category'),
        ),
      ),
    );
  }
}
