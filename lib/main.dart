import 'package:flutter/material.dart';
import 'package:intesasoft/views/cities_list.dart';
import 'package:provider/provider.dart';

import 'core/theme/theme.dart';
import 'view_models/cities_list_vm.dart';
import 'view_models/city_detailed_vm.dart';

void main() {
  runApp(MultiProvider(
    providers: [
        ChangeNotifierProvider(
              create: (_) => CitiesListViewModel(),
            ),
              ChangeNotifierProvider(
              create: (_) => CityDetailedViewModel(),
            )
    ],

    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const CitiesList(),
      theme: AppThemeLight.instance.theme

    );
  
  }
}