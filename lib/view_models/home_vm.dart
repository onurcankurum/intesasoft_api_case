import 'package:flutter/material.dart';


import '../models/cities.dart';
import '../services/web_service.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class CitiesViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<CitiesModel> cities =[];



  void getCities() async {
     cities = await WebService().fetchAllCities();
     notifyListeners();
  }
}