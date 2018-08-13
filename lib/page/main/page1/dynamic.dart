import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kaiyan/util/constant.dart';
import 'package:kaiyan/widget/comon_wiget.dart';

class Dynamic extends StatefulWidget {
  @override
  State<Dynamic> createState() {
    return _DynamicState();
  }
}

class _DynamicState extends State<Dynamic> {
  dynamic _data;
  List<Widget> widget_list = <Widget>[];

  @override
  void initState() {
    super.initState();

    Dio()
        .get('http://www.wanandroid.com/tools/mockapi/8977/kanyan')
        .then((res) {
      _data = res;
      _buildList();
    });
  }

  void _buildList() {
    _data.data['itemList'].forEach((it) {
      final item = it['data'];
      widget_list.add(AvatarItem(
        text1: item['author']['name'],
        imgUrl: item['author']['icon'],
        text2: '评论',
      ));
      widget_list.add(Container(
        padding: EdgeInsets.only(left: 50.0),
        height: 120.0,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: Colors.grey[200],
              shape: BoxShape.rectangle),
          padding: EdgeInsets.all(10.0),
          child: PicTextItem(
            imgUrl: item['cover']['feed'],
          ),
        ),
      ));
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      itemCount: widget_list.length,
      itemBuilder: (c, i) => widget_list[i],
    );
  }
}
