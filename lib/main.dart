import 'package:flutter/material.dart';
import 'package:intesasoft/views/home.dart';
import 'package:provider/provider.dart';

import 'core/theme/theme.dart';
import 'view_models/home_vm.dart';

void main() {
  runApp(MultiProvider(
    providers: [
        ChangeNotifierProvider(
              create: (_) => CitiesViewModel(),
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
      home:const HomeView(),
      theme: AppThemeLight.instance.theme

    );
  
  }
}