import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:kaiyan/widget/comon_wiget.dart';
import 'package:kaiyan/widget/type_text.dart';

class Detail extends StatefulWidget {
  final dynamic item;

  const Detail({@required this.item}) : super();

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 230.0,
              child: Image.network(
                widget.item['cover']['feed'],
                fit: BoxFit.cover,
              )),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.item['cover']['blurred']))),
              child: ListView(
                padding: EdgeInsets.all(0.0),
                children: buildItems(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buidAction() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
              Text(
                widget.item['consumption']['collectionCount'].toString(),
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.share, color: Colors.white),
              Text(
             widget.item['consumption']['shareCount'].toString(),
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.forum, color: Colors.white),
              Text(
                widget.item['consumption']['replyCount'].toString(),
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.file_download, color: Colors.white),
              Text(
                '缓存',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> buildItems() {
    List<Widget> list = [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        color: Colors.black.withOpacity(0.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TypeText(
              milliseconds: 700,
              text: widget.item['title'],
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              '#' + widget.item['category'],
              style: TextStyle(color: Colors.white, fontSize: 13.0),
            ),
            TypeText(
              text: widget.item['description'],
              style: TextStyle(color: Colors.white, fontSize: 13.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: buidAction(),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: AvatarItem(
          titleColor: Colors.white,
          imgUrl: widget.item['author']['icon'],
          text1: widget.item['author']['name'],
          text2: widget.item['author']['description'],
        ),
      ),
    ];

    for (var i = 0; i < 5; i++) {
      list.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: PicTextItem(
          text2: '#' + widget.item['category'],
        ),
      ));
    }

    return list;
  }
}
