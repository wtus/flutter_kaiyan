import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kaiyan/page/detail.dart';
import 'package:kaiyan/page/main/page0/comont_tab_page.dart';
import 'package:kaiyan/widget/comon_wiget.dart';

class Recomand extends StatefulWidget {
  @override
  State<Recomand> createState() {
    return _RecomandState();
  }
}

class _RecomandState extends State<Recomand> {
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
    final list = <Widget>[];
    _data.data['itemList'].sublist(0, 5).forEach((it) {
      final item = it['data'];
      list.add(Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Column(
          children: <Widget>[
            ImageItem(
              imgUrl: item['cover']['feed'],
            ),
            AvatarItem(
              imgUrl: item['author']['icon'],
              text1: item['author']['name'],
              text2: item['author']['description'],
            )
          ],
        ),
      ));
    });

    widget_list.add(Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text('FRIDAY,JULY 13',
          style: TextStyle(
              color: Colors.grey[400], fontFamily: 'Lobster', fontSize: 16.0)),
    ));

    widget_list.add(TitleItem(
      text: '开眼今日编辑精选',
    ));

    widget_list.add(buildPageView(list));

    final data = _data.data['itemList'];
    for (var i = 0; i < data.length - 1; i++) {
      var item = data[i]['data'];
      switch (i % 3) {
        case 0:
          widget_list.add(TitleItem(
            text: '近期热门',
            followGone: true,
          ));
          widget_list.add(ImageItem(
            imgUrl: item['cover']['feed'],
          ));
          widget_list.add(AvatarItem(
            text1: item['title'],
            text2: '#' + item['category'],
          ));
          break;
        case 1:
          widget_list.add(GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (c) => Detail(
                        item: item,
                      )));
            },
            child: PicTextItem(
              imgUrl: item['cover']['feed'],
              text1: item['title'],
              text2: '#' + item['category'],
            ),
          ));
          break;
        case 2:
          widget_list.add(PicTextItem(
            imgUrl: item['cover']['feed'],
            text1: item['title'],
            text2: '#' + item['category'],
          ));
          break;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: _data == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: widget_list.length,
              itemBuilder: (c, i) => widget_list[i],
            ),
    );
  }

  Widget buildPageView(List<Widget> list) {
    print(list.length);
    return Container(
      height: 276.0,
      width: double.infinity,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.85),
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (c, i) {
          return list[i];
        },
        itemCount: 5,
      ),
    );
  }
}
