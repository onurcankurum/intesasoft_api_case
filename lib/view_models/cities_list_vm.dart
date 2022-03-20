import 'package:flutter/material.dart';


import '../models/cities.dart';
import '../services/web_service.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class CitiesListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<CitiesModel> cities =[];
  List<CitiesModel> filteredCities =[];



  void getCities() async {
    loadingStatus = LoadingStatus.searching;
     cities = await WebService().fetchAllCities();
     filteredCities = List.from(cities);
         loadingStatus = LoadingStatus.completed;
     notifyListeners();
  }
    void filterCities(String filterKey) {
     
          filteredCities.clear();
          for(CitiesModel city in cities){
            if(city.name.contains(RegExp(filterKey, caseSensitive: false))){
              filteredCities.add(city);
            }
          }
       
     notifyListeners();
  }
}