import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

import '../view_models/cities_list_vm.dart';
import '../widgets/drawer_widgets/drawer_list_tile.dart';
import '../widgets/drawer_widgets/drawer_text_field.dart';
import '../widgets/cards/white_surface.dart';
import '../widgets/others/appbar.dart';
import '../widgets/others/city_list_tile.dart';
import '../widgets/others/search_city_text_field.dart';

class CitiesList extends StatefulWidget {
  const CitiesList({Key? key}) : super(key: key);

  @override
  State<CitiesList> createState() => _CitiesListState();
}

class _CitiesListState extends State<CitiesList> {
  late CitiesListViewModel viewModel;
  TextEditingController filterController = TextEditingController(text:"");

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
     filterController.text = barcodeScanRes;
     viewModel.filterCities(barcodeScanRes);
  }


  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<CitiesListViewModel>(context, listen: false);
    viewModel.getCities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: drawer, appBar: MyAppBar(), body: body);
  }

  Widget get drawer => Drawer(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: drawerListTile,
      ));
  Widget get body => isSearching;

  Widget get isSearching =>
      Provider.of<CitiesListViewModel>(context, listen: true).loadingStatus !=
              LoadingStatus.searching
          ? Padding(
              padding: const EdgeInsets.only(right: 30, left: 30, top: 30),
              child: whiteSurfaceCities)
          : const Center(child: CircularProgressIndicator());

  Widget get whiteSurfaceCities => WhiteSurface(
      isBottomCircular: false,
      elevation: 1,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          searchCityTextField,
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            height: 40,
            width: double.infinity,
            color: Colors.red,
            child: const Text(
              "??ehirler",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Flexible(child: listView),
        ],
      ));
  Widget get searchCityTextField => Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SearchCityTextField(
                controller: filterController,
                onChange: viewModel.filterCities,
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: (IconButton(
                  onPressed: ()async {
                   await scanQR();
                  },
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    size: 35,
                  ))))
        ],
      );

  Widget get listView => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView.separated(
          itemCount: viewModel.filteredCities.length,
          itemBuilder: (BuildContext context, int index) {
            return CityListTile(model: viewModel.filteredCities[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.red[200],
              endIndent: 20,
              indent: 20,
            );
          },
        ),
      );
  Widget get drawerListTile => ListView(children: [
        Text(
          "  Onur Can Kurum",
          style: TextStyle(
              color: Theme.of(context).primaryColorDark, fontSize: 30),
        ),
        const SizedBox(
          height: 25,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: DrawerTextField(),
        ),
        const DrawerListTile(icon: Icons.crop_sharp, title: "Ana Ekran"),
        const DrawerListTile(
            icon: Icons.quick_contacts_dialer_outlined, title: "Profilim"),
        const DrawerListTile(icon: Icons.group_add_outlined, title: "Davet Et"),
        const DrawerListTile(
            icon: Icons.list_alt_outlined, title: "??ehir Listesi"),
        const DrawerListTile(icon: Icons.map_outlined, title: "??lkeler"),
        const DrawerListTile(icon: Icons.exit_to_app_outlined, title: "????k????"),
      ]);
}
