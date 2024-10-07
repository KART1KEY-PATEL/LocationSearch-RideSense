import 'package:flutter/material.dart';

class LocationController with ChangeNotifier{
  String _location = '';
  String get location => _location;

  void setLocation(String location){
    _location = location;
    notifyListeners();
  }
}