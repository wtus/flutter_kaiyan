import 'package:flutter/material.dart';
import 'package:kaiyan/util/constant.dart';

class Page3 extends StatefulWidget {
  @override
  State<Page3> createState() {
    return _Page3State();
  }
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(children: <Widget>[
        buildTopBar(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Image.asset(
            Constant.dir_image + 'pgc_default_avatar.png',
            width: 70.0,
          ),
        ),
        Text('点击登陆即可发表评论及同步已喜欢视频'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <Widget>[Icon(Icons.ac_unit), Text('喜欢')],
              ),
              Container(
                width: 0.4,
                height: 25.0,
                color: Colors.grey,
              ),
              Row(
                children: <Widget>[Icon(Icons.ac_unit), Text('缓存')],
              ),
            ],
          ),
        ),
        Divider(),
        Padding(padding: EdgeInsets.only(top: 35.0), child: Text('我的关注')),
        Padding(
          padding: EdgeInsets.only(top: 35.0),
          child: Text('观看记录'),
        ),
        Padding(
          padding: EdgeInsets.only(top: 35.0),
          child: Text('意见反馈'),
        ),
        Padding(
          padding: EdgeInsets.only(top: 35.0),
          child: Text('我要投稿'),
        ),
        Expanded(
          child: Container(),
        ),
        Text(
          'Version 1.1.1',
          style: TextStyle(fontSize: 13.0, color: Colors.grey),
        ),
      ]),
    );
  }

  Widget buildTopBar() {
    return Container(
      width: double.infinity,
      height: 36.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.settings,
            size: 23.0,
          )
        ],
      ),
    );
  }
}
