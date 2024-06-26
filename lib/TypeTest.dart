import 'package:flutter/material.dart';
import 'package:subq/main.dart';
import 'AppBar.dart';
import 'constants.dart';
import 'Button.dart';
import 'dart:async';
import 'TestResult.dart';
import 'Seokhwan.dart';

//first page of test
class TestStart extends StatelessWidget {
  const TestStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: materialColor,
      child: Center(
        child: Container(
          width: screenCheck(context),
          color: Colors.white,
          child: Column(
            children: [
              TestAppBar(context),
              buildContainer('assets/image/icon/question.png',
                  '어떤 목적을 중심으로\n추천받고 싶으신가요?\n'),
              const SizedBox(
                height: 5.0,
              ),
              // SEOKHWAN
              // purposeCode(5) 와 같이 실행하면
              // purposeCode(5) 함수가 그대로 실행됨.
              // 따라서, 이전 코드에서는 항상 purpose 가 5로 남음
              buildButton(context, const TestBread1(), '  영양 균형  ',
                  func: purposeCode, code: 0),
              buildButton(context, const TestBread1(), '  저탄수화물  ',
                  func: purposeCode, code: 1),
              buildButton(context, const TestBread1(), '  고단백질  ',
                  func: purposeCode, code: 2),
              buildButton(context, const TestBread1(), '  저칼로리  ',
                  func: purposeCode, code: 3),
              buildButton(context, const TestBread1(), '  저염  ',
                  func: purposeCode, code: 4),
              buildButton(context, const TestBread1(), '  맛 우선  ',
                  func: purposeCode, code: 5),
            ],
          ),
        ),
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
  Widget build(BuildContext context) {
    printData(data1: purpose);
    return Material(
      color: materialColor,
      child: Center(
        child: Container(
          width: screenCheck(context),
          color: Colors.white,
          child: Column(children: [
            TestAppBar(context),
            buildTop(context, 1, 0.07, '브레드', 6),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        toppingImg(
                            context, '허니오트', 'assets/image/bread/honey_oat.png',
                            toppingInfo: '#고소한_위트빵 #오트밀_가루'),
                        buildButtons(btn_bread4, updateData, context),
                      ],
                    ),
                    greyLine(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        toppingImg(context, '하티', 'assets/image/bread/hearty.png',
                            toppingInfo: '#화이트빵+옥수수_가루 #겉바속촉'),
                        buildButtons(btn_bread5, updateData, context),
                      ],
                    ),
                    greyLine(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        toppingImg(context, '위트', 'assets/image/bread/wheat.png',
                            toppingInfo: '#9가지_곡물 #건강 #고소'),
                        buildButtons(btn_bread3, updateData, context)
                      ],
                    ),
                    greyLine(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        toppingImg(context, '파마산 오레가노',
                            'assets/image/bread/parmesan.png',
                            toppingInfo: '#파마산_오레가노_시즈닝 #허브향'),
                        buildButtons(btn_bread2, updateData, context)
                      ],
                    ),
                    buildButton(context, const TestBread2(), '다음으로',
                        func: printData(
                            data1: btn_bread1.getDataCode(),
                            data2: btn_bread2.getDataCode(),
                            data3: btn_bread3.getDataCode(),
                            data4: btn_bread4.getDataCode())),
                  ],
                ),
              ),
          ]),
        ),
      ),
    );
  }

  void updateData(int num, Buttons btn) {
    setState(() {
      if (num == 1) {
        btn.clickBad();
      } else if (num == 2) {
        btn.clickGood();
      } else if (num == 3) {
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
  Widget build(BuildContext context) {
    return Material(
      color: materialColor,
      child: Center(
        child: Container(
          width: screenCheck(context),
          color: Colors.white,
          child: Column(children: [
            TestAppBar(context),
            buildTop(context, 2, 0.15, '브레드', 6),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '화이트', 'assets/image/bread/white.png',
                          toppingInfo: '#클래식한_빵 #부드러움'),
                      buildButtons(btn_bread1, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(
                          context, '플랫브레드', 'assets/image/bread/flat_bread.png',
                          toppingInfo: '#납작한_모양 #쫀득쫀득'),
                      buildButtons(btn_bread6, updateData, context),
                    ],
                  ),
                ],
              ),
            ),
            buildButton(context, const TestMain1(), '다음으로',
                func: printData(
                    data1: btn_bread5.getDataCode(),
                    data2: btn_bread6.getDataCode()))
          ]),
        ),
      ),
    );
  }

  void updateData(int num, Buttons btn) {
    setState(() {
      if (num == 1) {
        btn.clickBad();
      } else if (num == 2) {
        btn.clickGood();
      } else if (num == 3) {
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
  @override
  Widget build(BuildContext context) {
    return Material(
      color: materialColor,
      child: Center(
        child: Container(
          width: screenCheck(context),
          color: Colors.white,
          child: Column(children: [
            TestAppBar(context),
            buildTop(context, 3, 0.23, '메인 토핑', 15),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '에그마요', 'assets/image/main/eggmayo.png'),
                      buildButtons(btn_main1, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '스테이크', 'assets/image/main/steak.png'),
                      buildButtons(btn_main2, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '참치', 'assets/image/main/tuna.png'),
                      buildButtons(btn_main3, updateData, context)
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '바비큐', 'assets/image/main/bbq.png'),
                      buildButtons(btn_main4, updateData, context)
                    ],
                  ),
                ],
              ),
            ),
            buildButton(context, const TestMain2(), '다음으로',
                func: printData(
                    data1: btn_main1.getDataCode(),
                    data2: btn_main2.getDataCode(),
                    data3: btn_main3.getDataCode(),
                    data4: btn_main4.getDataCode()))
          ]),
        ),
      ),
    );
  }

  void updateData(int num, Buttons btn) {
    setState(() {
      if (num == 1) {
        btn.clickBad();
      } else if (num == 2) {
        btn.clickGood();
      } else if (num == 3) {
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
  Widget build(BuildContext context) {
    return Material(
      color: materialColor,
      child: Center(
        child: Container(
          width: screenCheck(context),
          color: Colors.white,
          child: Column(children: [
            TestAppBar(context),
            buildTop(context, 4, 0.3, '메인 토핑', 15),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '쉬림프', 'assets/image/main/shrimp.png'),
                      buildButtons(btn_main5, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '치킨 브레스트', 'assets/image/main/chicken.png'),
                      buildButtons(btn_main6, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '햄', 'assets/image/main/ham.png'),
                      buildButtons(btn_main7, updateData, context)
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '베이컨', 'assets/image/main/bacon.png'),
                      buildButtons(btn_main8, updateData, context)
                    ],
                  ),
                ],
              ),
            ),
            buildButton(context, const TestMain3(), '다음으로',
                func: printData(
                    data1: btn_main5.getDataCode(),
                    data2: btn_main6.getDataCode(),
                    data3: btn_main7.getDataCode(),
                    data4: btn_main8.getDataCode()))
          ]),
        ),
      ),
    );
  }

  void updateData(int num, Buttons btn) {
    setState(() {
      if (num == 1) {
        btn.clickBad();
      } else if (num == 2) {
        btn.clickGood();
      } else if (num == 3) {
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
  Widget build(BuildContext context) {
    return Material(
      color: materialColor,
      child: Center(
        child: Container(
          width: screenCheck(context),
          color: Colors.white,
          child: Column(children: [
            TestAppBar(context),
            buildTop(context, 5, 0.38, '메인 토핑', 15),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '아보카도', 'assets/image/main/avocado.png'),
                      buildButtons(btn_main9, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '치킨브레스트햄',
                          'assets/image/main/chicken_breast_ham.png'),
                      buildButtons(btn_main10, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '페퍼로니', 'assets/image/main/pepperoni.png'),
                      buildButtons(btn_main11, updateData, context)
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '살라미', 'assets/image/main/salami.png'),
                      buildButtons(btn_main12, updateData, context)
                    ],
                  ),
                ],
              ),
            ),
            buildButton(context, const TestMain4(), '다음으로',
                func: printData(
                    data1: btn_main9.getDataCode(),
                    data2: btn_main10.getDataCode(),
                    data3: btn_main11.getDataCode(),
                    data4: btn_main12.getDataCode()))
          ]),
        ),
      ),
    );
  }

  void updateData(int num, Buttons btn) {
    setState(() {
      if (num == 1) {
        btn.clickBad();
      } else if (num == 2) {
        btn.clickGood();
      } else if (num == 3) {
        btn.clickNice();
      }
    });
  }
}

