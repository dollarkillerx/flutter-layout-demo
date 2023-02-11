import 'package:flutter/material.dart';

import '../common/models.dart';
import '../widgets/appbar.dart';
import '../widgets/bubble.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatModel> data = [
    ChatModel(
        "https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U",
        "https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U",
        false),
    ChatModel(
        "https://fastly.picsum.photos/id/674/200/300.jpg?hmac=kS3VQkm7AuZdYJGUABZGmnNj_3KtZ6Twgb5Qb9ITssY",
        "https://fastly.picsum.photos/id/674/200/300.jpg?hmac=kS3VQkm7AuZdYJGUABZGmnNj_3KtZ6Twgb5Qb9ITssY",
        false),
    ChatModel(
        "https://fastly.picsum.photos/id/774/200/200.jpg?hmac=kHZuEL0Tzh_9wUk4BnU9zxodilE2mGBdAAor2hKpA_w",
        "https://fastly.picsum.photos/id/774/200/200.jpg?hmac=kHZuEL0Tzh_9wUk4BnU9zxodilE2mGBdAAor2hKpA_w",
        true),
    ChatModel(
        "https://fastly.picsum.photos/id/674/200/300.jpg?hmac=kS3VQkm7AuZdYJGUABZGmnNj_3KtZ6Twgb5Qb9ITssY",
        "S3VQkm7AuZdYJGUABZGmnNj_3KtZ6Twgb5Qb9ITssY",
        false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(),
      body: _bodyView(),
    );
  }

  Widget _bodyView() {
    return GestureDetector(
      // 支持手势的点击事件
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 点击其他地方的时候, 让输入框失去焦点
        Focus.of(context).requestFocus(FocusNode());
      },
      // child: Column(
      //   children: [_chatView(), _inputView()],
      // ),
      child: SafeArea(
        // 安全框架
        child: Column(
          children: [_chatView(), _inputView()],
        ),
      ),
    );
  }

  final outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(16));

  // Chat 部分
  Widget _chatView() {
    return Expanded(
        child: ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final model = data.elementAt(index);
        return BubbleWidget(
          avatar: model.avatar,
          text: model.text,
          direction: model.isMyself ? TextDirection.rtl : TextDirection.ltr,
        );
      },
    ));
  }

  // 输入框部分
  Widget _inputView() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, ),
    child: Row(
      children: [
        Expanded(
            child: TextField(
              // 兼容多行输入 maxLines, keyboardType
              maxLines: null,
              keyboardType: TextInputType.multiline,
              // 多行模式
              cursorColor: Colors.black,
              // 光标颜色
              controller: _controller,
              decoration: InputDecoration(
                filled: true, // 填充背景
                fillColor: Colors.grey[200],
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
              ),
            )),
        ElevatedButton(
          onPressed: _onSend,
          child: Text("Send"),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // 背景色
              foregroundColor: Colors.black, // 选中
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
        ),
      ],
    ),);
  }

  Future<void> _onSend() async {
    final text = _controller.text;
    if (text.length == 0) {
      return;
    }
    final model = ChatModel(
        "https://fastly.picsum.photos/id/774/200/200.jpg?hmac=kHZuEL0Tzh_9wUk4BnU9zxodilE2mGBdAAor2hKpA_w",
        text,
        true);
    setState(() {
      data.add(model);
    });
    _controller.clear();
  }
}
