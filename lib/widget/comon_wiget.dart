import 'package:flutter/material.dart';

const pic_url =
    "https://upload.jianshu.io/collections/images/16/computer_guy.jpg";

class AvatarItem extends StatelessWidget {
  final double radius;
  final String imgUrl;
  final String text1;
  final String text2;
  final String text3;
  final IconData icon;
  final Color titleColor;

  const AvatarItem(
      {this.radius: 20.0,
      this.imgUrl: pic_url,
      this.text1: '',
      this.text2: '',
      this.text3: '',
      this.titleColor: Colors.black,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: this.radius,
            backgroundImage: NetworkImage(this.imgUrl),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(this.text1,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: this.titleColor,
                          fontWeight: FontWeight.bold)),
                  Row(
                    children: <Widget>[
                      Text(
                        this.text2,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                      Text(
                        this.text3,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Icon(
            Icons.save_alt,
            size: 18.0,
          )
        ],
      ),
    );
  }
}

class PicTextItem extends StatelessWidget {
  final String text1;
  final String text2;
  final String imgUrl;

  const PicTextItem({this.text1: '', this.text2: '', this.imgUrl: pic_url});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: ImageItem(
              imgUrl: this.imgUrl,
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(this.text1,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(this.text2,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14.0,
                        )),
                    Icon(
                      Icons.scanner,
                      color: Colors.grey[400],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ImageItem extends StatelessWidget {
  final String imgUrl;

  const ImageItem({@required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220.0,
      child: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              image: DecorationImage(
                  image: NetworkImage(this.imgUrl), fit: BoxFit.cover),
              color: Colors.amber),
        ),
        Positioned(
          bottom: 5.0,
          right: 5.0,
          child: Container(
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0), color: Colors.black),
            child: Text(
              '01:48',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]),
    );
  }
}

class TitleItem extends StatelessWidget {
  String text;
  bool followGone;
  double fontSize = 34.0;
  TitleItem({@required this.text, this.followGone: true, this.fontSize: 25.0});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  this.text,
                  style: TextStyle(fontSize: fontSize, fontFamily: 'FZLanTing'),
                ),
                Icon(Icons.arrow_right)
              ],
            ),
            Row(
              children: <Widget>[
                Offstage(offstage: followGone, child: FollowBtn()),
              ],
            )
          ]),
    );
  }
}

class RoundRectItem extends StatelessWidget {
  final String text1;
  final String text2;
  final String imgUrl;

  const RoundRectItem({this.text1: '', this.text2: '', this.imgUrl: pic_url});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 38.0,
            height: 38.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                    image: NetworkImage(this.imgUrl), fit: BoxFit.cover)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(this.text1,
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold)),
                  Text(
                    this.text2,
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          FollowBtn()
        ],
      ),
    );
  }
}

class FollowBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            border: Border.all(width: 0.7, color: Colors.grey)),
        child: Text(
          '+ 关 注',
          style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold),
        ));
  }
}

class TagItem extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final double paddingH;
  final double paddingV;
  final bool hasBorder;
  final Color borderColor;

  const TagItem(
      {this.text,
      this.bgColor: Colors.pink,
      this.textColor: Colors.red,
      this.hasBorder: false,
      this.paddingH: 2.0,
      this.paddingV: 2.0,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.symmetric(vertical: this.paddingV, horizontal: paddingH),
        decoration: BoxDecoration(
            color: this.bgColor,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            border: this.hasBorder
                ? Border.all(width: 1.0, color: this.borderColor)
                : null),
        child: Text(
          this.text,
          style: TextStyle(fontSize: 11.0, color: this.textColor),
        ));
  }
}

class MyDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[700],
      height: 0.3,
      width: double.infinity,
    );
  }
}
