import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_shop/http/index.dart';
import 'package:mi_shop/http/api.dart';
import 'package:mi_shop/utils/index.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Category extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Page();
  }
}

class Page extends State<Category> {
  List pageData = List();
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
        // appBar: new AppBar(
        //   title: new Text('Welcome to Category'),
        // ),
        body: new Container(
          child: new Row(
            children: <Widget>[
              Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                      border: Border(
                          right:
                              BorderSide(width: 1, color: Color(0xffefefef)))),
                  // margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: new ListView(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    shrinkWrap: true,
                    children: left,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: new ListView(
                  padding: EdgeInsets.only(
                      top: 0,
                      right: ScreenUtil().setSp(32),
                      left: ScreenUtil().setSp(32)),
                  // shrinkWrap: true,
                  children: right,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> left = [];
  List<Widget> right = [];
  void requestAPI() async {
    // 请求API数据
    var res = await Http.post(path: CATEGORY, data: {});
    setState(() {
      pageData = res;
    });
    List<Widget> list = [];
    List<Widget> list1 = [];
    List<Widget> temp = [];
    for (var item in pageData) {
      list.add(new Container(
        margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: new Align(
          // alignment: Alignment.center,
          child: new Text(
            item['category_name'],
            maxLines: 1,
            style: TextStyle(
              color: Color(0xff3c3c3c),
              fontSize: ScreenUtil().setSp(24),
            ),
          ),
        ),
      ));
      for (var item1 in item['category_list']) {
        if (item1['body']['items'] != null) {
          for (var item2 in item1['body']['items']) {
            if (item2['product_name'] != null) {
              temp.add(new Container(
                width: ScreenUtil().setWidth(150),
                margin: EdgeInsets.only(bottom: 10),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new CachedNetworkImage(
                      width: ScreenUtil().setWidth(100),
                      imageUrl: addHttp(item2['img_url']),
                      placeholder: (context, url) =>
                          new CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          new Icon(Icons.error),
                    ),
                    new Container(
                      child: new Text(
                        item2['product_name'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xff757575),
                            fontSize: ScreenUtil().setSp(18)),
                      ),
                    )
                  ],
                ),
              ));
            } else {
              temp.add(new Container(
                child: new Image.network(addHttp(item2['img_url'])),
              ));
            }
          }
          list1.add(Wrap(
            children: temp,
          ));
          temp = []; // 清空中间数组
        } else {
          list1.add(new Container(
              height: ScreenUtil().setHeight(128),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    height: 1,
                    width: 15,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: Color(0xffe0e0e0)))),
                  ),
                  new Text(
                    item1['body']['category_name'],
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(24),
                        color: Color(0xff3c3c3c)),
                  ),
                  new Container(
                    height: 1,
                    width: 15,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: Color(0xffe0e0e0)))),
                  )
                ],
              )));
        }
      }
    }
    left = list;
    right = list1;
  }
}
