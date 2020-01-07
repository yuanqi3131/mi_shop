import 'package:flutter/material.dart';
import 'package:mi_shop/pages/Home.dart';
import 'package:mi_shop/pages/Category.dart';
import 'package:mi_shop/pages/Cart.dart';
import 'package:mi_shop/pages/Mine.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = '小米商城';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  var _pageListr = [new Home(), new Category(), new Cart(), new Mine()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: _pageListr[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('分类'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('购物车'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('我的'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xffff6700), //激活样式
        unselectedItemColor: Color(0xff999999), // 未激活的样式
        showUnselectedLabels: true, // 展示未选择的文本
        type: BottomNavigationBarType.fixed, // 固定底部菜单不移动
        backgroundColor: Color(0xffffffff), // 背景颜色 注：0x代表十六进制 ff代表透明度 后面6位才是颜色
        onTap: _onItemTapped, // 点击事件
      ),
    );
  }
}
