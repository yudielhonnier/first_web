


import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{
  int _counter=15;

   CounterProvider(String? query){
    if(int.tryParse(query!)!=null){
      this._counter=int.parse(query);
    }
   }

  get counter{
    return this._counter;
  }


  void increment(){
    this._counter++;
     notifyListeners();
  }

  void decrement(){
    this._counter++;
     notifyListeners();
  }


}