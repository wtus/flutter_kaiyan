import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kaiyan/util/constant.dart';
import 'package:kaiyan/widget/comon_wiget.dart';

class Works extends StatefulWidget {
  @override
  State<Works> createState() {
    return _WorksState();
  }

  
}

class _WorksState extends State<Works> {
  dynamic _data;

  List<Widget> widget_list = <Widget>[];

  void _buildList() {
    _data.data['itemList'].forEach((it) {
      final item = it['data'];
      widget_list.add(AvatarItem(
        text1: item['author']['name'],
        text2: '发布：',
        text3: item['title'],
      ));
      widget_list.add(Text(item['description'],
          style: TextStyle(color: Colors.grey, fontSize: 13.0)));
      widget_list.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: buildTagRow(item['tags']),
        ),
      ));
      widget_list.add(ImageItem(
        imgUrl: item['cover']['feed'],
      ));
      widget_list.add(Padding(
         padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: buidAction(),
      ));
      widget_list.add(Divider());
    });
    print('长度： ${widget_list.length}');
    setState(() {});
  }


  List<Widget> buildTagRow(tags) {
    List<Widget> list = [];
    for (var i = 0; i < tags.length; i++) {
      if (i != 0) {
        list.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: buildTag(tags[i]['name']),
        ));
        continue;
      }
      list.add(buildTag(tags[i]['name']));
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    Dio()
        .get('http://www.wanandroid.com/tools/mockapi/8977/kanyan')
        .then((res) {
      _data = res;
      // print(_data.data['itemList'][0]['data']['category']);
      _buildList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      itemCount: widget_list.length,
      itemBuilder: (c, i) => widget_list[i],
    );
  }

  Widget buildTag(String text) {
    return TagItem(
      text: text,
      paddingH: 5.0,
      paddingV: 1.0,
      bgColor: Colors.blue[50],
      textColor: Colors.blue,
    );
  }

  Widget buidAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.favorite_border,
          color: Colors.grey,
        ),
        Icon(Icons.forum, color: Colors.grey),
        Text('08:31'),
        Icon(Icons.file_download, color: Colors.grey),
      ],
    );
  }
}
