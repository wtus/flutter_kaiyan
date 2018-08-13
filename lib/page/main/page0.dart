import 'package:flutter/material.dart';
import 'package:kaiyan/page/main/page0/comont_tab_page.dart';
import 'package:kaiyan/page/main/page0/found.dart';
import 'package:kaiyan/page/main/page0/recomand.dart';
import 'package:kaiyan/page/search.dart';
import 'package:kaiyan/util/constant.dart';
import 'package:kaiyan/util/for_test.dart';
import 'package:kaiyan/widget/kaiyan_indictor.dart';
import 'package:dio/dio.dart';
import 'package:kaiyan/widget/route_animation.dart';

class Page0 extends StatefulWidget {
  @override
  State<Page0> createState() {
    return _Page0State();
  }
}

class _Page0State extends State<Page0> with SingleTickerProviderStateMixin {
  List<Tab> tabs = [];
  List<int> ids = [];

  TabController _tabController;
  TabController _tempController;

  @override
  void initState() {
    _tempController = new TabController(vsync: this, length: 0);
    super.initState();
    Dio().get('http://www.wanandroid.com/tools/mockapi/8977/kanyan_tag').then((res) {
      tabs = Constant.tabs_name.map((it) {
        return Tab(
          text: it,
        );
      }).toList();

      res.data.forEach((it) {
        tabs.add(Tab(
          text: it['name'],
        ));
        ids.add(it['id']);
      });

      _tabController = new TabController(vsync: this, length: tabs.length);
      setState(() {});
      _tabController.animateTo(1);
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            buildTopBar(),
            Expanded(
                child: TabBarView(
              controller: tabs.length > 5 ? _tabController : _tempController,
              children: buildTabPage(),
            ))
          ],
        ));
  }

  Widget buildTopBar() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 36.0,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  AnimationPageRoute(
                    slideTween:
                        Tween(begin: Offset(0.0, 0.0), end: Offset.zero),
                    builder: (c) {
                      return Test1();
                    },
                  ));
            },
            child: Icon(
              Icons.menu,
              size: 23.0,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: TabBar(
              tabs: tabs.length > 5 ? tabs : [],
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey[400],
              indicator: KaiyanIndictor(),
              controller: tabs.length > 5 ? _tabController : _tempController,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          GestureDetector(
            child: Icon(Icons.search),
            onTap: () {
              Navigator.push(
                  context,
                  AnimationPageRoute(
                    slideTween:
                        Tween(begin: Offset(0.0, -1.0), end: Offset.zero),
                    builder: (c) {
                      return Search();
                      // return Test1();
                    },
                  ));
            },
          ),
        ],
      ),
    );
  }

  List<Widget> buildTabPage() {
    List<Widget> list = [];

    list.insert(0, Found());
    list.insert(1, Recomand());

    ids.forEach((it) {
      list.add(ComontTabPage(
        id: it.toString(),
      ));
    });

    return list;
  }
}
