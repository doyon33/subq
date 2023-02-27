import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:subq/TestResult.dart';
import 'main.dart';

// 메뉴에 해당하는 이미지 파일을 불러오기 위한 메뉴 이름:메뉴 코드 맵
Map<String, String> MenuCodeMap = {
  '풀드포크바비큐': 'SUBWAY_MAIN_MENU_10001',
  '햄': 'SUBWAY_MAIN_MENU_10002',
  '치킨슬라이스': 'SUBWAY_MAIN_MENU_10003',
  '스테이크&치즈': 'SUBWAY_MAIN_MENU_10004',
  '로티세리바비큐치킨': 'SUBWAY_MAIN_MENU_10005',
  '로스트치킨': 'SUBWAY_MAIN_MENU_10006',
  '쉬림프': 'SUBWAY_MAIN_MENU_10007',
  '치킨데리야끼': 'SUBWAY_MAIN_MENU_10008',
  '참치': 'SUBWAY_MAIN_MENU_10009',
  '에그마요': 'SUBWAY_MAIN_MENU_10010',
  '베지': 'SUBWAY_MAIN_MENU_10011',
  '비엘티': 'SUBWAY_MAIN_MENU_10012',
  '이탈리안비엠티': 'SUBWAY_MAIN_MENU_10013',
  '서브웨이클럽': 'SUBWAY_MAIN_MENU_100014',
  '치킨베이컨아보카도': 'SUBWAY_MAIN_MENU_10015',
  '스파이시이탈리안': 'SUBWAY_MAIN_MENU_10016',
  '에그마요베이컨': 'SUBWAY_MAIN_MENU_10017',
  '에그마요페퍼로니': 'SUBWAY_MAIN_MENU_10018',
  'K-바비큐': 'SUBWAY_MAIN_MENU_10019',
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

  String? menuCode; //메뉴 코드

  TestResultData(
      String this.menu,
      String this.bread,
      String this.main,
      String this.cheese,
      String this.sauce,
      String this.menuCode,
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
      //Uri.parse('http://192.168.0.9:54321/api/public/meal-plan/list-get'),
      Uri.parse('https://dev.tastybit.kr/api/public/meal-plan/list-get'),
      headers: {"Content-Type": "application/json"},
      body: getJsonString(),
    );
    return jsonDecode(res.body);
  }

  static Future<dynamic> addPreSubcriber() async {
    var res = await http.post(
      // Uri.parse(
      //     'http://192.168.0.9:54321/api/public/meal-plan/add-presubcriber'),
      Uri.parse(
          'https://dev.tastybit.kr/api/public/meal-plan/add-presubcriber'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        {
          'age': age,
          'gender': gender,
          'job': job,
          'email': email,
          'phone': phone,
          'opinion': opinion,
        },
      ),
    );
    return res.body;
  }

  static void printMenu(dynamic jboj) {
    //print(jboj);
    print("");
    print(jboj['info']);
    print(jboj['nutrition']);
    // print("이름: ${jboj['name']}");
    // print("빵: ${jboj['bread']}");
    // print("메인재료: ${jboj['main']}");
    // print("치즈: ${jboj['cheese']}");
    // print("소스: ${jboj['sauce']}");
    // print("kcal: ${jboj['nutrition']['calorie']}");
    // print("탄수화물: ${jboj['nutrition']['carbohydrate']}");
    // print("단백질: ${jboj['nutrition']['protein']}");
    // print("포화지방: ${jboj['nutrition']['fat']}");
    // print("식이섬유: ${jboj['nutrition']['dietary_fiber']}");

    //TestResultData 클래스의 인스턴스를 생성
    var s = TestResultData(
        jboj['main'],
        jboj['bread'],
        jboj['main'],
        jboj['cheese'],
        jboj['sauce'],
        MenuCodeMap[jboj['main']]!,
        jboj['nutrition']['calorie'],
        jboj['nutrition']['carbohydrate'],
        jboj['nutrition']['protein'],
        jboj['nutrition']['fat'],
        jboj['nutrition']['dietary_fiber']);

    //DataBase의 인스턴스인 db(line:56)의 멤버함수를 통해 저장
    db.addData(s);

    //print('data added ::: ');
    //print('length of list : ${db.dataList.length}');
  }

  static Future fetchResult() async {
    db.dataList.clear();
    var json = await call();
    for (int i = 0; i < json.length; i++) {
      printMenu(json[i]);
    }
  }
}
