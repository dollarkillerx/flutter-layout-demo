import 'package:basic_layout/common/app_colors.dart';
import 'package:basic_layout/common/assets.dart';
import 'package:basic_layout/pages/login.dart';
import 'package:basic_layout/pages/welcome.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // 倒计时
  final duration = 10;
  int number = 0;

  // 倒计时控制器
  Future<void> _countdown() async {
    number = duration;
    for (var i = 0; i < duration; i++) {
      await Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            number--;
          });
        }

        if (number == 0) {
          print("倒计时结束");
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _countdown();
  }

  @override
  Widget build(BuildContext context) {
    return _buildView(context);
  }

  // 主视图
  Widget _buildView(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSplash,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            _buildLogo(),
            const SizedBox(
              height: 24,
            ),
            // title
            Text(
              "Online Market",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  height: 22 /
                      19 // 行高: line-height: 22px; flutter 里表示 需要 css行高/fontSize
                  ),
            ),
            const SizedBox(
              height: 24,
            ),
            // time
            Text(
              number > 0 ? "$number" : "done",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  height: 22 / 19),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // 底部
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(48)),
        ),
        // 图片
        Image.asset(
          AssetsImages.logoPng,
          width: 80,
          height: 84,
        )
      ],
    );
  }
}
