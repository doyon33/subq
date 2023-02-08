// import 'package:flutter/foundation.dart';
import 'Seokhwan.dart';

class Buttons {
  String? toppingCode;

  Buttons(String this.toppingCode);

  var imgFile1 = 'image/icon/bad.png';
  var imgFile2 = 'image/icon/good.png';
  var imgFile3 = 'image/icon/nice.png';
  var pressed = 0;

  String getDataCode() {
    String temp = '${toppingCode!}:::$pressed';
    return temp;
  }

  void clickBad() {
    // SEOKHWAN
    Utils.setEval(toppingCode, 0);
    if (pressed != 1) {
      if (pressed == 2) {
        //good clicked
        imgFile2 = 'image/icon/good.png';
        pressed = 1;
        imgFile1 = 'image/icon/bad_clicked.png';
      } else if (pressed == 3) {
        imgFile3 = 'image/icon/nice.png';
        pressed = 1;
        imgFile1 = 'image/icon/bad_clicked.png';
      } else {
        imgFile1 = 'image/icon/bad_clicked.png';
        pressed = 1;
      }
    } else if (pressed == 1) {
      pressed = 0;
      imgFile1 = 'image/icon/bad.png';
    }
    // if (kDebugMode) {
    //   print('($toppingCode) : ($pressed)');
    // }
  }

  void clickGood() {
    // SEOKHWAN
    Utils.setEval(toppingCode, 1);
    if (pressed != 2) {
      if (pressed == 1) {
        //bad clicked
        imgFile1 = 'image/icon/bad.png';
        pressed = 2;
        imgFile2 = 'image/icon/good_clicked.png';
      } else if (pressed == 3) {
        imgFile3 = 'image/icon/nice.png';
        pressed = 2;
        imgFile2 = 'image/icon/good_clicked.png';
      } else {
        imgFile2 = 'image/icon/good_clicked.png';
        pressed = 2;
      }
    }
    //cancel good btn click
    else if (pressed == 2) {
      pressed = 0;
      imgFile2 = 'image/icon/good.png';
    }
  }

  void clickNice() {
    // SEOKHWAN
    Utils.setEval(toppingCode, 2);
    if (pressed != 3) {
      if (pressed == 1) {
        //bad clicked
        imgFile1 = 'image/icon/bad.png';
        pressed = 3;
        imgFile3 = 'image/icon/nice_clicked.png';
      } else if (pressed == 2) {
        imgFile2 = 'image/icon/good.png';
        pressed = 3;
        imgFile3 = 'image/icon/nice_clicked.png';
      } else {
        imgFile3 = 'image/icon/nice_clicked.png';
        pressed = 3;
      }
    }
    //cancel nice btn click
    else if (pressed == 3) {
      pressed = 0;
      imgFile3 = 'image/icon/nice.png';
    }
  }
}
