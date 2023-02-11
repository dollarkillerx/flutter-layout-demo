import 'package:basic_layout/common/assets.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 38),
            child: Text(
              "Browse & Order All Products at Any Time",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2B2A2A),
                  height: 23 / 20),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            // color: Colors.blueGrey,
            child: Image.asset(
              AssetsImages.welcomePng,
              height: 400,
              width: double.infinity,
              fit: BoxFit.fitWidth, // 剪切方式
            ),
          ),
          SizedBox(
            height: 83,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff2B2A2A),
                        fontWeight: FontWeight.w300),
                  )),
              Container(
                height: 42,
                width: 139,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(1),
                    // maximumSize: MaterialStateProperty.all(Size.zero),
                  ),
                ),

                // 这里圆角 需要 配合 clipBehavior 裁剪参数
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(32)),
              )
            ],
          )
        ],
      ),
    );
  }
}
