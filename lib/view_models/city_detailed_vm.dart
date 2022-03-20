import 'package:flutter/material.dart';


import '../models/cities.dart';
import '../services/web_service.dart';
import '../utils/enums.dart';



class CityDetailedViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  CitiesModel? city;


  void getCityById(String cityId) async {
     loadingStatus = LoadingStatus.searching;
    city = await WebService().fetchCityById(cityId);
          loadingStatus = LoadingStatus.completed;
      notifyListeners();
  }

}