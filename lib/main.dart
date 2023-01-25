import 'package:flutter/material.dart';
import 'package:subq/typeTest.dart';
import 'appbar.dart';
import 'constants.dart';
import 'typeTest.dart';

void main(){
  runApp(const subQ());
}

class subQ extends StatelessWidget {
  const subQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(top: 20.0, left: 20.0, right:20.0),
            alignment: Alignment.center,
            height: 150.0,
            decoration: kContainerStyle,
            child: Text(
              "당신의 샌드위치 취향은 어떨까요?\n\n개인맞춤 서브웨이 메뉴 추천 서비스\n#꿀조합 #맛 #건강",
              textAlign: TextAlign.center,
              style: kLargeTextStyle.copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 50.0,),
          Image.asset('images/menus/eggmayo.png', height: 110.0,),
          const SizedBox(height: 50.0,),
          const Text('브레드부터 소스까지\n재료를 평가하면\n서브큐가 꿀조합을 추천해드려요.',
          textAlign: TextAlign.center,
          style:kLargeTextStyle),
          const SizedBox(height: 50.0,),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TestStart())
              );
            },
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: buttonStyle,
              child: const Text(
                '취향 분석 시작하기', style: kMediumTextStyle,
              ),
            ),
          )
        ]
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 30.0),
          const Text("SUBQ is the Scenario for your health",
          style: kSmallTextStyle,),
          _buildMenuItem(context,
              Icons.insert_comment_outlined, '의견 보내기'),
          _buildMenuItem(context, Icons.policy_outlined, '약관 및 정책'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10.0,),
              Container(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text("현재 버전 1.0.0",
                  style: kSmallTextStyle.copyWith(color: Colors.grey),),
              )
            ]
          )
        ],
      ),
    );
  }

  //향후 메뉴 페이지에 추가될 목록들의 생성을 용이하게 하기 위함
  Widget _buildMenuItem(BuildContext currentPage, IconData icon, String text) {
    return InkWell(
      onTap: () {
        Navigator.push(currentPage,
            MaterialPageRoute(builder: (currentPage) => const SendReport())
        );
      },
      child: (
        Container(
          // color: Colors.yellow, //for test
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          height: 60,
          child: AspectRatio(
            aspectRatio: 5 / 1,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              // color: Colors.grey, //for test
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(icon, size: 30.0,),
                  const SizedBox(width: 20.0,),
                  Text(text,
                    textAlign: TextAlign.left,
                    style: kMediumTextStyle,),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}

//의견 보내기 페이지
class SendReport extends StatelessWidget {
  const SendReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(),

    );
  }
}
