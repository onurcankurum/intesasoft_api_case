import 'package:flutter/material.dart';
import 'package:intesasoft/view_models/home_vm.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

@override
  void initState() {
    super.initState();
    Provider.of<CitiesViewModel>(context, listen: false).getCities();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer:drawer,
      appBar: appBar,
      
    );

  }
  Widget get drawer => Drawer(
    child: Container(color: Colors.red),
  );
      PreferredSizeWidget get appBar => AppBar(
        title:  Image.asset(
                    'assets/intesasoft_logo.png',
                    height: 30,
                    width: 30,
                  ),
      );

}