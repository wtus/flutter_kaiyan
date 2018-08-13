import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kaiyan/page/detail.dart';
import 'package:kaiyan/widget/comon_wiget.dart';
import 'package:kaiyan/widget/route_animation.dart';
import 'package:video_player/video_player.dart';

final pic_url =
    "https://upload.jianshu.io/collections/images/16/computer_guy.jpg";

class ComontTabPage extends StatefulWidget {
  final String id;

  const ComontTabPage({this.id});

  @override
  State<ComontTabPage> createState() {
    return _ComontTabPageState();
  }
}

class _ComontTabPageState extends State<ComontTabPage> {
  dynamic _data;
  List<Widget> widget_list = <Widget>[];
  ScrollController scrollController = ScrollController();
  bool isPerforming = false;

  @override
  void initState() {
    super.initState();
    Dio()
        .get(
            'http://www.wanandroid.com/tools/mockapi/8977/kanyan')
        .then((res) {
      _data = res;
      _buildList();
    });

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        if (!isPerforming) {
          isPerforming = true;
          _buildList();
        }
      }
    });
  }

  void _buildList() {
    // if (widget_list.length > 0 &&
    //     widget_list.last is Center) {
    //   widget_list.removeLast();
    // }

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
              Navigator.of(context).push(AnimationPageRoute(
                  // fullscreenDialog: true,
                  slideTween:
                      Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero),
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

    isPerforming = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: _data == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              controller: scrollController,
              itemCount: widget_list.length,
              itemBuilder: (c, i) {
                return widget_list[i];
              },
            ),
    );
  }

  Widget buildItem() {
    return Column(
      children: <Widget>[
        TitleItem(
          text: '测试',
          followGone: true,
        ),
        ImageItem(
          imgUrl: pic_url,
        ),
        AvatarItem(
          text1: '水水水水',
          text2: '四大法王',
        ),
        PicTextItem(),
        PicTextItem(),
      ],
    );
  }
}
