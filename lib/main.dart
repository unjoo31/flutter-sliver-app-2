import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _SliversScreenState createState() => _SliversScreenState();
}

class _SliversScreenState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      // ScrollView의 종류로 Sliver와 같이 사용된다.
      body: CustomScrollView(
        slivers: <Widget>[
          // appBar
          SliverAppBar(
            expandedHeight: 250.0, // appBar 높이
            pinned: true,
            floating: false,
            snap: false,
            // Sliver appBar를 설정
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              centerTitle: true,
              background: FlutterLogo(),
            ),
          ),

          // Sliver 1
          // basic
          SliverFillRemaining(
            child: Center(
                child: Text("SliverFillRemaining",
                    style: TextStyle(fontSize: 20))),
          ),

          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: MySliverPersistentHeaderDelegate(
              minHeight: 50.0,
              maxHeight: 120.0,
              child: Container(
                color: Colors.blue[300],
                child: const Center(
                  child: Text(
                    'SliverPersistentHeader',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          // Sliver 2
          // Grid view

          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0, // Grid view 너비
              mainAxisSpacing: 10.0, // 행 간 거리
              crossAxisSpacing: 10.0, // 열 간 거리
            ),
            // 화면에 표시될 위젯을 설정
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.green,
                  child: Text(
                    'Grid Item $index',
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },
              childCount: 4,
            ),
          ),

          SliverFillViewport(
            delegate: SliverChildBuilderDelegate(
              childCount: 2,
              (context, index) {
                return Card(
                  child: Container(
                    child: Text(
                      "Fill ViewPort Item ${index}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate([
              Text("SliverList", style: TextStyle(fontSize: 20)),
              Container(
                child: Image(
                    image: NetworkImage('https://picsum.photos/id/1/200/300'),
                    fit: BoxFit.cover),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Image(
                    image: NetworkImage('https://picsum.photos/id/2/200/300'),
                    fit: BoxFit.cover),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Image(
                    image: NetworkImage('https://picsum.photos/id/3/200/300'),
                    fit: BoxFit.cover),
              ),
            ]),
          ),

          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: 10,
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Image.network(
                "https://picsum.photos/id/${index}/200/300",
                fit: BoxFit.contain,
              ),
            ),
          )),

          // Sliver 3
          // List view
          SliverFixedExtentList(
            itemExtent: 50.0,
            // 화면에 표시될 위젯을 설정
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    'List Item $index',
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverPersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant MySliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
