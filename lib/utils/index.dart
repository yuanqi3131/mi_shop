String addHttp(url) {
  return 'http:' + url;
}

int handlerColor(String color) {
  // 处理颜色
  return int.parse(("0xff" + color.substring(1)).toString());
}
