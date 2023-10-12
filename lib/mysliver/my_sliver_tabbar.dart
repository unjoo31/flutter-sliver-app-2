import 'package:flutter/material.dart';

void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 50.0, // You can adjust the height as needed
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('TabBar Sample'),
            ),
            backgroundColor: Colors.green,
          ),
          SliverToBoxAdapter(
            child: TabBar(
              controller: _tabController,
              tabs: const <Widget>[
                Tab(
                  icon: Icon(Icons.cloud_outlined),
                ),
                Tab(
                  icon: Icon(Icons.beach_access_sharp),
                ),
                Tab(
                  icon: Icon(Icons.brightness_5_sharp),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: const <Widget>[
                Center(
                  child:
                      Text("It's cloudy here", style: TextStyle(fontSize: 20)),
                ),
                Center(
                  child:
                      Text("It's rainy here", style: TextStyle(fontSize: 20)),
                ),
                Center(
                  child:
                      Text("It's sunny here", style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
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
        ],
      ),
    );
  }
}
