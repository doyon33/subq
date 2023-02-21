import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:subq/AppBar.dart';
import 'package:subq/main.dart';
import 'constants.dart';

//의견 보내기 페이지
class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

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
              MainAppBar(
                context,
                iconBtn: backIcon(context)
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          '[서브큐 이용안내]',
                          style: kLargeTextStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          '\'서브큐\' 서비스(ver 1.0)는 서브웨이 메뉴선택시 도움을 드리고자 (주)팜킷에서 자체 개발한 임시 팝업 서비스 입니다.'
                          '본 서비스는 서브웨이 본사와 연관이 없으며, 제공하는 정보는 공개된 정보를 활용하여 참고용 목적으로 제공하고 있어 실제 정보와 상이 할 수 있습니다.'
                          '본 서비스를 이용하면서 입력하는 사전서비스신청을 제외한 모든 정보는 해당 서비스 종료시 모두 파기됩니다.',
                          style: kSmallTextStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          '[버전 정보]',
                          style: kLargeTextStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          'ver1.0',
                          style: kSmallTextStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          '[이용 약관]',
                          style: kLargeTextStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          terms,
                          style: kSmallTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}


// ignore: must_be_immutable
class ReservationPage extends StatefulWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final _emailEditCtr = TextEditingController();
  final _phoneEditCtr = TextEditingController();
  final _opinionEditCtr = TextEditingController();

  @override
  void dispose() {
    _emailEditCtr.dispose();
    _phoneEditCtr.dispose();
    _opinionEditCtr.dispose();
    super.dispose();
  }

  // 나이 변수
  bool age1 = false;  //10대
  bool age2 = false;  //20대
  bool age3 = false;  //30대
  bool age4 = false;  //40대 이상

  // 성별 변수
  bool gender1 = false;  //남성
  bool gender2 = false;  //여성

  //직업 변수
  bool job1 = false;  //대학생
  bool job2 = false;  //직장인
  bool job3 = false;  //기타

  @override
  Widget build(BuildContext context) {
    return Material(
      color: materialColor,
      child: Center(
          child: Container(
        color: Colors.white,
        width: screenCheck(context),
        child: (ListView(children: [
          MainAppBar(
            context,
            iconBtn: backIcon(context)
          ),
          const SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              '정식런칭 예약 신청',
              style: kLargeTextStyle.copyWith(fontSize: 25),
            ),
            const SizedBox(
              width: 10,
            )
          ]),
          Container(
            decoration: kContainerStyle,
            padding: const EdgeInsets.all(20),
            margin:
                const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            child: Text(
              '\n정식 런칭 예약을 신청하시면\n런칭 소식을 받으실 수 있습니다.\n아래 신청서를 작성해주시면 감사하겠습니다.\n',
              style: kMediumTextStyle.copyWith(height: 1.5),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                        '이메일(선택)',
                        style: kMediumBTextStyle,
                      ),
                    ),
                    TextField(
                      controller: _emailEditCtr,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '이메일 주소',
                      ),
                      onChanged: (text) {
                        email = text;
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: Text(
                        '핸드폰 번호(선택)',
                        style: kMediumBTextStyle,
                      ),
                    ),
                    TextField(
                      controller: _phoneEditCtr,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '핸드폰 번호',
                      ),
                      onChanged: (text) {
                        phone = text;
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 30, bottom: 10),
                      child: Text(
                        '연령대 (선택)',
                        style: kMediumBTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Row(children: [
                            Container(
                              margin: const EdgeInsets.all(5),
                              decoration: kCheckBoxStyle,
                              width: 24,
                              height: 24,
                              child: Theme(
                                data: ThemeData(
                                    unselectedWidgetColor: Colors.white),
                                child: Checkbox(
                                  activeColor: Colors.transparent,
                                  checkColor: Colors.black,
                                  value: age1,
                                  onChanged: (value) {
                                    setState(() {
                                      age1 = value!;
                                      age2 = false;
                                      age3 = false;
                                      age4 = false;
                                      age = 1;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const Text(
                              '10대',
                              style: kMediumTextStyle,
                            ),
                            const SizedBox(
                              width: 10,
                            )
                          ]),
                          Row(children: [
                            Container(
                                margin: const EdgeInsets.all(5),
                                decoration: kCheckBoxStyle,
                                width: 24,
                                height: 24,
                                child: Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: Colors.white),
                                  child: (Checkbox(
                                    activeColor: Colors.transparent,
                                    checkColor: Colors.black,
                                    value: age2,
                                    onChanged: (value) {
                                      setState(() {
                                        age2 = value!;
                                        age1 = false;
                                        age3 = false;
                                        age4 = false;
                                        age = 2;
                                      });
                                    },
                                  )),
                                )),
                            const Text(
                              '20대',
                              style: kMediumTextStyle,
                            ),
                            const SizedBox(width: 10)
                          ]),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                decoration: kCheckBoxStyle,
                                width: 24,
                                height: 24,
                                child: Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: Colors.white),
                                  child: Checkbox(
                                    checkColor: Colors.black,
                                    activeColor: Colors.transparent,
                                    value: age3,
                                    onChanged: (value) {
                                      setState(() {
                                        age3 = value!;
                                        age1 = false;
                                        age2 = false;
                                        age4 = false;
                                        age = 3;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const Text(
                                '30대',
                                style: kMediumTextStyle,
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                decoration: kCheckBoxStyle,
                                width: 24,
                                height: 24,
                                child: Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: Colors.white),
                                  child: Checkbox(
                                    checkColor: Colors.black,
                                    activeColor: Colors.transparent,
                                    value: age4,
                                    onChanged: (value) {
                                      setState(() {
                                        age4 = value!;
                                        age1 = false;
                                        age2 = false;
                                        age3 = false;
                                        age = 4;
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Text(
                            '40대 이상',
                            style: kMediumTextStyle,
                          ),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 30, bottom: 10),
                      child: Text(
                        '성별 (선택)',
                        style: kMediumBTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                decoration: kCheckBoxStyle,
                                width: 24,
                                height: 24,
                                child: Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Colors.white,
                                  ),
                                  child: Checkbox(
                                    activeColor: Colors.transparent,
                                    checkColor: Colors.black,
                                    value: gender1,
                                    onChanged: (value) {
                                      setState(() {
                                        gender1 = value!;
                                        gender2 = false;
                                        gender = 1;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const Text(
                                '남자',
                                style: kMediumTextStyle,
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                decoration: kCheckBoxStyle,
                                width: 24,
                                height: 24,
                                child: Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Colors.white,
                                  ),
                                  child: Checkbox(
                                    activeColor: Colors.transparent,
                                    checkColor: Colors.black,
                                    value: gender2,
                                    onChanged: (value) {
                                      setState(() {
                                        gender2 = value!;
                                        gender1 = false;
                                        gender = 2;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const Text(
                                '여자',
                                style: kMediumTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 30, bottom: 10),
                      child: Text(
                        '직업 (선택)',
                        style: kMediumBTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                decoration: kCheckBoxStyle,
                                width: 24,
                                height: 24,
                                child: Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Colors.white,
                                  ),
                                  child: Checkbox(
                                    activeColor: Colors.transparent,
                                    checkColor: Colors.black,
                                    value: job1,
                                    onChanged: (value) {
                                      setState(() {
                                        job1 = value!;
                                        job2 = false;
                                        job3 = false;
                                        job = 1;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const Text(
                                '대학생',
                                style: kMediumTextStyle,
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                decoration: kCheckBoxStyle,
                                width: 24,
                                height: 24,
                                child: Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Colors.white,
                                  ),
                                  child: Checkbox(
                                    activeColor: Colors.transparent,
                                    checkColor: Colors.black,
                                    value: job2,
                                    onChanged: (value) {
                                      setState(() {
                                        job2 = value!;
                                        job1 = false;
                                        job3 = false;
                                        job = 2;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const Text(
                                '직장인',
                                style: kMediumTextStyle,
                              ),
                              const SizedBox(width: 10)
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                decoration: kCheckBoxStyle,
                                width: 24,
                                height: 24,
                                child: Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Colors.white,
                                  ),
                                  child: Checkbox(
                                    activeColor: Colors.transparent,
                                    checkColor: Colors.black,
                                    value: job3,
                                    onChanged: (value) {
                                      setState(() {
                                        job3 = value!;
                                        job1 = false;
                                        job2 = false;
                                        job = 3;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const Text(
                                '기타',
                                style: kMediumTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 30, bottom: 10),
                      child: Text(
                        '기타 의견 (선택)',
                        style: kLargeTextStyle,
                      ),
                    ),
                    TextField(
                      controller: _opinionEditCtr,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '서브큐에 대한 자유로운 의견을 남겨주세요.',
                      ),
                      maxLines: 5,
                      minLines: 1,
                      onChanged: (text) {
                        opinion = text;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      '정식런칭 예약 신청서 제출시 아래 개인정보 수집 및 이용에 동의 하는 것으로 간주됩니다.\n1. 개인정보의 수집 및 이용 목적 서브큐 서비스 개선 반영 및 출시정보 제공\n2. 수집하는 개인 정보의 항목 이메일(선택), 연락처(선택), 연령대(선택), 성별(선택), 직업(선택), 서비스관련 요청사항(선택)',
                      style: kSmallTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            email = _emailEditCtr.text;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CompletePage()));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15.0),
                            margin: const EdgeInsets.only(top: 10, bottom: 30),
                            decoration: kButtonStyle,
                            child: const Text(
                              '제출하기',
                              style: kMediumBTextStyle,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  ]))
        ])),
      )),
    );
  }
}

class CompletePage extends StatelessWidget {
  const CompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print for checking data
    if (kDebugMode) {
      print('email(SubPages.dart:93) : $age');
      print('phone(SubPages.dart:94) : $phone');
      print('age(SubPages.dart:90) : $age');
      print('gender(SubPages.dart:91) : $gender');
      print('job(SubPages.dart:92) : $job');
      print('opinion(SubPages.dart:95) : $opinion');
    }

    return Material(
      color: materialColor,
      child: Center(
        child: Container(
          width: screenCheck(context),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainAppBar(
                context,
                iconBtn: backIcon(context)
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60, bottom: 40),
                    child: Image.asset('assets/image/icon/complete.png'),
                  ),
                  const Text(
                    '정식 런칭 예약 신청이 완료되었습니다.',
                    style: kLargeTextStyle,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(20),
                    decoration: kContainerStyle,
                    child: const Text(
                      '신청해 주셔서 감사합니다!',
                      style: kMediumTextStyle,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (currentPage) => const FirstPage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      // alignment: Alignment.center,
                      decoration: kButtonStyle,
                      child: const Text(
                        '홈으로 돌아가기',
                        style: kMediumBTextStyle,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 250)
            ],
          ),
        ),
      ),
    );
  }
}
