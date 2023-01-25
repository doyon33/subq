import 'package:flutter/material.dart';

//자주 사용하는 텍스트, 위젯 스타일을 한 번에 관리
const kLargeTextStyle =
    TextStyle(
      color: Colors.black, fontWeight: FontWeight.w700,
      fontSize: 18.0, fontFamily: 'hyemin');

const kMediumTextStyle =
    TextStyle(
      color: Colors.black, fontWeight : FontWeight.w400,
        fontSize: 16.0, fontFamily: 'hyemin');

const kSmallTextStyle =
    TextStyle(
        color: Colors.black, fontWeight: FontWeight.w400,
        fontSize: 14.0, fontFamily: 'hyemin');

const kTagTextStyle =
    TextStyle(
        color: Colors.grey, fontWeight: FontWeight.w400,
        fontSize: 12.0, fontFamily: 'hyemin');

const kButtonTextStyle =
    TextStyle(
        color: Colors.grey, fontWeight: FontWeight.w400,
        fontSize: 10.0, fontFamily: 'hyemin');

var kContainerStyle =
    BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: const Color(0xffe4eee9)
    );

var buttonStyle =
    BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xfffbefc3)
    );

//container with green background
Widget buildContainer (String text1, String img, String text2) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        alignment: Alignment.center,
        // height: 150.0,
        decoration: kContainerStyle,
        child: Column(
          children: [
              // Text(
              //     text1,
              //     style: kMediumTextStyle,
              // ),
              Image.asset(img, height: 110.0,),
              Text(
                  text2,
                  style: kLargeTextStyle,)
          ]
        )
    );
}

// light yellow button with text : move to another page
// 서버에 데이터를 전송하는 등의 기능 가진 버튼은 동일한 decoration을 사용하나,
// 이 양식으로 생성하지 않을 수 있음.

Widget buildButton (BuildContext currentPage, Widget linkedPage, String text) {
    return InkWell(
        onTap: () {
            Navigator.push(currentPage,
                MaterialPageRoute(builder: (currentPage) => linkedPage)
            );
        },
        child: Container(
            padding: const EdgeInsets.all(15.0),
            margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            width: 140.0,
            alignment: Alignment.center,
            decoration: buttonStyle,
            child: Text(
                text, style: kMediumTextStyle,
            ),
        ),
    );
}