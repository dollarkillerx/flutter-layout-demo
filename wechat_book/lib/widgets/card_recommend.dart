import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wechat_book/widgets/base_cared.dart';

/// 本周推荐
class CardRecommend extends BaseCared {
  @override
  _CardRecommendState createState() => _CardRecommendState();
}

class _CardRecommendState extends BaseCaredState {
  @override
  void initState() {
    subTitleColor = Color(0xffb99444);
    super.initState();
  }

  @override
  topTitle(String title) {
    return super.topTitle('本周推荐');
  }

  @override
  Widget subTitle(String title) {
    return super.subTitle('送你一天♾️无限卡, 全场书籍免费读 > ');
  }

  @override
  bottomContent() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Image.network(
            'http://www.devio.org/io/flutter_beauty/card_1.jpg',
            fit: BoxFit.cover),
      ),
    );
  }
}
