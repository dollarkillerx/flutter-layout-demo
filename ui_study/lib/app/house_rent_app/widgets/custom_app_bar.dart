import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/menu.svg')),

              // ClipOval(
              //   child: Image.asset('assets/images/avatar.jpeg', width: 50, fit: BoxFit.cover,),
              // )

              // CircleAvatar 专门设置头像
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpeg'),
              )
            ],
          ),
        )
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
