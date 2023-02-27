import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:subq/Seokhwan.dart';
import 'Button.dart';
import 'main.dart';

//스크린 크기에 따른 상수 전달 함수 : 전체 스크린의 width 사이즈를 조절
screenCheck(BuildContext context) {
  var w = MediaQuery.of(context).size.width;
  if (w >= 700) {
    return 500;
  } else {
    return w;
  }
}

screenHeight(BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  return h;
}

//자주 사용하는 텍스트, 위젯 스타일을 한 번에 관리
//여백 컬러
const materialColor = Color(0xfffbfbfb);

//text styles
const kLargeTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
    fontFamily: 'hyemin');

const kMediumTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 15.0,
    fontFamily: 'hyemin');

const kMediumBTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 15.0,
    fontFamily: 'hyemin');

const kSmallTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    fontFamily: 'hyemin');

const kTagTextStyle = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    fontFamily: 'hyemin');

const kButtonTextStyle = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w400,
    fontSize: 10.0,
    fontFamily: 'hyemin');

//widget styles
//연한 초록 컨테이너
var kContainerStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(30), color: const Color(0xffe4eee9));

//연한 노랑 컨테이너(버튼)
var kButtonStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(30), color: const Color(0xfffbefc3));

//진한 노랑 컨테이너(버튼)
var kButtonStyleB = BoxDecoration(
    borderRadius: BorderRadius.circular(30), color: const Color(0xffFFD440));

//ReservationPage의 체크박스 스타일(검은 테두리, 흰 배경)
var kCheckBoxStyle =
    BoxDecoration(border: Border.all(color: Colors.black, width: 2.3));

//컨테이너 생성 함수
//container with green background
Widget buildContainer(String img, String text) {
  return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      alignment: Alignment.center,
      decoration: kContainerStyle,
      child: Column(children: [
        Image.asset(
          img,
          height: 60,
          fit: BoxFit.fill,
        ),
        Text(
          text,
          style: kLargeTextStyle,
        )
      ]));
}

// 텍스트 포함 버튼 생성 함수 (연한 노랑)
// SEOKHWAN
// TypeTest.dart , line 30 주변 코멘트 확인할 것.
// 다른 print 하는 함수등과 엮여서
// 이 함수를 사용하기 때문에
// 코드를 넘기는 것은 default 값을 갖는 parameter 로 변경
// 이것은 다른 함수에 영향을 주지 않기 위함임.
Widget buildButton(BuildContext currentPage, Widget linkedPage, String text,
    {dynamic func, int code = -1}) {
  return InkWell(
    onTap: () {
      // SEOKHWAN
      // code default 값을 -1 로 해놓고
      // 이 값이 default 가 아닌 경우에만
      // 함수를 이전과 다르게 호출하도록 변경
      if (code >= 0) {
        func(code);
      } else {
        func;
      }
      Navigator.push(
          currentPage, MaterialPageRoute(builder: (currentPage) => linkedPage));
    },
    child: Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      decoration: kButtonStyle,
      child: Text(
        text,
        style: kMediumBTextStyle,
      ),
    ),
  );
}

//사진 버튼 생성 함수 for sharing with SNS, 임시
Widget buildImgButton(String imgFile) {
  return InkWell(
    onTap: null,
    child: Image.asset(
      imgFile,
      width: 53.0,
      height: 53.0,
    ),
  );
}

IconButton backIcon(BuildContext context) {
  return IconButton(
      padding: const EdgeInsets.only(bottom: 5),
      constraints: const BoxConstraints(),
      onPressed: () {
        Navigator.maybePop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
        size: 30,
      ));
}

//Type Test에서 공통되는 상단 컨테이너 생성 함수
// linear progress bar, texts with padding
Widget buildTop(
    BuildContext context, int pageNum, double progressValue, String category) {
  return Container(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, right: 30.0),
              child: Text(
                '$pageNum/13',
                style: kSmallTextStyle,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: const Color(0xfff1c323)),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                valueColor: const AlwaysStoppedAnimation(Color(0xfff1c323)),
                backgroundColor: const Color(0xffffffff),
                value: progressValue,
                minHeight: 10.0,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0, left: 35.0, right: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  category,
                  style: kLargeTextStyle,
                ),
              ),
              const Expanded(
                child: Text(
                  '잘 모르는 재료는 평가하지 않아도 됩니다.',
                  style: kMediumTextStyle,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
      ],
    ),
  );
}

