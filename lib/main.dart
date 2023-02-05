import 'package:flutter/material.dart';
import 'TypeTest.dart';
import 'AppBar.dart';
import 'constants.dart';
import 'Button.dart';

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
            MainAppBar(
              context,
              iconBtn: IconButton(
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 30,
                  )),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              alignment: Alignment.center,
              height: 150.0,
              decoration: kContainerStyle,
              child: Text(
                "당신의 샌드위치 취향은 어떨까요?\n\n개인맞춤 서브웨이 메뉴 추천 서비스\n#꿀조합 #맛 #건강",
                textAlign: TextAlign.center,
                style: kLargeTextStyle,
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
                  style: kMediumBTextStyle,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

//저장된 데이터(purpose)
var purpose;
//(bread code)
Buttons btn_bread1 = Buttons('SUBWAY_BREAD_10001');
Buttons btn_bread2 = Buttons('SUBWAY_BREAD_10002');
Buttons btn_bread3 = Buttons('SUBWAY_BREAD_10003');
Buttons btn_bread4 = Buttons('SUBWAY_BREAD_10004');
Buttons btn_bread5 = Buttons('SUBWAY_BREAD_10005');
Buttons btn_bread6 = Buttons('SUBWAY_BREAD_10006');
//(main topping code)
Buttons btn_main1 = Buttons('SUBWAY_MAINMENU_10017'); //에그마요
Buttons btn_main2 = Buttons('SUBWAY_MAINMENU_10011'); //스테이크
Buttons btn_main3 = Buttons('SUBWAY_MAINMENU_10016'); //참치
Buttons btn_main4 = Buttons('SUBWAY_MAINMENU_10008'); //바비큐
Buttons btn_main5 = Buttons('SUBWAY_MAINMENU_10014'); //쉬림프
Buttons btn_main6 = Buttons('SUBWAY_MAINMENU_10012'); //치킨
Buttons btn_main7 = Buttons('SUBWAY_MAINMENU_10009'); //햄
Buttons btn_main8 = Buttons('SUBWAY_MAINMENU_10019'); //베이컨
Buttons btn_main9 = Buttons('SUBWAY_MAINMENU_10018'); //베지
Buttons btn_main10 = Buttons('SUBWAY_MAINMENU_10010'); //치킨브레스트햄
Buttons btn_main11 = Buttons('SUBWAY_TOPPING_OTHER_10001'); //페퍼로니
Buttons btn_main12 = Buttons('SUBWAY_TOPPING_OTHER_10002'); //살라미
//cheese
Buttons btn_cheese1 = Buttons('SUBWAY_TOPPING_CHEESE_10001'); //아메리칸
Buttons btn_cheese2 = Buttons('SUBWAY_TOPPING_CHEESE_10002'); //슈레드
Buttons btn_cheese3 = Buttons('SUBWAY_TOPPING_CHEESE_10003'); //모차렐라
//vegetable
Buttons btn_vege1 = Buttons('SUBWAY_TOPPING_BASIC_10001'); //양상추
Buttons btn_vege2 = Buttons('SUBWAY_TOPPING_BASIC_10002'); //토마토
Buttons btn_vege3 = Buttons('SUBWAY_TOPPING_BASIC_10003'); //오이
Buttons btn_vege4 = Buttons('SUBWAY_TOPPING_BASIC_10004'); //피망
Buttons btn_vege5 = Buttons('SUBWAY_TOPPING_BASIC_10005'); //양파
Buttons btn_vege6 = Buttons('SUBWAY_TOPPING_BASIC_10006'); //피클
Buttons btn_vege7 = Buttons('SUBWAY_TOPPING_BASIC_10007'); //올리브
Buttons btn_vege8 = Buttons('SUBWAY_TOPPING_BASIC_10008'); //할라피뇨
Buttons btn_vege9 = Buttons('SUBWAY_TOPPING_OTHER_10003'); //아보카도
//sauce
Buttons btn_sauce1 = Buttons('SUBWAY_SAUCE_10014'); //랜치
Buttons btn_sauce2 = Buttons('SUBWAY_SAUCE_10015'); //마요네즈
Buttons btn_sauce3 = Buttons('SUBWAY_SAUCE_10010'); //스위트 어니언
Buttons btn_sauce4 = Buttons('SUBWAY_SAUCE_10011'); //허니 머스타드
Buttons btn_sauce5 = Buttons('SUBWAY_SAUCE_10012'); //스위트 칠리
Buttons btn_sauce6 = Buttons('SUBWAY_SAUCE_10016'); //핫 칠리
Buttons btn_sauce7 = Buttons('SUBWAY_SAUCE_10017'); //사우스 웨스트 치폴레
Buttons btn_sauce8 = Buttons('SUBWAY_SAUCE_10008'); //머스타드
Buttons btn_sauce9 = Buttons('SUBWAY_SAUCE_10018'); //홀스래디쉬
Buttons btn_sauce10 = Buttons('SUBWAY_SAUCE_10019'); //올리브 오일
Buttons btn_sauce11 = Buttons('SUBWAY_SAUCE_10009'); //레드와인식초
Buttons btn_sauce12 = Buttons('SUBWAY_SAUCE_10020'); //소금
Buttons btn_sauce13 = Buttons('SUBWAY_SAUCE_10021'); //후추
Buttons btn_sauce14 = Buttons('SUBWAY_SAUCE_10013'); //스모크 바비큐

