import 'package:flutter/material.dart';
import 'main.dart';

//현재 appbar가 화면 크기에 따라 늘어나는 부분은 향후 수정 예정

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: IconButton(
        //현재 로고 사진에 흰 배경이 있어 위화감이 있으나 향후 수정할 예정
        icon: Image.asset('images/icons/logo.jpg'),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=> const FirstPage())
          );
        },
        iconSize: 90.0,
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios, color: Colors.grey,),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MenuPage()
                ),
              );
            },
            icon: const Icon(Icons.menu, color: Colors.grey,)),
      ],
    );
  }
}

