import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:subq/TestResult.dart';

// 메뉴에 해당하는 이미지 파일을 불러오기 위한 Map
Map<String, String> imgFileMap = {
  '에그마요': 'image/menu/eggmayo.png',
  '베이컨': 'image/menu/bacon.png',
  '바베큐': 'image/menu/bbq.png',
  '치킨': 'image/menu/chicken.png',
  '햄': 'image/menu/ham.png',
  '쉬림프': 'image/menu/shrimp.png',
  '스테이크': 'image/menu/steak.png',
  '참치': 'image/menu/tuna.png',
  '베지': 'image/menu/vege.png'
};

//테스트 결과로 나온 추천 메뉴 각각의 정보 클래스
class TestResultData {
  String? menu;
  String? bread;
  String? main;
  String? cheese;
  String? sauce;
  double? kcal;
  double? carbo;
  double? protein;
  double? fat;
  double? dietaryFiber;

  String? filename; //이미지 파일

  TestResultData(
      String this.menu,
      String this.bread,
      String this.main,
      String this.cheese,
      String this.sauce,
      String this.filename,
      double this.kcal,
      double this.carbo,
      double this.protein,
      double this.fat,
      double this.dietaryFiber);
}

//테스트 결과를 바탕으로 생성되는 추천 메뉴 5가지를 담은 데이터베이스 클래스
class Database {

  List dataList = [];

  void addData(TestResultData d) {
    dataList.add(d);
  }
}

//Database 클래스의 인스턴스 생성
var db = Database();


class Utils {
  static Map<String, int> eval = {};
  static int purpose = -1;

  static void setEval(String? code, int val) {
    if (null != code) {
      if (eval.containsKey(code)) {
        // 이미 설정된 값이 한 번 더 들어온 상태, 즉 cancle 케이스
        if (eval[code] == val) {
          eval.remove(code);
        } else {
          eval[code] = val;
        }
      } else {
        eval[code] = val;
      }
    }
  }

  static Map<String, dynamic> toJson() => {
        'purpose': purpose,
        'eval': eval,
      };

  static String getJsonString() {
    var str = jsonEncode(toJson());
    return str;
  }

  static Future<dynamic> call() async {
    var res = await http.post(
      Uri.parse('https://dev.tastybit.kr/api/public/meal-plan/list-get'),
      headers: {"Content-Type": "application/json"},
      body: getJsonString(),
    );
    return jsonDecode(res.body);
  }

  static void printMenu(dynamic jboj) {
    print("");
    print("");
    print("");
    print("이름: ${jboj['name']}");
    print("빵: ${jboj['bread']}");
    print("메인재료: ${jboj['main']}");
    print("치즈: ${jboj['cheese']}");
    print("소스: ${jboj['sauce']}");
    print("kcal: ${jboj['nutrition']['calorie']}");
    print("탄수화물: ${jboj['nutrition']['carbohydrate']}");
    print("단백질: ${jboj['nutrition']['protein']}");
    print("포화지방: ${jboj['nutrition']['fat']}");
    print("식이섬유: ${jboj['nutrition']['dietary_fiber']}");


    //TestResultData 클래스의 인스턴스를 생성
    var s = TestResultData(
        jboj['main'],
        jboj['bread'],
        jboj['main'],
        jboj['cheese'],
        jboj['sauce'],
        // imgFileMap[jboj['main']]!,
        'image/menu/eggmayo.png',
        jboj['nutrition']['calorie'],
        jboj['nutrition']['carbohydrate'],
        jboj['nutrition']['protein'],
        jboj['nutrition']['fat'],
        jboj['nutrition']['dietary_fiber']);

    //DataBase의 인스턴스인 db(line:56)의 멤버함수를 통해 저장
    db.addData(s);

    //실행 결과, 아래 두 줄은 잘 print되고 리스트에 add도 잘 되었습니다
    print('data added ::: ');
    print('length of list : ${db.dataList.length}');
  }

  static Future fetchResult() async {
    var json = await call();
    for (int i = 0; i < json.length; i++) {
      printMenu(json[i]);
    }
  }
}