//평가 버튼 생성 함수
Widget buildButtons(Buttons btn, func, BuildContext context) {
  double btnSize = 30;
  double btnSize2 = 40;

  return Container(
    width: screenCheck(context) * 0.4,
    child: Container(
      padding: const EdgeInsets.only(left: 5),
      color: Colors.white,
      child: (Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 5.0,
              ),
              InkWell(
                onTap: () {
                  func(1, btn);
                },
                child: Image.asset(
                  btn.imgFile1,
                  width: btnSize,
                  height: btnSize,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                '싫어요',
                style: kButtonTextStyle,
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(
                height: 5.0,
              ),
              InkWell(
                onTap: () {
                  func(2, btn);
                },
                child: Image.asset(
                  btn.imgFile2,
                  width: btnSize,
                  height: btnSize,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                '좋아요',
                style: kButtonTextStyle,
              )
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  func(3, btn);
                },
                child: Image.asset(
                  btn.imgFile3,
                  width: btnSize2,
                  height: btnSize2,
                ),
              ),
              const Text(
                '최고예요!',
                style: kButtonTextStyle,
              ),
            ],
          ),
          const SizedBox(
            width: 1,
          )
        ],
      )),
    ),
  );
}

//Type test : topping 사진 생성 함수
Widget toppingImg(BuildContext context, String menuName, String imgFile,
    {String toppingInfo = ''}) {
  return Container(
    width: screenCheck(context) * 0.4,
    height: screenHeight(context) * 0.15,
    color: Colors.white,
    padding: const EdgeInsets.only(
      top: 5,
      bottom: 5,
    ),
    child: Column(
      children: [
        FittedBox(
          fit: BoxFit.cover,
          child: Text(
            menuName,
            style: kMediumBTextStyle,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Image.asset(
          imgFile,
          height: screenHeight(context) * 0.08,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
            toppingInfo,
            style: kTagTextStyle,
        ),

      ],
    ),
  );
}

Widget greyLine(BuildContext context) {
  return Container(
    color: const Color(0xffD9D9D9),
    width: screenCheck(context),
    height: 1,
  );
}

//약관
//변수 데이터를 불러오는 과정에서 시간이 많이 걸려 일단 주석처리 함.
// const String terms =
//     '제1장	총칙\n\n제 1 조	       목적\n본 약관은 [(주)팜킷](이하 “회사”라 합니다)이 제공하는 제반 서비스 이용과 관련하여 회사와 이용자의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다. 본 약관은 이용자가 회사가 제공하는 스마트폰, 태블릿기기용 앱 등을 이용하는 경우에도 그 성질에 반하지 않는 한 준용됩니다.\n\n제 2 조	       용어의 정의\n①	“서비스”란 [회사가 제공하는 AI 개인화 메뉴 및 식단 추천 서비스]를 말합니다.\n②	”이용자”란 “회사”의 사이트에 접속하여 본 약관에 따라 “회사”가 제공하는 “서비스”를 이용하는 회원 및 비회원을 말합니다. \n③	“회원”이란 “회사”와 이용계약을 체결하고 “이용자” 아이디(ID)를 부여받은 “이용자”로서 “회사”의 정보를 지속적으로 제공받으며 “회사”가 제공하는 서비스를 지속적으로 이용할 수 있는 자를 말합니다. \n④	“비회원”이란 “회원”이 아니면서 “회사”가 제공하는 서비스를 이용하는 자를 말합니다. \n⑤	“아이디(ID)”란 “회원”의 식별과 서비스이용을 위하여 “회원”이 정하고 “회사”가 승인하는 문자 또는 숫자의 조합을 말합니다.\n⑥	“비밀번호(PASSWORD)”란 “회원”이 부여받은 “아이디”와 일치되는 “회원”임을 확인하고 비밀보호를 위해 “회원”자신이 정한 문자, 숫자 또는 특수문자의 조합을 말합니다.\n\n'
//     '제 3 조	       약관의 효력 및 변경\n①	본 약관의 내용은 서비스의 화면에 게시하거나 기타의 방법으로 공지하고, 본 약관에 동의한 이용자 모두에게 그 효력이 발생합니다.\n②	회사는 필요한 경우 관련 법령을 위배하지 않는 범위 내에서 본 약관을 변경할 수 있습니다. 본 약관이 변경되는 경우 회사는 변경사항을 시행일자 7일 전부터 이용자에게 서비스 공지사항에서 공지 또는 통지하는 것을 원칙으로 하며, 피치 못하게 이용자에게 불리한 내용으로 변경할 경우에는 최소한 그 시행일자 30일 전부터 제7조에 규정한 방법으로 개별적으로 알려 드리겠습니다.\n③	회사가 전 항에 따라 공지 또는 통지를 하면서 공지 또는 통지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 이용자의 의사표시가 없는 경우에는 변경된 약관을 승인한 것으로 봅니다.\n④	이용자는 변경된 약관에 동의하지 않을 권리가 있으며 변경된 약관에 동의하지 않을 경우 서비스의 이용을 중단하고 이용계약의 해지를 선택할 수 있습니다. 단, 변경된 약관에 동의하지 않을 경우 변경된 약관의 적용을 받는 서비스의 이용이 불가능할 수 있습니다.\n⑤	본 약관은 이용자가 본 약관에 동의한 날로부터 이용계약의 해지 시까지 적용하는 것을 원칙으로 합니다. 단, 본 약관의 일부 조항은 이용계약의 해지 후에도 유효하게 적용될 수 있습니다.\n⑥	본 약관에서 정하지 아니한 사항 및 해석에 관하여는 약관의 규제 등에 관한 법률 및 기타 서비스와 관련된 관계법령 또는 상관례에 따릅니다.\n\n제2장	이용계약 및 정보보호\n\n\n제 4 조	       회원가입\n회원으로 가입하고자 하는 이용자가 회사가 정한 가입 양식에 정해진 사항을 기입한 후 본 약관 및 개인정보수집・이용동의서 등 회원의 동의가 필요한 사항에 대하여 동의한다는 의사표시를 하고, 회사가 이를 승낙함으로써 회원과 회사 사이에 이용계약이 체결됩니다.\n\n제 5 조	       회원가입 제한 등\n①	회사는 아래 각 호의 경우에는 회원가입을 승낙하지 않거나 사후적으로 이용계약을 해지 또는 제12조에 따른 제재를 할 수 있습니다.\n1.	타인의 명의나 이메일 주소 등 타인의 개인정보를 이용한 경우\n2.	회사로부터 서비스 이용정지 조치 등 제재를 받은 자가 그 조치기간에 서비스 이용계약을 임의로 해지하고 재가입하고자 하는 경우\n3.	회원가입시 양식에 기입한 내용에 허위, 기재누락, 오기가 있는 경우\n4.	부정한 용도로 서비스를 이용하고자 하는 경우\n5.	법령 위반 또는 본 약관에 위배되거나 기타 부당한 회원가입임이 회사의 합리적인 판단에 비추어 인정되는 경우\n6.	만 14세 미만인 자가 법정대리인의 동의 없이 가입한 것으로 확인되는 경우\n②	회사는 아래 각 호의 경우에는 회원가입의 승낙을 유보할 수 있습니다.\n1.	서비스 제공 설비 용량에 여유가 없는 경우\n2.	서비스 제공을 위한 기술적인 부분에 문제가 있다고 판단되는 경우\n3.	기타 회사가 재정적, 기술적으로 필요하다고 인정하는 경우\n③	회원은 회원가입 시 등록한 사항에 변경이 있는 경우 상당한 기간 이내에 회사에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 하며, 변경된 회원정보를 회사에 알리지 않아 발생하는 손해에 대한 책임은 이용자에게 있습니다.\n\n제 6 조	       회원의 아이디 및 비밀번호에 대한 의무 \n①	아이디와 비밀번호에 관한 관리책임은 회원에게 있습니다.\n②	회원은 자신의 아이디 및 비밀번호를 제3자에 이용하게 해서는 안 됩니다. \n③	회원이 자신의 아이디 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 회사에 통보하고 회사의 안내 또는 조치가 있는 경우에는 그에 따라야 하며, 회사의 안내 또는 조치를 따르지 않음으로써 발생하는 손해에 대한 책임은 회원에게 있습니다.\n\n제 7 조	       이용자에 대한 통지\n①	회사가 이용자에 대한 통지를 하는 경우 본 약관에 별도 규정이 없는 한 이용자가 제공한 이메일주소, (휴대)전화번호, 로그인 시 알림창, 전자쪽지 등 서비스 내 각종 통지 수단으로 할 수 있습니다.\n②	회사는 이용자의 권리에 중대한 영향을 미치지 않는 사항에 대해서는 7일 이상 회사가 제공하는 서비스에 공지함으로써 제1항의 통지에 갈음할 수 있습니다.\n\n'
//     '제 8 조	       개인정보보호\n①	회사는 서비스 제공을 위하여 이용자의 개인정보를 수집할 수 있으며, 이 경우 필요한 최소한의 범위 내에서 개인정보를 수집합니다.\n②	회사는 이용자의 개인정보 보호를 위하여 [개인정보처리방침]을 수립하고, [개인정보처리방침] 및 개인정보 보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하 ‘정보통신망법’) 등 관계 법령에 따라 개인정보를 보호하기 위하여 노력합니다. 개인정보 보호와 관련한 상세한 사항은 [개인정보처리방침]을 참고하시기 바랍니다.\n\n제3장	서비스 이용\n\n제 9 조	       서비스의 제공\n회사는 이용자에게 아래와 같은 서비스를 제공합니다.\n1.	무료 개인화 맞춤 메뉴 추천 서비스 : AI 로 회원의 취향에 맞는 맞춤 메뉴 추천과 맞춤 식단 작성 서비스를 제공합니다. \n2.	기타 회사가 제공하는 서비스\n\n제 10 조	서비스 중단\n①	“회사”는 서비스의 제공과 관련한 “회사”의 정책 변경, 서비스의 기술적 사양의 변경 필요성이 있는 경우 또는 다음 각호의 사유를 포함한 기타 상당한 사유가 있는 경우에는 서비스의 전부 또는 일부의 내용을 중단할 수 있습니다.\n1.	서비스용 설비의 유지·보수 등을 위한 정기 또는 임시 점검의 경우\n2.	정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우\n3.	관계사와의 계약 종료, 정부의 명령/규제 등 “회사”의 제반 사정으로 서비스의 전부 또는 일부를 유지할 수 없는 경우\n4.	기타 천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우\n②	이 경우 중단되는 서비스의 내용은 제7조의 방법으로 사전에 공지하며, 서비스의 변경이 이용자에게 중대한 영향을 미치는 경우 이용자의 이메일 주소로 메일을 발송하거나 휴대전화번호로 문자메시지를 전송하는 방법으로 개별적으로 공지합니다. 다만, “회사”가 예측할 수 없거나 통제할 수 없는 사유(“회사”의 과실이 없는 디스크 내지 서버 장애, 시스템 다운 등)로 인해 사전 통지 내지 공지가 불가능한 경우에는 사후에 공지할 수 있습니다.\n③	“회사”는 제1항의 사유로 서비스가 중단되는 경우 최대한 빠른 시일 내에 서비스를 재개하도록 노력하겠습니다.\n\n제 11 조	 이용자의 의무\n이용자는 서비스를 이용하며 다음 각 호의 행위를 하여서는 아니되며, 회사는 해당 이용자에 대하여 제12조에 따른 제재를 하거나 민형사상 책임을 물을 수 있습니다.\n1.	신청 또는 변경 시 허위내용의 등록\n2.	타인의 정보도용\n3.	회사가 게시한 정보의 변경\n4.	회사가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시\n5.	회사와 기타 제3자의 저작권 등 지적재산권에 대한 침해\n6.	회사 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위\n7.	외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 서비스에 공개 또는 게시하는 행위\n8.	회사의 동의 없이 영리를 목적으로 서비스를 사용하는 행위\n9.	기타 법령, 선량한 풍속 기타 사회통념에 반하거나 본 약관 및 회사의 정책을 위반하는 행위\n\n제 12 조	회원탈퇴 및 이용제한\n①	회원은 “회사”에 언제든지 탈퇴를 요청할 수 있으며 “회사”는 즉시 회원탈퇴를 처리합니다.\n②	“회사”는 이용자가 본 약관 및 “회사”가 서비스의 운영을 위하여 정하는 정책에 따른 의무를 위반하거나 서비스의 정상적인 운영을 방해하거나 다음 각 호에 해당하는 경우, 사전통보 후 경고, 일시정지, 영구이용정지 등으로 서비스 이용을 제한할 수 있습니다.\n1.	가입 신청 시에 허위 내용을 등록한 경우\n2.	다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등 관련 법령상 질서를 위협하는 경우\n3.	서비스를 이용하여 법령 또는 본 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우\n③	회사는 전항에도 불구하고, 주민등록법을 위반한 명의도용 및 결제도용, 저작권법 및 컴퓨터프로그램보호법을 위반한 불법프로그램의 제공 및 운영방해, 정보통신망법을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한 경우에는 즉시 영구이용정지를 하거나 이용계약을 해지할 수 있습니다.\n④	“회사”가 회원 자격을 제한한 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “회사”는 회원자격을 상실시킬 수 있습니다.\n⑤	“회사”가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.\n⑥	“회사”는 회원이 계속해서 1년 이상 로그인을 하지 않는 경우 회원정보의 보호를 위하여 이용을 제한할 수 있습니다.\n⑦	본 조에 따른 이용제한 제재를 받은 이용자가 이의를 제기하고자 할 경우 “회사”의 고객센터에 문의할 수 있습니다.\n\n제 13 조	게시물 관련\n①	“회사“가 작성한 저작물에 대한 저작권 기타 지식재산권 일체는 ”회사“에 귀속합니다.\n②	이용자는 서비스를 이용함으로써 얻은 정보 중 “회사”에게 지식재산권이 귀속된 정보를 “회사”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안 됩니다.\n③	“회사”가 서비스를 통해 이용자가 게시물을 게재할 수 있는 서비스를 제공하는 경우, 해당 게시물의 저작권은 이를 게시한 이용자에게 귀속됩니다. 다만 회사가 회원의 게시물을 집계하고 분석하여 만들어낸 데이터는 회사에 귀속됩니다. \n④	이용자는 "회사"의 서비스를 이용해 자신이 작성・제공한 게시물에 관해, 이를 수정・격리・삭제할 수 있는 권리를 포함하여, 복제권・공연권・공중송신권・전시권・배포권・대여권・2차적저작물작성권 등 저작재산권 일체에 대한 권리를 "회사"에게 부여하는 것에 동의합니다. "회사"와 서비스 제공에 대한 계약상 관계가 있는 제3자에 대하여도 해당 서비스 제공의 목적으로 하는 경우 동일합니다. 여기에는 다음과 같은 이용형태를 포함하되 이에 한정되지 않습니다. \n1.	회사에서 운영하는 다른 사이트 또는 다른 회사가 운영하는 사이트에 게시물을 복제, 전송, 전시하는 것\n2.	 회사의 서비스를 홍보하기 위한 목적으로 미디어, 통신사 등에게 게시물의 내용을 보도, 방영하게 하는 것. 단, 이 경우 회사는 회원의 개별 동의없이 미디어, 통신사 등에게 게시물 또는 회원정보를 제공하지 않습니다.\n⑤	본 약관에서 "회사"에 부여된 권리를 제외하고 이용자는 이용자의 게시물에 대한 모든 권리를 보유합니다. 이용자의 동의 없이 "회사"는 이용자의 게시물을 공개할 수 없습니다. 단, 이용자가 공유를 목적으로 배포한 게시물 또는 이용자의 동의를 얻은 게시물에 한해서는 이용자의 게시물을 이용, 전시, 배포 및 수정하는 것에 동의한 것으로 봅니다.\n⑥	이용자가 게시물이 법령에 위반되는 내용을 포함하는 경우, 권리자는 “회사”에 관련 법령이 정한 절차에 따라 해당 게시물의 게시중단 및 삭제 등을 요청할 수 있으며, “회사”는 관련 법령에 따라 조치를 취할 수 있습니다. \n⑦	“회사”는 권리자의 요청이 없는 경우라도 다음 각호의 사유의 경우에는 사전통지 없이 해당 게시물에 대해 삭제 또는 임시조치 등을 취할 수 있습니다.\n1.	법령을 위반하거나 범죄 행위에 결부된다고 인정되는 경우\n2.	“회사” 또는 제3자의 권리를 침해한다고 인정될 만한 사유가 있는 경우 \n3.	기타 “회사”의 정책에 위반되는 경우\n\n제 14 조	유료서비스 관련\n①	“회사”는 서비스의 전부 또는 일부에 대하여 이를 유료로 제공할 수 있습니다.\n②	“회사”가 유료서비스를 제공하는 경우 해당 서비스의 이용요금, 납부방법, 교환, 대금 환불 등 절차에 관한 [유료서비스운영정책]을 별도로 제정하여 이를 이용자에게 제공할 수 있습니다.\n\n제4장	이용계약의 해지\n\n제 15 조	이용계약 해지\n①	이용자가 서비스의 이용을 더 이상 원하지 않을 경우 언제든지 이용계약의 해지 신청을 할 수 있으며, 회사는 관련 법령이 정하는 바에 따라 이를 신속히 처리하도록 하겠습니다. 단, 이용자가 법령을 위반하였거나 위반하였다고 판단되는 경우, 회사 또는 다른 이용자와의 분쟁이 있는 경우에는 이용계약의 해지가 상당 기간 동안 제한될 수 있습니다.\n②	이용자가 이용계약을 해지할 경우 관련 법령에 따라 회사가 회원의 정보를 일정 기간 보유하여야 하는 경우를 제외하고는 해지 즉시 이용자가 등록한 정보 및 게시물 등 모든 데이터는 삭제됩니다. 다만, 다른 이용자의 정상적 서비스 이용을 위하여 필요한 범위 내의 데이터, 법령상 회사의 보관의무가 있는 데이터는 삭제되지 않습니다.\n\n제5장	기타\n\n제 16 조	연결“사이트”와 피연결“사이트” 간의 관계\n①	상위 “사이트(웹 사이트)”와 하위 “사이트(웹 사이트)”가 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상, 각종 광고 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “사이트”라고 하고 후자를 피연결 “사이트”라고 합니다.\n②	연결“사이트”는 피연결“사이트”가 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“사이트”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.\n③	회사의 공식 사이트 이외의 피연결”사이트”에서는 회사의 본 약관과 개인정보처리방침이 적용되지 않습니다. 피연결”사이트”의 서비스 이용 및 재화 등 구매에 관하여는 해당 피연결”사이트”의 약관 및 개인정보처리방침을 확인하여야 하며, 그렇지 않음으로 인하여 발생한 책임은 이용자에게 있고 회사는 이에 대하여 책임을 부담하지 않습니다. \n\n제 17 조	개별서비스에 대한 이용 약관\n④	회사가 서비스의 제공과 관련한 별도의 서비스를 제공하게 될 경우 해당 서비스를 위한 약관 및 정책을 둘 수 있습니다.\n⑤	회사가 전항에 따른 개별서비스를 이용약관을 둘 경우 이용자가 최초로 해당 서비스를 이용할 때에 동의 절차를 거치도록 하며, 개별 서비스에 대한 이용약관이 본 약관에 우선합니다.\n\n제 18 조	책임제한'
//     '회사는 이용자에게 본 약관에 명시되지 않는 사항에 대한 약정이나 보증을 하지 않습니다. 단, 회사 및 회사의 임직원, 대리인의 고의 또는 중대한 과실이 인정되는 경우에는 그러하지 아니합니다. \n\n제 19 조	손해배상\n①	회사는 회사의 고의, 과실로 인하여 회원이 손해를 입게 될 경우 본 약관 및 관련 법령에 따라 회원의 손해를 배상하겠습니다. 다만 회사는 회사의 고의, 과실 없이 발생된 아래와 같은 손해에 대해서는 책임을 부담하지 않습니다. 또한 회사는 법률상 허용되는 한도 내에서 간접 손해, 특별 손해, 결과적 손해, 징계적 손해, 및 징벌적 손해에 대한 책임을 부담하지 않습니다.\n1.	천재지변 또는 이에 준하는 불가항력의 상태에서 발생한 손해\n2.	이용자의 귀책사유로 서비스 이용에 장애가 발생한 경우\n3.	서비스에 접속 또는 이용과정에서 발생하는 개인적인 손해\n4.	제3자가 불법적으로 회사의 서버에 접속하거나 서버를 이용함으로써 발생하는 손해\n5.	제3자가 회사 서버에 대한 전송 또는 회사 서버로부터의 전송을 방해함으로써 발생하는 손해\n6.	제3자가 악성 프로그램을 전송 또는 유포함으로써 발생하는 손해\n7.	전송된 데이터의 생략, 누락, 파괴 등으로 발생한 손해, 명예훼손 등 제3자가 서비스를 이용하는 과정에서 발생된 손해\n8.	제10조 제1항에 따라 이용자 또는 제3자가 입은 손해\n9.	기타 회사의 고의 또는 과실이 없는 사유로 인해 발생한 손해\n②	회사는 회사의 고의, 과실이 없는 한 이용자 상호간 또는 이용자와 제3자 상호간에 서비스를 매개로 발생한 분쟁에 대해서는 개입할 의무가 없으며 이로 인한 손해를 배상할 책임도 없습니다.\n③	회사는 서비스 및 서비스에 게재된 정보, 자료, 사실의 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며 이로 인해 발생한 이용자의 손해에 대하여는 책임을 부담하지 아니합니다.\n④	회사는 이용자가 서비스를 이용함으로써 기대되는 수익을 얻지 못하거나 서비스를 통해 얻은 자료를 이용하여 발생한 손해에 대해서는 책임을 부담하지 않습니다. \n⑤	이용자가 본 약관의 규정 또는 관련 법령을 위반하여 회사에 손해가 발생한 경우 회사는 이용자에 대하여 손해배상을 청구할 수 있습니다. 이 경우 이용자는 고의, 과실이 없음을 입증하지 못하는 경우 책임을 면할 수 없습니다.\n⑥	회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 관련 책임이 면제됩니다. \n⑦	회사는 이용자의 귀책사유로 인한 서비스 이용의 장애에 대하여는 책임을 지지 않습니다.\n\n제 20 조	 준거법 및 분쟁 해결\n①	본 약관은 대한민국법령에 의하여 규정되고 이행됩니다. \n②	회사는 이용자와의 분쟁이 발생할 경우 이의 해결을 위해 성실히 협의할 것이나, 그럼에도 불구하고 분쟁이 해소되지 않으면 이에 관한 소송은 민사소송법상의 관할법원에 제기할 수 있습니다.\n\n부칙\n본 약관은 2023. 2. 1.부터 적용됩니다. ';

// 실행 함수들
// purpose 값 저장
void purposeCode(int num) {
  Utils.purpose = num;
  purpose = "purpose:::$num";
}

//데이터 위치 print 함수
printData({data1, data2, data3, data4}) {
  if (kDebugMode) {
    print("$data1\n$data2\n$data3\n$data4");
  }
}
