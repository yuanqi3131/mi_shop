import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_shop/components/HeaderNav.dart';
import 'package:mi_shop/http/index.dart';
import 'package:mi_shop/http/api.dart';
import 'package:mi_shop/utils/index.dart';
import 'package:mi_shop/utils/index.dart';

class Cart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Page();
  }
}

class Page extends State<Cart> {
  List header = List();
  List recommendList = List();
  @override
  void initState() {
    requestAPI();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: false);
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: new Container(
          child: new Column(
            children: <Widget>[
              new HeaderNav(
                  left: new Container(
                    child: new Icon(Icons.keyboard_arrow_left,
                        color: Color(0xff666666)),
                  ),
                  content: new Container(
                    alignment: Alignment.center,
                    child: new Text('购物车',
                        style: TextStyle(color: Color(0xff666666))),
                  ),
                  right: new Container(
                    child: Icon(Icons.search, color: Color(0xff666666)),
                  )),
              Expanded(
                child: new Container(
                  child: new ListView(
                    padding: EdgeInsets.only(top: 0, bottom: 40),
                    shrinkWrap: true, //内容适配
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      new Container(
                        height: ScreenUtil().setHeight(104),
                        decoration: new BoxDecoration(color: Colors.white),
                        padding: EdgeInsets.fromLTRB(ScreenUtil().setSp(32), 0,
                            ScreenUtil().setSp(32), 0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text(
                              '登陆后享受更多优惠',
                              style: TextStyle(
                                  color: Color(0xff212121),
                                  fontSize: ScreenUtil().setSp(32)),
                            ),
                            new Text(
                              '去登录 >',
                              style: TextStyle(
                                  color: Color(0xff757575),
                                  fontSize: ScreenUtil().setSp(24)),
                            ),
                          ],
                        ),
                      ),
                      new Container(
                        height: ScreenUtil().setHeight(124),
                        decoration: BoxDecoration(color: Color(0xffebebeb)),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Image(
                              image: AssetImage('images/cart.png'),
                              width: ScreenUtil().setWidth(70),
                            ),
                            new Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: new Text('购物车还是空的',
                                  style: TextStyle(
                                      color: Color(0xffBABABA),
                                      fontSize: ScreenUtil().setSp(24))),
                            ),
                            new Container(
                              height: ScreenUtil().setSp(50),
                              width: ScreenUtil().setSp(136),
                              child: new MaterialButton(
                                color: Color(0xffebebeb),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: Color(0xffD8D8D8))),
                                onPressed: () => {},
                                elevation: 0,
                                child: new Text('去逛逛',
                                    style: TextStyle(
                                        color: Color(0xff212121),
                                        fontSize: ScreenUtil().setSp(24))),
                              ),
                            )
                          ],
                        ),
                      ),
                      headerContainer,
                      recommedContainer
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget headerContainer = new Container(); // 头部容器
  Widget recommedContainer = new Container(); // 推荐容器
  void requestAPI() async {
    // 请求API数据
    var res = await Http.post(path: RECOMMEND_BLANK, data: {'source': 'list'});
    setState(() {
      header = res['header']['body']['items'];
      recommendList = res['recom_list'];
    });
    headerContainer = new Container(
      child: new Image.network(
        addHttp(header[0]['img_url']),
        width: ScreenUtil().setWidth(header[0]['w']),
        height: ScreenUtil().setHeight(header[0]['h']),
        fit: BoxFit.cover,
      ),
    );
    recommedContainer = new Container(
      child: new Wrap(
        spacing: 3,
        children: setList(),
      ),
    );
  }

  List<Widget> setList() {
    List<Widget> list = [];
    for (var item in recommendList) {
      list.add(new Container(
        width: ScreenUtil().setWidth(357),
        child: new Column(
          children: <Widget>[
            new Image.network(
              addHttp(item['image_url']),
              // width: ScreenUtil().setWidth(360),
              fit: BoxFit.fill,
            ),
            new Container(
              margin: EdgeInsets.fromLTRB(ScreenUtil().setSp(20),
                  ScreenUtil().setSp(10), 0, ScreenUtil().setSp(10)),
              child: new Column(
                children: <Widget>[
                  new Align(
                    alignment: FractionalOffset.centerLeft,
                    child: new Text(item['name'],
                        style: TextStyle(
                            color: Color(0xff3c3c3c),
                            fontSize: ScreenUtil().setSp(24))),
                  ),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Text('￥' + item['price'],
                            style: TextStyle(
                                color: Color(0xffea625b),
                                fontSize: ScreenUtil().setSp(28))),
                        new Text('￥' + item['market_price'],
                            style: TextStyle(
                                color: Color(0xff757575),
                                fontSize: ScreenUtil().setSp(22))),
                      ])
                ],
              ),
            )
          ],
        ),
      ));
    }
    return list;
  }
}
