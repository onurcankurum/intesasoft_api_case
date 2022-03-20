import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import '../utils/enums.dart';
import '../view_models/city_detailed_vm.dart';
import '../widgets/cards/white_surface.dart';
import '../widgets/others/appbar.dart';


class CityDetailed extends StatefulWidget {
  final String cityId;
  const CityDetailed({Key? key, required this.cityId}) : super(key: key);

  @override
  State<CityDetailed> createState() => _CityDetailedState();
}

class _CityDetailedState extends State<CityDetailed> {
  late CityDetailedViewModel viewModel;
  double width = 0;
  double height = 0;

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<CityDetailedViewModel>(context, listen: false);
    viewModel.getCityById(widget.cityId);
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: MyAppBar(),
      body: isSearching,
    );
  }

  Widget get isSearching =>
      Provider.of<CityDetailedViewModel>(context, listen: true).loadingStatus ==
              LoadingStatus.searching
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: body,
            ));

  Widget get body => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 2, child: header),
          Expanded(flex: 8, child: whitSurfaceColumn),
          const Expanded(
            flex: 1,
            child: SizedBox()
          )
        ],
      );
  Widget get header => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            const SizedBox(height: 30,),
          Text(viewModel.city!.name,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 30),),
          Text("Güncel Nüfus ${viewModel.city!.populations!.first.population}",style: const TextStyle(fontWeight: FontWeight.w200,fontSize: 15)),
     
        ],
      );

  Widget get whitSurfaceColumn => WhiteSurface(
        elevation: 0,
        isBottomCircular: true,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(children: [
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(flex: 17, child: image),
            const Expanded(
              flex: 3,
              child: SizedBox(),
            ),
            Expanded(flex: 7, child: description),
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Expanded(flex: 5, child: mapButton),
            const Expanded(
              flex: 3,
              child: SizedBox(),
            ),
          ]),
        ),
      );

  Widget get image => ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            viewModel.city!.image == null
                ? Constants.noImgUrl
                : viewModel.city!.image!,
            fit: BoxFit.fitHeight,
          ),
        ),
      );
  Widget get description => Scrollbar(
        child: SingleChildScrollView(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: viewModel.city!.description!,
                style: const TextStyle(color: Colors.black)),
          ),
        ),
      );
  Widget get mapButton => ElevatedButton(
      onPressed: () {},
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: const Text("Haritada Görüntüle"),
      ));
}
