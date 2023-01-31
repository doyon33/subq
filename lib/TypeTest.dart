import 'package:flutter/material.dart';
import 'AppBar.dart';
import 'constants.dart';
import 'Button.dart';
import 'dart:async';
import 'TestResult.dart';

//first page of test
class TestStart extends StatelessWidget {
  const TestStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Column(
        children: [
          buildContainer('', 'image/icon/question.png', '어떤 목적을 중심으로\n추천받고 싶으신가요?\n'),
          const SizedBox(height: 5.0,),
          buildButton(context, const TestBread1(), '  영양 균형  '),
          buildButton(context, const TestBread1(), '  저탄수화물  '),
          buildButton(context, const TestBread1(), '  고단백질  '),
          buildButton(context, const TestBread1(), '  저칼로리  '),
          buildButton(context, const TestBread1(), '  저염  '),
          buildButton(context, const TestBread1(), '  맛 우선  ')
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
          buildTop(1, 0.076, '빵'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              toppingImg('허니오트', 'image/bread/honey_oat.png', '#고소한 위트빵 #오트밀 가루'),
              buildButtons(btn_bread1, updateData),
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              toppingImg('하티', 'image/bread/hearty.png', '#화이트빵 + 옥수수 가루 #겉바속촉'),
              buildButtons(btn_bread2, updateData),
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              toppingImg('위트', 'image/bread/wheat.png', '#9가지 곡물 #건강 #고소'),
              buildButtons(btn_bread3, updateData)
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              toppingImg('파마산 오레가노', 'image/bread/parmesan.png', '#파마산 오레가노 시즈닝 #허브향'),
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
            buildTop(2, 0.153, '빵'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('화이트', 'image/bread/white.png', '#클래식한 빵 #부드러움'),
                buildButtons(btn_bread5, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('플랫브레드', 'image/bread/flat_bread.png', '#납작한 모양 #쫀득쫀득'),
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
          buildTop(3, 0.23, '메인 메뉴'),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            toppingImg('에그마요', 'image/menu/eggmayo.png', ''),
            buildButtons(btn_main1, updateData),
          ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            toppingImg('스테이크', 'image/menu/steak.png', ''),
            buildButtons(btn_main2, updateData),
          ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            toppingImg('참치', 'image/menu/tuna.png', ''),
            buildButtons(btn_main3, updateData)
          ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            toppingImg('풀드 포크 바비큐', 'image/menu/bbq.png', ''),
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
  State<TestMain2> createState() => _TestMain2State();
}

class _TestMain2State extends State<TestMain2> {

  Buttons btn_main5 = Buttons('SUBWAY_MAINMENU_10014'); //쉬림프
  Buttons btn_main6 = Buttons('SUBWAY_MAINMENU_10012'); //로티세리치킨
  Buttons btn_main7 = Buttons('SUBWAY_MAINMENU_10009'); //햄
  Buttons btn_main8 = Buttons('SUBWAY_MAINMENU_10019'); //베이컨


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
          children: [
            buildTop(4, 0.307, '메인 메뉴'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('쉬림프', 'image/menu/shrimp.png', ''),
                buildButtons(btn_main5, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('치킨', 'image/menu/chicken.png', ''),
                buildButtons(btn_main6, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('햄', 'image/menu/ham.png', ''),
                buildButtons(btn_main7, updateData)
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('베이컨', 'image/menu/bacon.png', ''),
                buildButtons(btn_main8, updateData)
              ],),
            buildButton(context, const TestMain3(), '다음으로')
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

//type test : main_page3
class TestMain3 extends StatefulWidget {
  const TestMain3({Key? key}) : super(key: key);

  @override
  State<TestMain3> createState() => _TestMain3State();
}

class _TestMain3State extends State<TestMain3> {

  Buttons btn_main9 = Buttons('SUBWAY_MAINMENU_10018'); //베지
  Buttons btn_main10 = Buttons('SUBWAY_MAINMENU_10010'); //치킨브레스트햄
  Buttons btn_main11 = Buttons('SUBWAY_TOPPING_OTHER_10001'); //페퍼로니
  Buttons btn_main12 = Buttons('SUBWAY_TOPPING_OTHER_10002'); //살라미


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
          children: [
            buildTop(5, 0.384, '메인 메뉴'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('베지', 'image/menu/veggie.png', ''),
                buildButtons(btn_main9, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('치킨브레스트햄', 'image/main/chicken_breast_ham.png', ''),
                buildButtons(btn_main10, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('페퍼로니', 'image/main/pepperoni.png', ''),
                buildButtons(btn_main11, updateData)
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('살라미', 'image/main/salami.png', ''),
                buildButtons(btn_main12, updateData)
              ],),
            buildButton(context, const TestCheese(), '다음으로')
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

//type test : cheese_page1
class TestCheese extends StatefulWidget {
  const TestCheese({Key? key}) : super(key: key);

  @override
  State<TestCheese> createState() => _TestCheeseState();
}

class _TestCheeseState extends State<TestCheese> {

  Buttons btn_cheese1 = Buttons('SUBWAY_TOPPING_CHEESE_10001'); //아메리칸
  Buttons btn_cheese2 = Buttons('SUBWAY_TOPPING_CHEESE_10002'); //슈레드
  Buttons btn_cheese3 = Buttons('SUBWAY_TOPPING_CHEESE_10003'); //모차렐라

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
          children: [
            buildTop(6, 0.46, '치즈'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('아메리칸 치즈', 'image/cheese/american.png', ''),
                buildButtons(btn_cheese1, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('슈레드 치즈', 'image/cheese/shredded.png', ''),
                buildButtons(btn_cheese2, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('모차렐라 치즈', 'image/cheese/mozzarella.png', ''),
                buildButtons(btn_cheese3, updateData)
              ],),
            buildButton(context, const TestVege1(), '다음으로')
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

//type test : vegetable_page1
class TestVege1 extends StatefulWidget {
  const TestVege1({Key? key}) : super(key: key);

  @override
  State<TestVege1> createState() => _TestVege1State();
}

class _TestVege1State extends State<TestVege1> {

  Buttons btn_vege1 = Buttons('SUBWAY_TOPPING_BASIC_10001'); //양상추
  Buttons btn_vege2 = Buttons('SUBWAY_TOPPING_BASIC_10002'); //토마토
  Buttons btn_vege3 = Buttons('SUBWAY_TOPPING_BASIC_10003'); //오이
  Buttons btn_vege4 = Buttons('SUBWAY_TOPPING_BASIC_10004'); //피망

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
          children: [
            buildTop(7, 0.53, '야채'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('양상추', 'image/vegetable/lettuce.png', ''),
                buildButtons(btn_vege1, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('토마토', 'image/vegetable/tomato.png', ''),
                buildButtons(btn_vege2, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('오이', 'image/vegetable/cucumber.png', ''),
                buildButtons(btn_vege3, updateData)
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('피망', 'image/vegetable/pepper.png', ''),
                buildButtons(btn_vege4, updateData)
              ],),
            buildButton(context, const TestVege2(), '다음으로')
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

//type test : vegetable_page2
class TestVege2 extends StatefulWidget {
  const TestVege2({Key? key}) : super(key: key);

  @override
  State<TestVege2> createState() => _TestVege2State();
}

class _TestVege2State extends State<TestVege2> {

  Buttons btn_vege5 = Buttons('SUBWAY_TOPPING_BASIC_10005'); //양파
  Buttons btn_vege6 = Buttons('SUBWAY_TOPPING_BASIC_10006'); //피클
  Buttons btn_vege7 = Buttons('SUBWAY_TOPPING_BASIC_10007'); //올리브
  Buttons btn_vege8 = Buttons('SUBWAY_TOPPING_BASIC_10008'); //할라피뇨

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
          children: [
            buildTop(8, 0.615, '야채'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('양파', 'image/vegetable/onion.png', ''),
                buildButtons(btn_vege5, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('피클', 'image/vegetable/pickle.png', ''),
                buildButtons(btn_vege6, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('올리브', 'image/vegetable/olive.png', ''),
                buildButtons(btn_vege7, updateData)
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('할라피뇨', 'image/vegetable/jalapeno.png', ''),
                buildButtons(btn_vege8, updateData)
              ],),
            buildButton(context, const TestVege3(), '다음으로')
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

//type test : vegetable_page3
class TestVege3 extends StatefulWidget {
  const TestVege3({Key? key}) : super(key: key);

  @override
  State<TestVege3> createState() => _TestVege3State();
}

class _TestVege3State extends State<TestVege3> {

  Buttons btn_vege9 = Buttons('SUBWAY_TOPPING_ADD_10002'); //아보카도

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
          children: [
            buildTop(9, 0.692, '야채'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('아보카도', 'image/vegetable/avocado.png', ''),
                buildButtons(btn_vege9, updateData),
              ],),
            buildButton(context, const TestSauce1(), '다음으로')
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

//type test : sauce_page1
class TestSauce1 extends StatefulWidget {
  const TestSauce1({Key? key}) : super(key: key);

  @override
  State<TestSauce1> createState() => _TestSauce1State();
}

class _TestSauce1State extends State<TestSauce1> {

  Buttons btn_sauce1 = Buttons('SUBWAY_SAUCE_10014'); //랜치
  Buttons btn_sauce2 = Buttons('SUBWAY_SAUCE_10015'); //마요네즈
  Buttons btn_sauce3 = Buttons('SUBWAY_SAUCE_10010'); //스위트 어니언
  Buttons btn_sauce4 = Buttons('SUBWAY_SAUCE_10011'); //허니 머스타드

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
          children: [
            buildTop(10, 0.769, '소스'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('랜치', 'image/sauce/ranch.png', '#고소한 마요네즈 #레몬즙'),
                buildButtons(btn_sauce1, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('마요네즈', 'image/sauce/mayo.png', '#고소'),
                buildButtons(btn_sauce2, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('스위트 어니언', 'image/sauce/sweet_onion.png', '#써브웨이 특제 소스 #달콤'),
                buildButtons(btn_sauce3, updateData)
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('허니 머스타드', 'image/sauce/honey_mustard.png', '#달콤 #겨자'),
                buildButtons(btn_sauce4, updateData)
              ],),
            buildButton(context, const TestSauce2(), '다음으로')
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

//type test : sauce_page2
class TestSauce2 extends StatefulWidget {
  const TestSauce2({Key? key}) : super(key: key);

  @override
  State<TestSauce2> createState() => _TestSauce2State();
}

class _TestSauce2State extends State<TestSauce2> {

  Buttons btn_sauce5 = Buttons('SUBWAY_SAUCE_10012'); //스위트 칠리
  Buttons btn_suace6 = Buttons('SUBWAY_SAUCE_10016'); //핫 칠리
  Buttons btn_sauce7 = Buttons('SUBWAY_SAUCE_10017'); //사우스 웨스트 치폴레
  Buttons btn_sauce8 = Buttons('SUBWAY_SAUCE_10008'); //머스타드

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
          children: [
            buildTop(11, 0.846, '소스'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('스위트 칠리', 'image/sauce/sweet_chilli.png', '#칠리 #매콤 #달콤'),
                buildButtons(btn_sauce5, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('핫 칠리', 'image/sauce/hot_chilli.png', '#진짜_매운맛'),
                buildButtons(btn_suace6, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('NEW 사우스 웨스트 치폴레', 'image/sauce/new_southwest_chipotle.png', '#핫칠리+마요네즈 #이국적인_맛'),
                buildButtons(btn_sauce7, updateData)
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('머스타드', 'image/sauce/mustard.png', '#오리지날_옐로우_머스타드'),
                buildButtons(btn_sauce8, updateData)
              ],),
            buildButton(context, const TestSauce3(), '다음으로')
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

//type test : sauce_page3
class TestSauce3 extends StatefulWidget {
  const TestSauce3({Key? key}) : super(key: key);

  @override
  State<TestSauce3> createState() => _TestSauce3State();
}

class _TestSauce3State extends State<TestSauce3> {

  Buttons btn_sauce9 = Buttons('SUBWAY_SAUCE_10018'); //홀스래디쉬
  Buttons btn_sauce10 = Buttons('SUBWAY_SAUCE_10019'); //올리브 오일
  Buttons btn_sauce11 = Buttons('SUBWAY_SAUCE_10009'); //레드와인식초
  Buttons btn_sauce12 = Buttons('SUBWAY_SAUCE_10020'); //소금

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
          children: [
            buildTop(12, 0.923, '소스'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('홀스래디쉬', 'image/sauce/horseradish.png', '#고소한_마요네즈 #고추냉이'),
                buildButtons(btn_sauce9, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('올리브 오일', 'image/sauce/olive_oil.png', '#담백 #깔끔'),
                buildButtons(btn_sauce10, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('레드와인식초', 'image/sauce/red_wine.png', '#풍미 가득'),
                buildButtons(btn_sauce11, updateData)
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('소금', 'image/sauce/salt.png', '소금'),
                buildButtons(btn_sauce11, updateData)
              ],),
            buildButton(context, const TestSauce4(), '다음으로')
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

//type test : sauce_page4
class TestSauce4 extends StatefulWidget {
  const TestSauce4({Key? key}) : super(key: key);

  @override
  State<TestSauce4> createState() => _TestSauce4State();
}

class _TestSauce4State extends State<TestSauce4> {

  Buttons btn_sauce13 = Buttons('SUBWAY_SAUCE_10021'); //후추
  Buttons btn_sauce14 = Buttons('SUBWAY_SAUCE_10013'); //스모크 바비큐
  //Italian dressing is not listed on topping code data
  Buttons btn_sauce15 = Buttons('SUBWAY_SAUCE_10022'); //이탈리안 드레싱

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
          children: [
            buildTop(13, 1, '소스'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('후추', 'image/sauce/black_pepper.png', '#후추'),
                buildButtons(btn_sauce13, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('스모크 바비큐', 'image/sauce/smoke_bbq.png', '#스모크_향 #달콤한_바비큐'),
                buildButtons(btn_sauce14, updateData),
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                toppingImg('이탈리안 드레싱', 'image/sauce/italian_dressing.png', '#상큼함 #샐러드와_찰떡궁합'),
                buildButtons(btn_sauce15, updateData)
              ],),
            buildButton(context, const TestResultLoading(), '다음으로')
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


//test result loading page : view result page after 2 seconds
class TestResultLoading extends StatefulWidget {
  const TestResultLoading({Key? key}) : super(key: key);

  @override
  State<TestResultLoading> createState() => _TestResultLoadingState();
}

class _TestResultLoadingState extends State<TestResultLoading> {
  @override
  void initState() {
      super.initState();
      Timer(const Duration(seconds: 2), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TestResult()));
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const MainAppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const[
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(top: 10.0, right: 10.0),
                child: Text(
                  '13/13',
                  style: kSmallTextStyle,
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0xfff1c323)),
                backgroundColor: Color(0xffd6d6d6),
                value: 1,
                minHeight: 10.0,
              ),
            ),
          ),
          const SizedBox(height: 40.0,),
          const Text('취향을 분석하기 위한 재료 평가가 끝났어요.\n\n서브큐가 열심히 분석중이에요.',
            style: kMediumTextStyle, textAlign: TextAlign.center,),
          const SizedBox(height: 60.0,),
          Container(
            height: 250.0, width: 315.0,
            decoration: kContainerStyle,
            child: Image.asset('image/icon/loading.gif'),
          )
        ],
      ),
    );
  }
}
