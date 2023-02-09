import 'package:flutter/services.dart';
import 'package:subq/Seokhwan.dart';
import 'package:subq/SubPages.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:subq/AppBar.dart';

//TestResult 페이지로 넘어오면서, db.dataList의 값들이 사라집니다...
//Utils 클래스 내부에서 데이터를 저장했기 때문일까요?

//test result page
class TestResult extends StatefulWidget {
  const TestResult({Key? key}) : super(key: key);

  @override
  State<TestResult> createState() => _TestResultState();
}

class _TestResultState extends State<TestResult> {

  int displayNum = 0;

  @override
  Widget build(BuildContext context) {
    Utils.fetchResult();
    return Material(
      color: materialColor,
      child: Scaffold(
        body: Center(
          child: Container(
            width: screenCheck(context),
            color: Colors.white,
            child: Column(
              children: [
                MainAppBar(
                  context,
                  iconBtn: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 30,
                      )),
                ),
                const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: (Text(
                      '추천 꿀조합은?',
                      style: kLargeTextStyle,
                    ))),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 20.0, left: 20.0, right: 20.0),
                  margin: const EdgeInsets.only(
                      left: 35.0, right: 35.0, bottom: 10),
                  decoration: kContainerStyle,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(alignment: Alignment.bottomCenter, children: [
                        Container(
                            color: Colors.yellowAccent, width: 100, height: 10),
                        Text(
                          '${db.dataList[displayNum].menu}',
                          style: kLargeTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ]),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Image.asset(
                        '${db.dataList[displayNum].filename}',
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
                            const TextSpan(
                                text: '빵 : ', style: kMediumTextStyle),
                            TextSpan(
                                text: '${db.dataList[displayNum].bread}',
                                style: kMediumBTextStyle)
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(
                                text: '메인 재료 : ', style: kMediumTextStyle),
                            TextSpan(
                                text: '${db.dataList[displayNum].main}',
                                style: kMediumBTextStyle)
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(
                                text: '치즈 : ', style: kMediumTextStyle),
                            TextSpan(
                                text: '${db.dataList[displayNum].cheese}',
                                style: kMediumBTextStyle)
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(
                                text: '소스 : ', style: kMediumTextStyle),
                            TextSpan(
                                text: '${db.dataList[displayNum].sauce}',
                                style: kMediumBTextStyle)
                          ])),
                          const SizedBox(height: 25),
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                width: 150,
                                height: 10,
                                color: Colors.yellowAccent,
                              ),
                              const Text(
                                '영양성분 보러가기',
                                style: kMediumBTextStyle,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MenuInfo()));
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  width: 200,
                                  height: 20,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    // refreshData();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    decoration: kButtonStyle,
                    child: Column(
                      children: [
                        const Text(
                          '다른 꿀조합 보기',
                          style: kMediumBTextStyle,
                        ),
                        Text(
                          '${displayNum + 1}/5',
                          style: kSmallTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 5, left: 15, right: 15),
                    margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    // width: 250.0,
                    decoration: BoxDecoration(
                        color: const Color(0xffDCE9FD),
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        const Text(
                          '친구에게 공유하기',
                          style: kMediumBTextStyle,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: GestureDetector(
                              onTap: () {
                                Clipboard.setData(const ClipboardData(
                                    text: 'https://subq.misiq.kr'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        content: Text(
                                          "✅ 복사되었습니다",
                                          style: kMediumTextStyle.copyWith(
                                              color: const Color(0xffffffff)),
                                        ),
                                        shape: const StadiumBorder(),
                                        duration: const Duration(seconds: 2)));
                              },
                              child: Image.asset(
                                'image/icon/share.png',
                                width: 50,
                                height: 50,
                              ),
                            ))
                      ],
                    )),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    '업그레이드 된 서브큐를 사용하고 싶으신가요?',
                    style: kMediumTextStyle,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReservationPage()));
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
          ),
        ),
      ),
    );
  }

  void refreshData() {
    setState(() {
      if (displayNum < 4) {
        displayNum++;
        // displayDt = db.dataList[displayNum];
      } else {
        displayNum = 0;
        // displayDt = db.dataList[displayNum];
      }
    });
  }

// 메뉴 이름 길이에 따라 컨테이너 길이를 다르게 하기 위한 함수, 구현 실패 dd
// void getWidth() {
//   setState(() {
//     print('getWidth() get called');
//     if (_containerKey.currentContext != null) {
//       final RenderBox renderBox =
//           _containerKey.currentContext!.findRenderObject() as RenderBox;
//       w = renderBox.size.width;
//       print('return w = $w');
//     } else {
//       print('w is null');
//     }
//   });
// }
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
    return Material(
      color: materialColor,
      child: Center(
        child: Container(
          width: screenCheck(context),
          color: Colors.white,
          child: (Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MainAppBar(
                context,
                iconBtn: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 30,
                    )),
              ),
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
                    Container(
                      height: 180,
                      width: 1.2,
                      color: Colors.black,
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
                          '탄수화물\n',
                          style: kMediumTextStyle,
                        ),
                        Text(
                          '단백질\n',
                          style: kMediumTextStyle,
                        ),
                        Text('지방', style: kMediumTextStyle)
                      ],
                    ),
                    Container(
                      height: 100,
                      width: 1.2,
                      color: Colors.black,
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          '50%\n',
                          style: kMediumTextStyle,
                        ),
                        Text(
                          '30%\n',
                          style: kMediumTextStyle,
                        ),
                        Text(
                          '20%',
                          style: kMediumTextStyle,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
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
      ),
    );
  }
}
