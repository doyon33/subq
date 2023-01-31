import 'package:flutter/material.dart';
import 'package:subq/AppBar.dart';
import 'package:subq/main.dart';
import 'constants.dart';

//의견 보내기 페이지
class SendReport extends StatelessWidget {
  const SendReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 30,left: 30, right: 30),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('약관 및 정책 페이지', style: kLargeTextStyle,),
                      SizedBox(height: 40.0,),
                      Text('SUBQ 이용약관', style: kMediumBTextStyle,),
                      Text(
                        '제1장 총칙\n\n\n약관 \n\n\n\n제1조 (목적)\n\n\n\n\n\n\n\n\n\n제2조 (용어의 정의)\n\n\n\n\n\n\n\n\n제3조 (약관의 효력 및 변경)\n\n\n\n\n\n\n\n\n',
                        style: kMediumTextStyle,
                      ),
                      SizedBox(height: 30,)
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}


class ReservationPage extends StatefulWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  bool age1 = false; //age
  bool age2 = false;
  bool age3 = false;
  bool age4 = false;
  bool gender1 = false;
  bool gender2 = false;
  bool job1 = false;
  bool job2 = false;
  bool job3 = false;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MainAppBar(),
        body: Center(
            child: (ListView(children: [
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
                        const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '이메일 주소',
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                          child: Text(
                            '핸드폰 번호(선택)',
                            style: kMediumBTextStyle,
                          ),
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '핸드폰 번호',
                          ),
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
                                          });
                                        }),
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
                        const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '서브큐에 대한 자유로운 의견을 남겨주세요.',
                          ),
                          maxLines: 5,
                          minLines: 1,
                        ),
                        const SizedBox(height: 20,),
                        const Text(
                          '정식런칭 예약 신청서 제출시 아래 개인정보 수집 및 이용에 동의 하는 것으로 간주됩니다.\n1. 개인정보의 수집 및 이용 목적 서브큐 서비스 개선 반영 및 출시정보 제공\n2. 수집하는 개인 정보의 항목 이메일(선택), 연락처(선택), 연령대(선택), 성별(선택), 직업(선택), 서비스관련 요청사항(선택)',
                          style: kSmallTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(width: 10,),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) => CompletePage()));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15.0),
                                margin: const EdgeInsets.only(top: 10, bottom: 30),
                                decoration: kButtonStyle,
                                child: const Text('제출하기', style: kMediumBTextStyle,),
                              ),
                            ),
                            const SizedBox(width: 10,),
                          ],
                        )
                      ]))
            ]))));
  }
}

class CompletePage extends StatelessWidget {
  const CompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Center(
        child: (
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 60,bottom: 40),
                child: Image.asset('image/icon/complete.png'),),
              const Text('정식 런칭 예약 신청이 완료되었습니다.', style: kLargeTextStyle,),
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(20),
                decoration: kContainerStyle,
                child: const Text('신청해주셔서 감사합니다!', style: kMediumTextStyle,),
              ),
              buildButton(context, const FirstPage(), '홈으로 돌아가기')
            ],
          )
        ),
      ),
    );
  }
}
