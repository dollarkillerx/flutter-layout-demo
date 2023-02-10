import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter 布局基础',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false, // 关闭debug
        // debugShowMaterialGrid: true, // debug参考线

        home: Scaffold(
          appBar: AppBar(title: Text("基础布局")),
          body: HomeSWidget(),
        ));
  }
}

class HomeSWidget extends StatefulWidget {
  const HomeSWidget({Key? key}) : super(key: key);

  @override
  State<HomeSWidget> createState() => _HomeSWidgetState();
}

class _HomeSWidgetState extends State<HomeSWidget> {
  bool loding = true;
  Dio _dio = Dio();
  List<Photos> photos = <Photos>[];

  @override
  void initState() {
    super.initState();

    // 执行异步函数
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    Response response;
    response = await _dio
        .get("http://jsonplaceholder.typicode.com/photos?_start=0&_limit=16");
    response.data.forEach((v) {
      photos.add(new Photos.fromJson(v));
    });

    setState(() {
      loding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loding
        ? Center(
      child: CircularProgressIndicator(),
    )
        : Container(
      child: ListView.builder(
          itemCount: photos.length,
          // itemExtent: 100,
          itemBuilder: (BuildContext context, int index) {
            return pho(photos[index].url!, photos[index].title!,
                photos[index].thumbnailUrl!);
          }),
    );
  }
}

Widget pho(String imgUrl, String title, String content) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
    height: 150,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network(
          imgUrl,
          height: 150,
          width: 150,
        ),
        Expanded(
          // --------------------------------------- Expanded 占用剩余空间
            child: Container(
              color: Colors.amber,
              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    content,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    maxLines: 5,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ))
      ],
    ),
  );
}

class Photos {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Photos({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Photos.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}
