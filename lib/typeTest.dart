import 'package:flutter/material.dart';
import 'appbar.dart';
import 'constants.dart';

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
          buildButton(context, test_bread1(), '체중 유지'),
          buildButton(context, test_bread1(), '저탄고지식'),
          buildButton(context, test_bread1(), '저칼로리식'),
          buildButton(context, test_bread1(), '저염식'),
          buildButton(context, test_bread1(), '맛있는 조합')
        ],
      ),
    );
  }
}

class test_bread1 extends StatelessWidget {
  const test_bread1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

