import 'package:flutter/material.dart';
import 'Button.dart';

//스크린 크기에 따른 상수 전달 함수
screenCheck(BuildContext context) {
  if (MediaQuery.of(context).size.width >= 700) {
    return 500;
  } else {
    return null;
  }
}

//여백 컬러
const materialColor = Color(0xfffbfbfb);

//자주 사용하는 텍스트, 위젯 스타일을 한 번에 관리
//text styles
const kLargeTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 18.0,
    fontFamily: 'hyemin');

const kMediumTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    fontFamily: 'hyemin');

const kMediumBTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
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

//함수
//container with green background
Widget buildContainer(String text1, String img, String text2) {
  return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      alignment: Alignment.center,
      // height: 150.0,
      decoration: kContainerStyle,
      child: Column(children: [
        Image.asset(
          img,
          height: 60,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          text2,
          style: kLargeTextStyle,
        )
      ]));
}

// purpose 값 전달 기능 => 미구현
String purpose = '';

// 텍스트 포함 버튼 생성 함수 (연한 노랑)
Widget buildButton(BuildContext currentPage, Widget linkedPage, String text) {
  return InkWell(
    onTap: () {
      Navigator.push(
          currentPage, MaterialPageRoute(builder: (currentPage) => linkedPage));
    },
    child: Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      // alignment: Alignment.center,
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

//Type Test에서 공통되는 상단 컨테이너 생성 함수
// linear progress bar, texts with padding
Widget buildTop(int pageNum, double progressValue, String category) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 10.0),
            child: Text(
              '$pageNum/13',
              style: kSmallTextStyle,
            ),
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: LinearProgressIndicator(
            valueColor: const AlwaysStoppedAnimation(Color(0xfff1c323)),
            backgroundColor: const Color(0xffd6d6d6),
            value: progressValue,
            minHeight: 10.0,
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Text(
              category,
              style: kLargeTextStyle,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              '잘 모르는 재료는 평가하지 않아도 됩니다.',
              style: kMediumTextStyle,
            ),
          )
        ],
      ),
      const SizedBox(
        height: 5.0,
      ),
    ],
  );
}

//build three buttons 함수
Widget buildButtons(Buttons btn, func) {
  double btnSize = 30;
  double btnSize2 = 40;

  return SizedBox(
    width: 200.0,
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
        const SizedBox(
          width: 30.0,
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
        const SizedBox(
          width: 30.0,
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
            )
          ],
        )
      ],
    )),
  );
}

//Type test : topping 사진 생성 함수
Widget toppingImg(String menuName, String imgFile, String menuInfo) {
  return Container(
    width: 230.0,
    padding:
        const EdgeInsets.only(left: 25.0, top: 10.0, bottom: 10.0, right: 25.0),
    child: (Column(
      children: [
        Text(
          menuName,
          style: kMediumBTextStyle,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Image.asset(
          imgFile,
          width: 145,
          height: 61,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          menuInfo,
          style: kTagTextStyle,
        )
      ],
    )),
  );
}
