import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Page();
  }
}

class Page extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: false);
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new MaterialApp(
      // title: 'Welcome to Mine',
      home: new Scaffold(
        // appBar: new AppBar(
        //   title: new Text('Welcome to Mine'),
        // ),
        body: new Container(
          child: new ListView(
              padding: EdgeInsets.only(top: 0), // 顶部对齐
              shrinkWrap: true, //内容适配
              scrollDirection: Axis.vertical,
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.fromLTRB(
                      0, ScreenUtil().setSp(32), 0, ScreenUtil().setSp(32)),
                  width: ScreenUtil().setWidth(720),
                  decoration: new BoxDecoration(
                      color: Color(0xfff37d0f),
                      image: new DecorationImage(
                          image: AssetImage('images/mine_top.png'),
                          fit: BoxFit.contain)),
                  child: new Row(
                    children: <Widget>[
                      new Container(
                          decoration: new BoxDecoration(
                              border: new Border.all(
                                  width: 2, color: Color(0x66FFFFFF)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                          margin: EdgeInsets.fromLTRB(ScreenUtil().setSp(32), 0,
                              ScreenUtil().setSp(16), 0),
                          child: new Image(
                            width: ScreenUtil().setWidth(96),
                            image: new AssetImage('images/mine_user.png'),
                          )),
                      new Text(
                        '登录/注册',
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(24),
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                new Container(
                  height: ScreenUtil().setHeight(80),
                  padding: EdgeInsets.fromLTRB(
                      ScreenUtil().setSp(32), 0, ScreenUtil().setSp(32), 0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xffD8D8D8)))),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text('我的订单',
                          style: TextStyle(
                              color: Color(0xff212121),
                              fontSize: ScreenUtil().setSp(24))),
                      new Text('全部订单>',
                          style: TextStyle(
                              color: Color(0xff212121),
                              fontSize: ScreenUtil().setSp(24)))
                    ],
                  ),
                ),
                new Container(
                  padding: EdgeInsets.fromLTRB(
                      0, ScreenUtil().setSp(30), 0, ScreenUtil().setSp(30)),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: ScreenUtil().setSp(20),
                              color: Color(0xfff5f5f5)))),
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Column(
                          children: <Widget>[
                            new Image(
                              image: new AssetImage('images/mine_fukuan.png'),
                              width: ScreenUtil().setWidth(48),
                            ),
                            new Text('待付款',
                                style: TextStyle(
                                    color: Color(0xff212121),
                                    fontSize: ScreenUtil().setSp(22)))
                          ],
                        ),
                      ),
                      Expanded(
                        child: new Column(
                          children: <Widget>[
                            new Image(
                              image: new AssetImage('images/mine_shouhuo.png'),
                              width: ScreenUtil().setWidth(48),
                            ),
                            new Text('待收获',
                                style: TextStyle(
                                    color: Color(0xff212121),
                                    fontSize: ScreenUtil().setSp(22)))
                          ],
                        ),
                      ),
                      Expanded(
                          child: new Column(
                        children: <Widget>[
                          new Image(
                            image: new AssetImage('images/mine_weixiu.png'),
                            width: ScreenUtil().setWidth(48),
                          ),
                          new Text('退换修',
                              style: TextStyle(
                                  color: Color(0xff212121),
                                  fontSize: ScreenUtil().setSp(22)))
                        ],
                      ))
                    ],
                  ),
                ),
                new Container(
                  child: new Column(children: handlerList()
                      // <Widget>[
                      // new Row(
                      //   children: <Widget>[
                      //     new Container(
                      //       padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      //       child: new Image(
                      //         image: AssetImage('images/mine_number.png'),
                      //         fit: BoxFit.fill,
                      //         width: ScreenUtil().setWidth(40),
                      //       ),
                      //     ),
                      //     Expanded(
                      //         child: new Container(
                      //       padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      //       decoration: BoxDecoration(
                      //           border: Border(
                      //               bottom: BorderSide(
                      //                   width: 1, color: Color(0xffD8D8D8)))),
                      //       child: new Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: <Widget>[
                      //           new Text(
                      //             '会员中心',
                      //             style: TextStyle(
                      //                 fontSize: ScreenUtil().setSp(24)),
                      //           ),
                      //           new Icon(
                      //             Icons.keyboard_arrow_right,
                      //             color: Color(0xff757575),
                      //           )
                      //         ],
                      //       ),
                      //     ))
                      //   ],
                      // ),
                      // ],
                      ),
                )
              ]),
        ),
      ),
    );
  }

  List<Widget> handlerList() {
    var list = [
      {'icon': 'images/mine_number.png', 'text': '会员中心'},
      {'icon': 'images/mine_youhui.png', 'text': '我的优惠', 'type': 'bottom'},
      {'icon': 'images/mine_center.png', 'text': '服务中心'},
      {'icon': 'images/mine_home.png', 'text': '小米之家', 'type': 'bottom'},
      {'icon': 'images/mine_F.png', 'text': '我的F码'},
      {'icon': 'images/mine_gift.png', 'text': '礼物码兑换', 'type': 'bottom'},
      {'icon': 'images/mine_setting.png', 'text': '设置', 'type': 'bottom'},
    ];
    List<Widget> items = [];
    for (var item in list) {
      if (item['type'] != 'bottom') {
        items.add(
          new Row(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                child: new Image(
                  image: AssetImage(item['icon']),
                  fit: BoxFit.fill,
                  width: ScreenUtil().setWidth(40),
                ),
              ),
              Expanded(
                  child: new Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1, color: Color(0xffD8D8D8)))),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      item['text'],
                      style: TextStyle(fontSize: ScreenUtil().setSp(24)),
                    ),
                    new Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xff757575),
                    )
                  ],
                ),
              ))
            ],
          ),
        );
      } else {
        items.add(new Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: ScreenUtil().setSp(20),
                      color: Color(0xfff5f5f5)))),
          child: new Row(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                child: new Image(
                  image: AssetImage(item['icon']),
                  fit: BoxFit.fill,
                  width: ScreenUtil().setWidth(40),
                ),
              ),
              Expanded(
                  child: new Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      item['text'],
                      style: TextStyle(fontSize: ScreenUtil().setSp(24)),
                    ),
                    new Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xff757575),
                    )
                  ],
                ),
              ))
            ],
          ),
        ));
      }
    }
    return items;
  }
}
