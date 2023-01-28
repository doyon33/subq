import 'package:flutter/material.dart';
import 'appbar.dart';
import 'constants.dart';
import 'button.dart';

//first page of test
class TestStart extends StatelessWidget {
  const TestStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Column(
        children: [
          buildContainer('', 'images/icons/question.png', '어떤 목적을 중심으로\n추천받고 싶으신가요?\n'),
          const SizedBox(height: 5.0,),
          buildButton(context, const TestBread1(), '체중 유지'),
          buildButton(context, const TestBread1(), '저탄고지식'),
          buildButton(context, const TestBread1(), '저칼로리식'),
          buildButton(context, const TestBread1(), '저염식'),
          buildButton(context, const TestBread1(), '맛있는 조합')
        ],
      ),
    );
  }
}


//type test : bread_page1
class TestBread1 extends StatefulWidget {
  const TestBread1({Key? key}) : super(key: key);

  @override
  State<TestBread1> createState() => _TestBread1State();
}

class _TestBread1State extends State<TestBread1> {

  Buttons btn_bread1 = Buttons('SUBWAY_BREAD_10001');
  Buttons btn_bread2 = Buttons('SUBWAY_BREAD_10002');
  Buttons btn_bread3 = Buttons('SUBWAY_BREAD_10003');
  Buttons btn_bread4 = Buttons('SUBWAY_BREAD_10004');

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Column(
        children: [
          buildTop(1, 0.083, '빵'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              toppingImg('허니오트', 'images/breads/honey_oat.png', '#고소한 위트빵 #오트밀 가루'),
              buildButtons(btn_bread1, updateData),
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              toppingImg('하티', 'images/breads/hearty.png', '#화이트빵 + 옥수수 가루 #겉바속촉'),
              buildButtons(btn_bread2, updateData),
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              toppingImg('위트', 'images/breads/wheat.png', '#9가지 곡물 #건강 #고소'),
              buildButtons(btn_bread3, updateData)
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              toppingImg('파마산 오레가노', 'images/breads/parmesan.png', '#파마산 오레가노 시즈닝 #허브향'),
              buildButtons(btn_bread4, updateData)
            ],),
          buildButton(context, const TestBread2(), '다음으로')
        ]
      ),
    );
  }
  void updateData(int num, Buttons btn) {
    setState(() {
      if (num == 1) {
        btn.clickBad();
      }
      else if (num == 2) {
        btn.clickGood();
      }
      else if (num == 3) {
        btn.clickNice();
      }
      // finalData1 = btn_bread1.getDataCode();
      // finalData2 = btn_bread2.getDataCode();
    });
  }
}

//type test : bread_page2
class TestBread2 extends StatefulWidget {
  const TestBread2({Key? key}) : super(key: key);

  @override
  State<TestBread2> createState() => _TestBread2State();
}

class _TestBread2State extends State<TestBread2> {

  Buttons btn_bread5 = Buttons('SUBWAY_BREAD_10005');
  Buttons btn_bread6 = Buttons('SUBWAY_BREAD_10006');

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Column(
          children: [
            buildTop(2, 0.166, '빵'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('화이트', 'images/breads/white.png', '#클래식한 빵 #부드러움'),
                buildButtons(btn_bread5, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('플랫브레드', 'images/breads/flat_bread.png', '#납작한 모양 #쫀득쫀득'),
                buildButtons(btn_bread6, updateData),
              ],),

            buildButton(context, const TestMain1(), '다음으로')
          ]
      ),
    );
  }
  void updateData(int num, Buttons btn) {
    setState(() {
      if (num == 1) {
        btn.clickBad();
      }
      else if (num == 2) {
        btn.clickGood();
      }
      else if (num == 3) {
        btn.clickNice();
      }
    });
  }
}

//type test : main_page1
class TestMain1 extends StatefulWidget {
  const TestMain1({Key? key}) : super(key: key);

  @override
  State<TestMain1> createState() => _TestMain1State();
}

class _TestMain1State extends State<TestMain1> {

  Buttons btn_main1 = Buttons('SUBWAY_MAINMENU_10017'); //에그마요
  Buttons btn_main2 = Buttons('SUBWAY_MAINMENU_10011'); //스테이크
  Buttons btn_main3 = Buttons('SUBWAY_MAINMENU_10016'); //참치
  Buttons btn_main4 = Buttons('SUBWAY_MAINMENU_10008'); //바비큐


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
        children: [
          buildTop(3, 0.25, '메인 메뉴'),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            toppingImg('에그마요', 'images/menus/eggmayo.png', ''),
            buildButtons(btn_main1, updateData),
          ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            toppingImg('스테이크', 'images/menus/steak.png', ''),
            buildButtons(btn_main2, updateData),
          ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            toppingImg('참치', 'images/menus/tuna.png', ''),
            buildButtons(btn_main3, updateData)
          ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            toppingImg('풀드 포크 바비큐', 'images/menus/bbq.png', ''),
            buildButtons(btn_main4, updateData)
          ],),
        buildButton(context, const TestMain2(), '다음으로')
        ]
      ),
    );
  }
  void updateData(int num, Buttons btn) {
    setState(() {
      if (num == 1) {
        btn.clickBad();
      }
      else if (num == 2) {
        btn.clickGood();
      }
      else if (num == 3) {
        btn.clickNice();
      }
    });
  }
}

//type test : main_page2
class TestMain2 extends StatefulWidget {
  const TestMain2({Key? key}) : super(key: key);

  @override
  State<TestMain1> createState() => _TestMain2State();
}

class _TestMain2State extends State<TestMain1> {

  Buttons btn_main5 = Buttons('SUBWAY_MAINMENU_10014'); //쉬림프
  Buttons btn_main6 = Buttons('SUBWAY_MAINMENU_10012'); //로티세리치킨
  Buttons btn_main7 = Buttons('SUBWAY_MAINMENU_10009'); //햄
  Buttons btn_main8 = Buttons('SUBWAY_MAINMENU_10019'); //베이컨


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
          children: [
            buildTop(3, 0.33, '메인 메뉴'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('쉬림프', 'images/menus/shrimp.png', ''),
                buildButtons(btn_main5, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('치킨', 'images/menus/chicken.png', ''),
                buildButtons(btn_main6, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('햄', 'images/menus/ham.png', ''),
                buildButtons(btn_main7, updateData)
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('베이컨', 'images/menus/bacon.png', ''),
                buildButtons(btn_main8, updateData)
              ],),
            buildButton(context, const TestBread2(), '다음으로')
          ]
      ),
    );
  }
  void updateData(int num, Buttons btn) {
    setState(() {
      if (num == 1) {
        btn.clickBad();
      }
      else if (num == 2) {
        btn.clickGood();
      }
      else if (num == 3) {
        btn.clickNice();
      }
    });
  }
}
