import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kaiyan/util/constant.dart';
import 'package:kaiyan/widget/comon_wiget.dart';

class Test1 extends StatefulWidget {
  @override
  State<Test1> createState() {
    return _Test1State();
  }
}

class _Test1State extends State<Test1> {
  @override
  Widget build(BuildContext context) {
    request();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // buildPageView(),
            // TitleItem(
            //   text: '本周排行',
            // ),
            // ImageItem(
            //   imgUrl: Constant.pic_url,
            // ),
            // PicTextItem(),
            // PicTextItem(),
            // TitleItem(
            //   text: '热门分类',
            // ),
            // RoundRectItem(),
            // RoundRectItem(),
            // RoundRectItem(),
            // TitleItem(
            //   text: '近期专题',
            // ),
            // buildPageView(),
            // AvatarItem(),
            // TitleItem(
            //   text: '热门评论',
            // ),
            // buildItem()
          ],
        ),
      ),
    );
  }

  Widget buildPageView() {
    // final items = _data.data['itemList'];
    return Container(
      // 注意 在 listview 里要处理height
      height: 200.0,
      width: double.infinity,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.85),
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (c, i) {
          // return Image.network(items[i]['data']['playUrl']);
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.network(
              Constant.pic_url,
              fit: BoxFit.cover,
            ),
          );
          // return Container(
          //     color: Colors.blueAccent[i * 200], child: Text('data'));
        },
        itemCount: 5,
      ),
    );
  }

  Widget buildItem(
      String imgUrl, String imgAvatar, String name, String itemText1) {
    return Column(
      children: <Widget>[
        AvatarItem(
          imgUrl: imgAvatar,
          text1: name,
        ),
        Container(
          padding: EdgeInsets.only(left: 50.0),
          height: 120.0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                color: Colors.grey[200],
                shape: BoxShape.rectangle),
            padding: EdgeInsets.all(10.0),
            child: PicTextItem(
              imgUrl: imgUrl,
            ),
          ),
        )
      ],
    );
  }
}

buildItems() {}

void request() {
  Dio()
      .get('http://www.wanandroid.com/tools/mockapi/8977/kanyan')
      .then((res) {
    final _data = res;
    final items = _data.data['itemList'];
    var item = _data.data['itemList'][2]['data'];

    _data.data['itemList'].forEach((it) {
      final item = it['data'];
      print(item['cover']['feed']);
      print(item['author']['icon']);
      print(item['author']['name']);
      print(item['title']);
    });

  });
}
