import 'package:flutter/material.dart';

class SlotProvider with ChangeNotifier{

  int _price = 0;

  int get price => _price; 

  calculatePrice(int time){

    if(time == 10){
      _price = time *0;
      notifyListeners();
    }else{
      _price = time * 100;
      notifyListeners();
    }
  }

  
}