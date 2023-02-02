import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'TypeTest.dart';
import 'AppBar.dart';
import 'constants.dart';
import 'package:subq/SubPages.dart';

void main() {
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
    return Material(
      color: materialColor,
      child: Center(
        child: Container(
          color: Colors.white,
          width: screenCheck(context),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            MainAppBar(context, 0),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              alignment: Alignment.center,
              height: 150.0,
              decoration: kContainerStyle,
              child: Text(
                "당신의 샌드위치 취향은 어떨까요?\n\n개인맞춤 서브웨이 메뉴 추천 서비스\n#꿀조합 #맛 #건강",
                textAlign: TextAlign.center,
                style: kLargeTextStyle.copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Image.asset(
              'image/menu/eggmayo.png',
              height: 110.0,
            ),
            const SizedBox(
              height: 50.0,
            ),
            const Text('브레드부터 소스까지\n재료를 평가하면\n서브큐가 꿀조합을 추천해드려요.',
                textAlign: TextAlign.center, style: kLargeTextStyle),
            const SizedBox(
              height: 50.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TestStart()));
              },
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: kButtonStyle,
                child: const Text(
                  '취향 분석 시작하기',
                  style: kMediumTextStyle,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
