// import 'package:flutter/foundation.dart';

class Buttons {
  String? toppingCode;

  Buttons(String this.toppingCode);

  var imgFile1 = 'images/icons/bad.png';
  var imgFile2 = 'images/icons/good.png';
  var imgFile3 = 'images/icons/nice.png';
  var pressed = 0;

  String getDataCode() {
    String temp = '${toppingCode!}:::$pressed';
    return temp;
  }

  void clickBad () {
    if (pressed != 1) {
      if (pressed == 2) { //good clicked
        imgFile2 = 'images/icons/good.png';
        pressed = 1;
        imgFile1 = 'images/icons/bad_clicked.png';
      }
      else if (pressed == 3) {
        imgFile3 = 'images/icons/nice.png';
        pressed = 1;
        imgFile1 = 'images/icons/bad_clicked.png';
      }
      else {
        imgFile1 = 'images/icons/bad_clicked.png';
        pressed = 1;
      }
    }
    else if (pressed == 1){
      pressed = 0;
      imgFile1 = 'images/icons/bad.png';
    }
    // if (kDebugMode) {
    //   print('($toppingCode) : ($pressed)');
    // }
  }

  void clickGood() {
    if (pressed != 2) {
      if (pressed == 1) { //bad clicked
        imgFile1 = 'images/icons/bad.png';
        pressed = 2;
        imgFile2 = 'images/icons/good_clicked.png';
      }
      else if (pressed == 3) {
        imgFile3 = 'images/icons/nice.png';
        pressed = 2;
        imgFile2 = 'images/icons/good_clicked.png';
      }
      else {
        imgFile2 = 'images/icons/good_clicked.png';
        pressed = 2;
      }
    }
    //cancel good btn click
    else if (pressed == 2){
      pressed = 0;
      imgFile2 = 'images/icons/good.png';
    }
  }

  void clickNice() {
    if (pressed != 3) {
      if (pressed == 1) { //bad clicked
        imgFile1 = 'images/icons/bad.png';
        pressed = 3;
        imgFile3 = 'images/icons/nice_clicked.png';
      }
      else if (pressed == 2) {
        imgFile2 = 'images/icons/good.png';
        pressed = 3;
        imgFile3 = 'images/icons/nice_clicked.png';
      }
      else {
        imgFile3 = 'images/icons/nice_clicked.png';
        pressed = 3;
      }
    }
    //cancel nice btn click
    else if (pressed == 3) {
      pressed = 0;
      imgFile3 = 'images/icons/nice.png';
    }
  }
}