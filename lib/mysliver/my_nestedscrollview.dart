import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var top = 0.0;
  String title = "Good";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
              title: Text(
                "$title",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              expandedHeight: 200.0,
              floating: false,
              pinned: false,
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                double size = MediaQuery.of(context).padding.top + 56;
                top = constraints.biggest.height;
                print("탑 패딩 : ${MediaQuery.of(context).padding.top}");
                if (size == top) {
                  print("슬리버 사라짐");
                }
                return FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      top.toString(),
                      style: TextStyle(fontSize: 12.0),
                    ),
                    background: Image.network(
                      "https://images.unsplash.com/photo-1542601098-3adb3baeb1ec?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=5bb9a9747954cdd6eabe54e3688a407e&auto=format&fit=crop&w=500&q=60",
                      fit: BoxFit.cover,
                    ));
              })),
        ];
      },
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Text("List Item: " + index.toString());
        },
      ),
    ));
  }
}
