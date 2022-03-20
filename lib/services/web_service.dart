import 'package:dio/dio.dart';

import '../models/cities.dart';
import '../utils/constants.dart';

class WebService {
  var dio = Dio();

  Future<List<CitiesModel>> fetchAllCities() async {
    final response = await dio.get(Constants.baseUrl);

    if (response.statusCode == 200) {
      final result = response.data;
      List<CitiesModel> cities = [];
      for (dynamic city in result) {
        cities.add(CitiesModel.fromJson(city));
      }

      return cities;
    } else {
      throw Exception("Failled to get cities");
    }
  }

  Future<CitiesModel> fetchCityById(String cityId) async {
    final response = await dio.get(Constants.baseUrl + cityId);

    if (response.statusCode == 200) {
      final result = response.data;
      CitiesModel city = CitiesModel.fromJson(result);
      return city;
    } else {
      throw Exception("Failled to get cities");
    }
  }
}