//type test : main_page4
class TestMain4 extends StatefulWidget {
  const TestMain4({Key? key}) : super(key: key);

  @override
  State<TestMain4> createState() => _TestMain4State();
}

class _TestMain4State extends State<TestMain4> {
  Widget build(BuildContext context) {
    return Material(
      color: materialColor,
      child: Center(
        child: Container(
          width: screenCheck(context),
          color: Colors.white,
          child: Column(children: [
            TestAppBar(context),
            buildTop(context, 6, 0.46, '메인 토핑', 15),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '치킨 데리야끼', 'assets/image/main/chicken_teriyaki.png'),
                      buildButtons(btn_main13, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '로티세리 치킨',
                          'assets/image/main/rotisserie_chicken.png'),
                      buildButtons(btn_main14, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '베지',
                          'assets/image/main/veggie.png'),
                      buildButtons(btn_main15, updateData, context),
                    ],
                  ),
                ],
              ),
            ),
            buildButton(context, const TestCheese(), '다음으로')
          ]),
        ),
      ),
    );
  }

  void updateData(int num, Buttons btn) {
    setState(() {
      if (num == 1) {
        btn.clickBad();
      } else if (num == 2) {
        btn.clickGood();
      } else if (num == 3) {
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
  Widget build(BuildContext context) {
    return Material(
      color: materialColor,
      child: Center(
        child: Container(
          width: screenCheck(context),
          color: Colors.white,
          child: Column(children: [
            TestAppBar(context),
            buildTop(context, 7, 0.53, '치즈', 3),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(
                          context, '아메리칸 치즈', 'assets/image/cheese/american.png'),
                      buildButtons(btn_cheese1, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(
                          context, '슈레드 치즈', 'assets/image/cheese/shredded.png'),
                      buildButtons(btn_cheese2, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(
                          context, '모차렐라 치즈', 'assets/image/cheese/mozzarella.png'),
                      buildButtons(btn_cheese3, updateData, context)
                    ],
                  ),
                ],
              ),
            ),
            buildButton(context, const TestVege1(), '다음으로',
                func: printData(
                    data1: btn_cheese1.getDataCode(),
                    data2: btn_cheese2.getDataCode(),
                    data3: btn_cheese3.getDataCode()))
          ]),
        ),
      ),
    );
  }

  void updateData(int num, Buttons btn) {
    setState(() {
      if (num == 1) {
        btn.clickBad();
      } else if (num == 2) {
        btn.clickGood();
      } else if (num == 3) {
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
  Widget build(BuildContext context) {
    return Material(
      color: materialColor,
      child: Center(
        child: Container(
          width: screenCheck(context),
          color: Colors.white,
          child: Column(children: [
            TestAppBar(context),
            buildTop(context, 8, 0.61, '야채', 8),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(
                          context, '양상추', 'assets/image/vegetable/lettuce.png'),
                      buildButtons(btn_vege1, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '토마토', 'assets/image/vegetable/tomato.png'),
                      buildButtons(btn_vege2, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(
                          context, '오이', 'assets/image/vegetable/cucumber.png'),
                      buildButtons(btn_vege3, updateData, context)
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '피망', 'assets/image/vegetable/pepper.png'),
                      buildButtons(btn_vege4, updateData, context)
                    ],
                  ),
                ],
              ),
            ),
            buildButton(context, const TestVege2(), '다음으로',
                func: printData(
                    data1: btn_vege1.getDataCode(),
                    data2: btn_vege2.getDataCode(),
                    data3: btn_vege3.getDataCode(),
                    data4: btn_vege4.getDataCode()))
          ]),
        ),
      ),
    );
  }

  void updateData(int num, Buttons btn) {
    setState(() {
      if (num == 1) {
        btn.clickBad();
      } else if (num == 2) {
        btn.clickGood();
      } else if (num == 3) {
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
  Widget build(BuildContext context) {
    return Material(
      color: materialColor,
      child: Center(
        child: Container(
          width: screenCheck(context),
          color: Colors.white,
          child: Column(children: [
            TestAppBar(context),
            buildTop(context, 9, 0.7, '야채', 8),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '양파', 'assets/image/vegetable/onion.png'),
                      buildButtons(btn_vege5, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '피클', 'assets/image/vegetable/pickle.png'),
                      buildButtons(btn_vege6, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '올리브', 'assets/image/vegetable/olive.png'),
                      buildButtons(btn_vege7, updateData, context)
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(
                          context, '할라피뇨', 'assets/image/vegetable/jalapeno.png'),
                      buildButtons(btn_vege8, updateData, context)
                    ],
                  ),
                ],
              ),
            ),
            buildButton(context, const TestSauce1(), '다음으로',
                func: printData(
                    data1: btn_vege5.getDataCode(),
                    data2: btn_vege6.getDataCode(),
                    data3: btn_vege7.getDataCode(),
                    data4: btn_vege8.getDataCode()))
          ]),
        ),
      ),
    );
  }

  void updateData(int num, Buttons btn) {
    setState(() {
      if (num == 1) {
        btn.clickBad();
      } else if (num == 2) {
        btn.clickGood();
      } else if (num == 3) {
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
  Widget build(BuildContext context) {
    return Material(
      color: materialColor,
      child: Center(
        child: Container(
          width: screenCheck(context),
          color: Colors.white,
          child: Column(children: [
            TestAppBar(context),
            buildTop(context, 10, 0.77, '소스', 14),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '랜치', 'assets/image/sauce/ranch.png',
                          toppingInfo: '#고소한_마요네즈 #레몬즙'),
                      buildButtons(btn_sauce1, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '마요네즈', 'assets/image/sauce/mayo.png',
                          toppingInfo: '#고소'),
                      buildButtons(btn_sauce2, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(
                          context, '스위트 어니언', 'assets/image/sauce/sweet_onion.png',
                          toppingInfo: '#써브웨이_특제_소스 #달콤'),
                      buildButtons(btn_sauce3, updateData, context)
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(
                          context, '허니 머스타드', 'assets/image/sauce/honey_mustard.png',
                          toppingInfo: '#달콤 #겨자'),
                      buildButtons(btn_sauce4, updateData, context)
                    ],
                  ),
                ],
              ),
            ),
            buildButton(context, const TestSauce2(), '다음으로',
                func: printData(
                    data1: btn_sauce1.getDataCode(),
                    data2: btn_sauce2.getDataCode(),
                    data3: btn_sauce3.getDataCode(),
                    data4: btn_sauce4.getDataCode()))
          ]),
        ),
      ),
    );
  }

  void updateData(int num, Buttons btn) {
    setState(() {
      if (num == 1) {
        btn.clickBad();
      } else if (num == 2) {
        btn.clickGood();
      } else if (num == 3) {
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
  Widget build(BuildContext context) {
    return Material(
      color: materialColor,
      child: Center(
        child: Container(
          width: screenCheck(context),
          color: Colors.white,
          child: Column(children: [
            TestAppBar(context),
            buildTop(context, 11, 0.84, '소스', 14),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(
                          context, '스위트 칠리', 'assets/image/sauce/sweet_chilli.png',
                          toppingInfo: '#칠리 #매콤 #달콤'),
                      buildButtons(btn_sauce5, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '핫 칠리', 'assets/image/sauce/hot_chilli.png',
                          toppingInfo: '#진짜_매운맛'),
                      buildButtons(btn_sauce6, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, 'NEW 사우스 웨스트 치폴레',
                          'assets/image/sauce/new_southwest_chipotle.png',
                          toppingInfo: '#핫칠리+마요네즈 #이국적인_맛'),
                      buildButtons(btn_sauce7, updateData, context)
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '머스타드', 'assets/image/sauce/mustard.png',
                          toppingInfo: '#오리지날_옐로우_머스타드'),
                      buildButtons(btn_sauce8, updateData, context)
                    ],
                  ),
                ],
              ),
            ),
            buildButton(context, const TestSauce3(), '다음으로',
                func: printData(
                    data1: btn_sauce5.getDataCode(),
                    data2: btn_sauce6.getDataCode(),
                    data3: btn_sauce7.getDataCode(),
                    data4: btn_sauce8.getDataCode()))
          ]),
        ),
      ),
    );
  }

  void updateData(int num, Buttons btn) {
    setState(() {
      if (num == 1) {
        btn.clickBad();
      } else if (num == 2) {
        btn.clickGood();
      } else if (num == 3) {
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
  Widget build(BuildContext context) {
    return Material(
      color: materialColor,
      child: Center(
        child: Container(
          width: screenCheck(context),
          color: Colors.white,
          child: Column(children: [
            TestAppBar(context),
            buildTop(context, 12, 0.92, '소스', 14),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(
                          context, '홀스래디쉬', 'assets/image/sauce/horseradish.png',
                          toppingInfo: '#고소한_마요네즈 #고추냉이'),
                      buildButtons(btn_sauce9, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(
                          context, '올리브 오일', 'assets/image/sauce/olive_oil.png',
                          toppingInfo: '#담백 #깔끔'),
                      buildButtons(btn_sauce10, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '레드와인식초', 'assets/image/sauce/red_wine.png',
                          toppingInfo: '#풍미_가득'),
                      buildButtons(btn_sauce11, updateData, context)
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '소금', 'assets/image/sauce/salt.png',
                          toppingInfo: '#소금'),
                      buildButtons(btn_sauce12, updateData, context)
                    ],
                  ),
                ],
              ),
            ),
            buildButton(context, const TestSauce4(), '다음으로',
                func: printData(
                    data1: btn_sauce9.getDataCode(),
                    data2: btn_sauce10.getDataCode(),
                    data3: btn_sauce11.getDataCode(),
                    data4: btn_sauce12.getDataCode()))
          ]),
        ),
      ),
    );
  }

  void updateData(int num, Buttons btn) {
    setState(() {
      if (num == 1) {
        btn.clickBad();
      } else if (num == 2) {
        btn.clickGood();
      } else if (num == 3) {
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
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          width: screenCheck(context),
          color: Colors.white,
          child: Column(children: [
            TestAppBar(context),
            buildTop(context, 13, 1, '소스', 14),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(context, '후추', 'assets/image/sauce/black_pepper.png',
                          toppingInfo: '#후추'),
                      buildButtons(btn_sauce13, updateData, context),
                    ],
                  ),
                  greyLine(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toppingImg(
                          context, '스모크 바비큐', 'assets/image/sauce/smoke_bbq.png',
                          toppingInfo: '#스모크_향 #달콤한_바비큐'),
                      buildButtons(btn_sauce14, updateData, context),
                    ],
                  ),
                ],
              ),
            ),
            buildButton(context, const TestResultLoading(), '다음으로',
                func: printData(
                  data1: btn_sauce13.getDataCode(),
                  data2: btn_sauce14.getDataCode(),
                ))
          ]),
        ),
      ),
    );
  }

  void updateData(int num, Buttons btn) {
    setState(() {
      if (num == 1) {
        btn.clickBad();
      } else if (num == 2) {
        btn.clickGood();
      } else if (num == 3) {
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
  Future<void> fetchDataAndMove(_) async {
    await Utils.fetchResult();

    if (!mounted) return;
    Timer(const Duration(seconds: 1), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const TestResult()));
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(fetchDataAndMove);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: materialColor,
      child: Center(
        child: Container(
          width: screenCheck(context),
          color: Colors.white,
          child: Column(
            children: [
              TestAppBar(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, right: 30.0),
                    child: Text(
                      '13/13',
                      style: kSmallTextStyle,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 10.0, left: 30.0, right: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 2, color: const Color(0xfff1c323)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Color(0xfff1c323)),
                      backgroundColor: Color(0xffffffff),
                      value: 1,
                      minHeight: 10.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Text(
                '취향을 분석하기 위한 재료 평가가 끝났어요.\n\n서브큐가 열심히 분석중이에요.',
                style: kMediumBTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 60.0,
              ),
              Container(
                height: 250.0,
                width: 315.0,
                decoration: kContainerStyle,
                child: Image.asset('assets/image/icon/loading.gif'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
