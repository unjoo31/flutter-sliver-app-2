import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();

  double prev = 0;
  double next = 0;
  double height = 300;
  double op = 1.0;

  @override
  void initState() {
    _controller.addListener(() {
      scrollListener();
    });
    super.initState();
  }

  void scrollListener() {
    print("스크롤 동작중");
    double currentOffset = _controller.offset; // offset : 바의 위치
    print("currentOffset : ${currentOffset}");

    // 실습
    if (currentOffset < 300) {
      setState(() {
        height = height - (currentOffset - prev);
        op = (300 - currentOffset) / 300;
        if (height < 56) {
          height = 56;
        }
        print("height ${height}");
      });
    }

    // 301 300
    if (currentOffset > prev) {
      // 아래방향
      print("아래로 내려가요");
    }

    // 300 301
    if (currentOffset < prev) {
      // 위방향
      print("위로 올라가요");
    }

    if (currentOffset == _controller.position.maxScrollExtent) {
      print("가방 하단");
      setState(() {
        height = 0;
      });
    }

    // currentOffset == 0
    if (currentOffset == _controller.position.minScrollExtent) {
      print("가방 위");
    }

    prev = currentOffset;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color.fromRGBO(255, 0, 0, op),
              height: height,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Good",
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _controller,
                itemCount: 50,
                itemBuilder: (context, index) => Text("제목 $index"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
