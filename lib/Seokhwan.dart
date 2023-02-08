import 'dart:convert';
import 'package:http/http.dart' as http;

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
  }

  static Future fetchResult() async {
    var json = await call();
    for (int i = 0; i < json.length; i++) {
      printMenu(json[i]);
    }
  }
}
