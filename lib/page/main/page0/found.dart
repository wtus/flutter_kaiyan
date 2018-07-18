import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kaiyan/util/constant.dart';
import 'package:kaiyan/widget/comon_wiget.dart';

class Found extends StatefulWidget {
  @override
  State<Found> createState() {
    return _FoundState();
  }
}

class _FoundState extends State<Found> {
  dynamic _data;
  List<Widget> widget_list = <Widget>[];
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Dio()
        .get('http://baobab.kaiyanapp.com/api/v4/categories/videoList?id=14')
        .then((res) {
      _data = res;
      updateData();
    });

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        addComments();
        setState(() {});
      }
    });
  }

  void updateData() {
    final items = _data.data['itemList'];
    String img2 = items[2]['data']['cover']['feed'];
    String img3 = items[3]['data']['cover']['feed'];
    String img1 = items[1]['data']['cover']['feed'];
    widget_list = [
      buildPageView(),
      TitleItem(
        text: '本周排行',
      ),
      ImageItem(
        imgUrl: img2,
      ),
      PicTextItem(
        imgUrl: img3,
        text1: items[3]['data']['title'],
        text2: '#' + items[3]['data']['category'] + '/ 开眼精选',
      ),
      PicTextItem(
        imgUrl: img1,
        text1: items[1]['data']['title'],
        text2: '#' + items[1]['data']['category'] + '/ 开眼精选',
      ),
      TitleItem(
        text: '热门分类',
      ),
      RoundRectItem(
        imgUrl: items[3]['data']['author']['icon'],
        text1: items[3]['data']['author']['name'],
      ),
      RoundRectItem(
        imgUrl: items[2]['data']['author']['icon'],
        text1: items[2]['data']['author']['name'],
      ),
      RoundRectItem(
        imgUrl: items[1]['data']['author']['icon'],
        text1: items[1]['data']['author']['name'],
      ),
      TitleItem(
        text: '近期专题',
      ),
      buildPageView(),
      TitleItem(
        text: '热门评论',
      ),
    ];

    addComments();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _data == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            controller: scrollController,
            itemCount: widget_list.length,
            itemBuilder: (c, i) {
              return widget_list[i];
            });
  }

  Widget buildPageView() {
    final items = _data.data['itemList'];
    return Container(
      // 注意 在 listview 里要处理height
      height: 200.0,
      width: double.infinity,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.85),
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (c, i) {
          final item = items[i]['data'];
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.network(
              item['cover']['feed'],
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

  void addComments() {
    print('执行了');
    // widget_list.addAll(_data.data['itemList'].map((it) {
    //   final item = it['data'];
    //   return buildItem(item['cover']['feed'], item['author']['icon'],
    //       item['author']['name'], item['title']);
    // }).toList());
    _data.data['itemList'].forEach((it) {
      print('object');
      final item = it['data'];
      widget_list.add(buildItem(item['cover']['feed'], item['author']['icon'],
           item['author']['name'], item['title']));
    });
  }
}
