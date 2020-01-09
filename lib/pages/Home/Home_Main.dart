import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_shop/utils/index.dart';

class HomeMain extends StatefulWidget {
  final Map initData;
  HomeMain({Key key, this.initData}) : super(key: key);

  @override
  createState() => new Page();
}

class Page extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: false);
    return new Container(
      child: new ListView(
        padding: EdgeInsets.only(top: 0), // 顶部对齐
        shrinkWrap: true, //内容适配
        scrollDirection: Axis.vertical,
        children: handlerData(),
      ),
    );
  }

  List<Widget> handlerData() {
    // 处理数据
    List<Widget> items = [];
    var initData = widget.initData;
    if (initData.length > 0) {
      for (var item in initData['sections']) {
        var data = item['body']['items'];
        if (item['view_type'] == 'gallery') {
          // banner 使用swiper
          var height = data[0]['h'];
          items.add(new Container(
            height: ScreenUtil().setHeight(height),
            child: new Swiper(
              scrollDirection: Axis.horizontal,
              loop: true,
              // duration: 300,
              // autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(addHttp(data[index]['img_url']),
                    fit: BoxFit.fill);
              },
              itemCount: data.length,
              pagination: new SwiperPagination(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                  builder: DotSwiperPaginationBuilder(
                      color: Color(0x33FFFFFF),
                      activeColor: Colors.white,
                      size: 6.0,
                      activeSize: 6.0)),
            ),
          ));
        } else if (item['view_type'] == 'divider_line') {
          // 分割线
          items.add(new Container(
            width: ScreenUtil().setWidth(720),
            height: ScreenUtil()
                .setHeight(int.parse(item['body']['line_height'].toString())),
            color: Color(handlerColor(item['body']['line_color'])),
          ));
        } else if (item['view_type'] == 'cells_auto_fill') {
          List<Widget> iList = [];
          if (data.length != 3) {
            for (var i in data) {
              iList.add(new Container(
                height: ScreenUtil().setHeight(i['h']),
                width: ScreenUtil().setWidth(i['w']),
                child: new Image.network(
                  addHttp(i['img_url']),
                  fit: BoxFit.fill,
                ),
              ));
            }
          } else {
            iList.add(new Container(
              child: new Row(
                children: <Widget>[
                  new Container(
                    height: ScreenUtil().setHeight(data[0]['h']),
                    width: ScreenUtil().setWidth(data[0]['w']),
                    margin: EdgeInsets.fromLTRB(0, 0, 2, 0),
                    child: new Image.network(
                      addHttp(data[0]['img_url']),
                      fit: BoxFit.fill,
                    ),
                  ),
                  new Column(
                    children: <Widget>[
                      new Container(
                        height: ScreenUtil().setHeight(data[1]['h']),
                        width: ScreenUtil().setWidth(data[1]['w']),
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                        child: new Image.network(
                          addHttp(data[1]['img_url']),
                          fit: BoxFit.fill,
                        ),
                      ),
                      new Container(
                        height: ScreenUtil().setHeight(data[2]['h']),
                        width: ScreenUtil().setWidth(data[2]['w']),
                        child: new Image.network(
                          addHttp(data[2]['img_url']),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // child: new Image.network(
              //   addHttp(i['img_url']),
              //   fit: BoxFit.fill,
              // ),
            ));
          }
          items.add(new Container(
            width: ScreenUtil().setWidth(720),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: iList,
            ),
          ));
        } else if (item['view_type'] == 'list_two_type13' ||
            item['view_type'] == 'list_two_type1') {
          List<Widget> iList = [];
          for (var i in data) {
            iList.add(new Container(
              margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
              width: ScreenUtil().setWidth(354),
              child: new Column(
                children: <Widget>[
                  new Image.network(
                    addHttp(i['img_url']),
                    fit: BoxFit.fill,
                  ),
                  new Container(
                    child: new Text(
                      i['product_name'],
                      style: TextStyle(
                          color: Color(0xff212121),
                          fontSize: ScreenUtil().setSp(28)),
                    ),
                  ),
                  new Container(
                    child: new Text(
                      i['product_brief'],
                      style: TextStyle(
                          color: Color(0xff757575),
                          fontSize: ScreenUtil().setSp(22)),
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text('￥' + i['product_price'] + '起',
                          style: TextStyle(
                              color: Color(0xffea625b),
                              fontSize: ScreenUtil().setSp(28))),
                      new Text('￥' + i['product_org_price'],
                          style: TextStyle(
                              color: Color(0xff757575),
                              fontSize: ScreenUtil().setSp(22))),
                    ],
                  ),
                  new Container(
                    height: ScreenUtil().setHeight(56),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: new RaisedButton(
                      color: Color(0xffea625b),
                      onPressed: () => print("普通按钮"),
                      elevation: 0,
                      child: new Text(
                        '立即购买',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(24),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ));
          }
          items.add(new Container(
            color: Colors.white,
            width: ScreenUtil().setWidth(720),
            child: new Row(
              children: iList,
            ),
          ));
        } else if (item['view_type'] == 'list_action_title') {
          items.add(new Container(
            child: new MaterialButton(
              color: Colors.white,
              onPressed: () => print("普通按钮"),
              child: new Text(
                data[0]['action_title'] + ' >',
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: ScreenUtil().setWidth(28),
                ),
              ),
            ),
          ));
        } else if (item['view_type'] == 'list_one_type2' ||
            item['view_type'] == 'list_one_type3') {
          List<Widget> iList = [];
          var container1 = new Container(
            width: ScreenUtil().setWidth(360),
            child: new Image.network(addHttp(data[0]['img_url']),
                fit: BoxFit.fill),
          );
          var container2 = new Container(
            width: ScreenUtil().setWidth(360),
            padding: EdgeInsets.fromLTRB(10, 0, 0, 60),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Text(
                  data[0]['product_name'],
                  style: TextStyle(
                    color: Color(0xff212121),
                    fontSize: ScreenUtil().setSp(28),
                  ),
                ),
                new Text(data[0]['product_brief'],
                    style: TextStyle(
                        color: Color(0xff757575),
                        fontSize: ScreenUtil().setSp(22))),
                new Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 00),
                  child: new Row(
                    children: <Widget>[
                      new Text('￥' + data[0]['product_price'] + '起',
                          style: TextStyle(
                              color: Color(0xffea625b),
                              fontSize: ScreenUtil().setSp(28))),
                      new Text('￥' + data[0]['product_org_price'],
                          style: TextStyle(
                              color: Color(0xff757575),
                              fontSize: ScreenUtil().setSp(22))),
                    ],
                  ),
                )
              ],
            ),
          );
          if (item['view_type'] == 'list_one_type2') {
            iList.add(container1);
            iList.add(container2);
          } else {
            iList.add(container2);
            iList.add(container1);
          }

          items.add(new Container(
            child: new Row(
              children: iList,
            ),
          ));
        }
      }
    }
    return items;
  }
}
