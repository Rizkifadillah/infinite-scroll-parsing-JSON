import 'package:flutter/material.dart';
import 'package:infinite_scroll/api/cat.dart';
import 'package:infinite_scroll/api/dog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  TabBar myTabBar = TabBar(
//    indicatorColor: Colors.amber,
    indicator: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black54,width: 1),bottom:BorderSide(color: Colors.black54,width: 1) )),
    tabs: <Widget>[
      Tab(
//        icon: Icon(
//          Icons.comment,
//        ),
        child: Text("Dog",style:  TextStyle(
            color: Colors.black54
        ),),
      ),
      Tab(
        child: Text("Cats",style:  TextStyle(
            color: Colors.black54
        ),),
//        icon: Icon(
//          Icons.comment,
//        ),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, //jumlah tab
      child: Scaffold(
        appBar: AppBar(
            title: Text("Infinite Scroll"),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(myTabBar.preferredSize.height),
              child: Container(color: Colors.white, child: myTabBar),
            )),
        body: TabBarView(
          children: <Widget>[
            dog(),
            cat()
          ],
        ),
      ),
    );
  }
}