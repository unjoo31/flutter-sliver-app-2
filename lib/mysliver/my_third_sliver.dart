import 'package:flutter/material.dart';

class MyThirdSliver extends StatelessWidget {
  const MyThirdSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Text("SliverAppbar"),
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: Image.network(
              "https://picsum.photos/200/300",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 500,
            color: Colors.red,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 100,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: Text("Horizontal Item ${index}"),
                );
              },
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 5,
            (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                    height: 100, color: Colors.blue, child: Text("$index")),
              );
            },
          ),
        ),
        SliverFillViewport(
          delegate: SliverChildBuilderDelegate(
            childCount: 5,
            (context, index) {
              return Card(
                child: Container(
                  child: Text("Fill ViewPort Item ${index}"),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
