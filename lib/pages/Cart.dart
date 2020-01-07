import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Page();
  }
}

class Page extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Cart',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Cart'),
        ),
        body: new Center(
          child: new Text('Welcome to Cart'),
        ),
      ),
    );
  }
}
