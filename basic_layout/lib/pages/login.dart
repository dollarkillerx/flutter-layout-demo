import 'package:basic_layout/common/app_colors.dart';
import 'package:basic_layout/common/assets.dart';
import 'package:basic_layout/pages/welcome.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 检查账户是否输入有效
  bool isUserNameValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundSplash,
      body: Column(
        children: [
          Expanded(
            child: _buildHeader(),
            flex: 1,
          ),
          Expanded(
            child: _buildFrom(),
            flex: 2,
          ),
        ],
      ),
    );
  }

  // header
  Widget _buildHeader() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 57,
            width: 60,
            // color: Colors.white,
            child: Image.asset(AssetsImages.logoPng),
          ),
          SizedBox(
            height: 22,
          ),
          Text(
            "Let's Sign You In",
            style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
                height: 22 / 19),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Welcome back, you've been missed!",
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
        ],
      ),
    );
  }

  // 表单
  Widget _buildFrom() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.fromLTRB(20, 40, 20, 35),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(35)),
      child: Column(
        children: [
          // Username or E-Mail
          InputButton(
              "Username or E-Mail",
              "google@google.com",
              Icon(Icons.supervised_user_circle_sharp),
              isUserNameValid ? Icon(Icons.check) : Icon(Icons.error_outline),
              (value) {
            setState(() {
              isUserNameValid = value.isNotEmpty && value.length > 0;
            });
          }),
          SizedBox(
            height: 36,
          ),
          // Password
          InputButton(
              "Password",
              "*************",
              Icon(Icons.lock_open_outlined),
              Text(
                "Forget?",
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  height: 27 / 16,
                ),
              ),
              () {}),
          SizedBox(
            height: 36,
          ),
          // Sign In
          Container(
            height: 57,
            width: 309,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => WelcomePage()));
              },
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
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
          ),
          SizedBox(
            height: 16,
          ),
          // Don't have an account ?
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don’t have an accoun? "),
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget InputButton(String title, String context, Widget prefixIcon,
    Widget suffixIcon, Function onChange) {
  return Container(
    // color: Colors.cyanAccent,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Color(0xff838383)),
        ),
        TextField(
          onChanged: (value) {
            onChange(value);
          },
          decoration: InputDecoration(
            hintText: context,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffixIconColor: Colors.green,
          ),
        ),
      ],
    ),
  );
}
