import 'package:flutter/material.dart';
import 'package:subq/SubPages.dart';
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
      title: Image.asset('image/icon/logo.png', width: 90.0,),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios, color: Colors.grey, size: 30,),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SendReport()
                ),
              );
            },
            icon: const Icon(Icons.info_outline, color: Colors.grey, size: 30,)),
      ],
    );
  }
}

