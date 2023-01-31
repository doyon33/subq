import 'package:subq/SubPages.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:subq/AppBar.dart';

class TestResults {
  String? menu;
  String? bread;
  String? main;
  String? cheese;
  String? sauce;

  String? filename;

  TestResults(
      String this.menu,
      String this.bread,
      String this.main,
      String this.cheese,
      String this.sauce,
      String this.filename
      );
}

class DataBase {
  TestResults? result1;
  TestResults? result2;
  TestResults? result3;
  TestResults? result4;
  TestResults? result5;

  DataBase(
      TestResults this.result1,
      TestResults this.result2,
      TestResults this.result3,
      TestResults this.result4,
      TestResults this.result5
      );
}

//테스트용 데이터베이스
var result1 = TestResults(
    '에그마요', '화이트', '에그마요', '아메리칸 치즈', '랜치 + 스위트 칠리',
    'image/menu/eggmayo.png');
var result2 = TestResults(
    '쉬림프', '플랫브레드', '쉬림프', '슈레드 치즈', '랜치 + 핫 칠리 + 후추',
    'image/menu/shrimp.png');
var result3 = TestResults(
    '바베큐', '파마산 오레가노', '바베큐', '아메리칸 치즈', '스모크 바베큐 + 핫 칠리',
    'image/menu/bbq.png');
var result4 = TestResults(
    '스테이크', '하티', '스테이크', '모짜렐라 치즈', '소금 + 홀스래디쉬',
    'image/menu/steak.png');
var result5 = TestResults(
    '참치', '허니오트', '참치', '아메리칸 치즈', '마요네즈 + 스위트 칠리',
    'image/menu/tuna.png');
var db = DataBase( result1, result2, result3, result4, result5 );

//test result page
class TestResult extends StatefulWidget {
  const TestResult({Key? key}) : super(key: key);

  @override
  State<TestResult> createState() => _TestResultState();
}

class _TestResultState extends State<TestResult> {

  int displayNum = 0;
  var displayDt = db.result1;
  var resultList = [
    db.result1,
    db.result2,
    db.result3,
    db.result4,
    db.result5
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Column(
        children: [
          const Padding(
              padding: EdgeInsets.all(15.0),
              child: (Text(
                '추천 꿀조합은?',
                style: kLargeTextStyle,
              ))),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
            margin: const EdgeInsets.only(left: 35.0, right: 35.0, bottom: 10),
            decoration: kContainerStyle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${displayDt?.menu}',
                  style: kMediumBTextStyle,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Image.asset(
                  '${displayDt?.filename}',
                  width: 150.0,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      const TextSpan(text: '빵 : ', style: kMediumTextStyle),
                      TextSpan(
                          text: '${displayDt?.bread}',
                          style: kMediumBTextStyle)
                    ])),
                    RichText(
                        text: TextSpan(children: [
                      const TextSpan(text: '메인 재료 : ', style: kMediumTextStyle),
                      TextSpan(
                          text: '${displayDt?.main}', style: kMediumBTextStyle)
                    ])),
                    RichText(
                        text: TextSpan(children: [
                      const TextSpan(text: '치즈 : ', style: kMediumTextStyle),
                      TextSpan(
                          text: '${displayDt?.cheese}',
                          style: kMediumBTextStyle)
                    ])),
                    RichText(
                        text: TextSpan(children: [
                      const TextSpan(text: '소스 : ', style: kMediumTextStyle),
                      TextSpan(
                          text: '${displayDt?.sauce}',
                          style: kMediumBTextStyle)
                    ])),
                  ],
                )
              ],
            ),
          ),
          buildButton(context, MenuInfo(), '영양성분 보러가기'),
          InkWell(
            onTap: () {
              refreshData();
            },
            child: Container(
              padding: const EdgeInsets.all(15.0),
              margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              decoration: kButtonStyleB,
              child: Column(
                children: [
                  const Text(
                    '다른 꿀조합 보기',
                    style: kMediumBTextStyle,
                  ),
                  Text('${displayNum+1}/5', style: kSmallTextStyle,)
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15.0),
            margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            width: 380.0,
            decoration: BoxDecoration(
              color: const Color(0xffDCE9FD),
              borderRadius: BorderRadius.circular(30)
            ),
            child: Column(
              children: [
                const Text('친구에게 공유하기', style: kMediumTextStyle,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //각 버튼에 해당하는 기능 => 미구현
                      buildImgButton('image/icon/share.png'),
                      buildImgButton('image/icon/kakao.png'),
                      buildImgButton('image/icon/facebook.png'),
                      buildImgButton('image/icon/twitter.png')
                    ],
                  ),
                )
              ],
            )
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              '업그레이드 된 서브큐를 사용하고 싶으신가요?',
            style: kMediumTextStyle,
          ),),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReservationPage())
              );
            },
            child: Container(
              child: Text(
                '정식 런칭 사전 예약하기',
                style: kMediumTextStyle.copyWith(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline),
              ),
            ),
          )
        ],
      ),
    );
  }

  void refreshData() {
    setState(() {
      if (displayNum < 4) {
        displayNum++;
        displayDt = resultList[displayNum];
      }
      else {
        displayNum = 0;
        displayDt = resultList[displayNum];
      }
    });
  }
}


//menu info
class MenuInfo extends StatefulWidget {
  const MenuInfo({Key? key}) : super(key: key);

  @override
  State<MenuInfo> createState() => _MenuInfoState();
}

class _MenuInfoState extends State<MenuInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Center(
        child: (Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
              child: Text(
                'menu 영양성분',
                style: kLargeTextStyle,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 20.0, bottom: 20.0),
              width: 350.0,
              decoration: kContainerStyle,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Text('열량(kcal)\n', style: kMediumTextStyle),
                      Text('탄수화물(g)\n', style: kMediumTextStyle),
                      Text('포화지방(g)\n', style: kMediumTextStyle),
                      Text('식이섬유(g)\n', style: kMediumTextStyle),
                      Text('단백질(g)', style: kMediumTextStyle)
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        '416kcal\n',
                        style: kMediumTextStyle,
                      ),
                      Text(
                        '92g\n',
                        style: kMediumTextStyle,
                      ),
                      Text(
                        '4.8g\n',
                        style: kMediumTextStyle,
                      ),
                      Text(
                        '1.2g\n',
                        style: kMediumTextStyle,
                      ),
                      Text(
                        '16.4g',
                        style: kMediumTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text('탄단지 비율', style: kLargeTextStyle),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 20.0, bottom: 20.0),
              width: 300.0,
              decoration: kContainerStyle,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Text(
                        '탄수화물\n', style: kMediumTextStyle,
                      ),
                      Text(
                        '단백질\n', style: kMediumTextStyle,
                      ),
                      Text('지방', style: kMediumTextStyle)
                    ],
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        '50%\n', style: kMediumTextStyle,
                      ),
                      Text(
                        '30%\n', style: kMediumTextStyle,
                      ),
                      Text(
                        '20%', style: kMediumTextStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20.0,),
            Container(
              width: 400.0,
              // alignment: Alignment.center,
              child: (const Text(
                '영양성분 및 관련 정보는 서브웨이 홈페이지 등 공개된 정보를 기반으로 추정한 정보로 실제 구매하시는 메뉴의 영양정보와 상이할 수 있습니다. 본 정보는 주문시 메뉴선택에 도움을 드리고 자 제공되는 정보로 참고 목적으로만 활용 부탁드립니다.',
                style: kButtonTextStyle,
              )),
            )
          ],
        )),
      ),
    );
  }
}
